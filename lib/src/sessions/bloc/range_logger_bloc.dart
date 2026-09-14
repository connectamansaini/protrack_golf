import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/locations/locations.dart';
import 'package:protrack_golf/src/plans/entities/plan_phase.dart';
import 'package:protrack_golf/src/plans/entities/session_plan.dart';
import 'package:protrack_golf/src/plans/entities/session_template.dart';
import 'package:protrack_golf/src/plans/usecases/build_session_plan_usecase.dart';
import 'package:protrack_golf/src/plans/usecases/get_session_templates_usecase.dart';
import 'package:protrack_golf/src/sessions/entities/club_entry.dart';
import 'package:protrack_golf/src/sessions/entities/practice_session.dart';
import 'package:protrack_golf/src/sessions/entities/range_shot.dart';
import 'package:protrack_golf/src/sessions/helpers/range_logger_step.dart';
import 'package:protrack_golf/src/sessions/helpers/sessions_status.dart';
import 'package:protrack_golf/src/sessions/usecases/get_sessions_usecase.dart';
import 'package:protrack_golf/src/sessions/usecases/log_session_usecase.dart';

part 'range_logger_event.dart';
part 'range_logger_state.dart';

/// Drives the shot-by-shot range logger: a quick setup step (location,
/// clubs, bucket size and an optional session plan), then one tap per shot
/// until the golfer finishes, at which point the shots are folded into
/// `ClubEntry`s and saved as a regular `PracticeSession`.
///
/// With a plan, the bloc tracks which phase the golfer is in, moves on
/// automatically when a phase's balls are used up, and sets the next
/// ball's practice/full intent to match the phase. The golfer can always
/// override the intent or skip between phases.
///
/// Depends on the locations and plans features' domain layers (their
/// usecases) as cross-feature dependencies, per the architecture spec.
class RangeLoggerBloc extends Bloc<RangeLoggerEvent, RangeLoggerState> {
  RangeLoggerBloc(
    this._getLocations,
    this._addLocation,
    this._logSession,
    this._getSessions,
    this._getTemplates,
    this._buildPlan,
  ) : super(const RangeLoggerState()) {
    on<RangeLoggerStarted>(_onStarted);
    on<RangeLoggerLocationSelected>(_onLocationSelected);
    on<RangeLoggerLocationAdded>(_onLocationAdded);
    on<RangeLoggerBucketSizeChanged>(_onBucketSizeChanged);
    on<RangeLoggerTemplateSelected>(_onTemplateSelected);
    on<RangeLoggerSetupCompleted>(_onSetupCompleted);
    on<RangeLoggerLastClubsApplied>(_onLastClubsApplied);
    on<RangeLoggerClubsCleared>(_onClubsCleared);
    on<RangeLoggerClubToggled>(_onClubToggled);
    on<RangeLoggerClubSelected>(_onClubSelected);
    on<RangeLoggerDistanceChanged>(_onDistanceChanged);
    on<RangeLoggerIntentChanged>(_onIntentChanged);
    on<RangeLoggerShotLogged>(_onShotLogged);
    on<RangeLoggerLastShotUndone>(_onLastShotUndone);
    on<RangeLoggerPhaseAdvanced>(_onPhaseAdvanced);
    on<RangeLoggerPhaseRewound>(_onPhaseRewound);
    on<RangeLoggerNotesChanged>(_onNotesChanged);
    on<RangeLoggerFinished>(_onFinished);
  }

  final GetLocationsUsecase _getLocations;
  final AddLocationUsecase _addLocation;
  final LogSessionUsecase _logSession;
  final GetSessionsUsecase _getSessions;
  final GetSessionTemplatesUsecase _getTemplates;
  final BuildSessionPlanUsecase _buildPlan;

  Future<void> _onStarted(
    RangeLoggerStarted event,
    Emitter<RangeLoggerState> emit,
  ) async {
    emit(state.copyWith(locationsStatus: const LocationsStatus.loading()));
    // The most recent session's clubs become a one-tap preset; if sessions
    // can't be read the preset simply stays unavailable.
    final sessionsResult = await _getSessions();
    final lastClubs = sessionsResult.fold(
      (_) => const <GolfClub>{},
      (sessions) => sessions.isEmpty
          ? const <GolfClub>{}
          : {for (final entry in sessions.first.clubEntries) entry.club},
    );
    emit(
      state.copyWith(
        lastSessionClubs: lastClubs,
        templates: _getTemplates().getOrElse(() => const []),
      ),
    );
    final result = await _getLocations();
    emit(
      result.fold(
        (failure) =>
            state.copyWith(locationsStatus: LocationsStatus.failure(failure)),
        (locations) => state.copyWith(
          locationsStatus: locations.isEmpty
              ? const LocationsStatus.empty()
              : const LocationsStatus.success(),
          availableLocations: locations,
          // Pre-select the only location so a regular at one range can
          // start logging with a single tap.
          selectedLocationId: locations.length == 1
              ? locations.first.id
              : state.selectedLocationId,
        ),
      ),
    );
  }

  Future<void> _onLocationSelected(
    RangeLoggerLocationSelected event,
    Emitter<RangeLoggerState> emit,
  ) async {
    emit(state.copyWith(selectedLocationId: event.locationId));
  }

  Future<void> _onLocationAdded(
    RangeLoggerLocationAdded event,
    Emitter<RangeLoggerState> emit,
  ) async {
    final result = await _addLocation(name: event.name, notes: event.notes);
    result.fold(
      (failure) => emit(
        state.copyWith(locationsStatus: LocationsStatus.failure(failure)),
      ),
      (location) => emit(
        state.copyWith(
          availableLocations: [...state.availableLocations, location],
          selectedLocationId: location.id,
          locationsStatus: const LocationsStatus.success(),
        ),
      ),
    );
  }

  Future<void> _onBucketSizeChanged(
    RangeLoggerBucketSizeChanged event,
    Emitter<RangeLoggerState> emit,
  ) async {
    emit(_withPlan(state.copyWith(bucketSize: event.bucketSize)));
  }

  Future<void> _onTemplateSelected(
    RangeLoggerTemplateSelected event,
    Emitter<RangeLoggerState> emit,
  ) async {
    emit(_withPlan(state.copyWith(selectedTemplateId: event.templateId)));
  }

  /// Rebuilds the plan for [next]'s template, clubs and bucket. Any change
  /// to those three goes through here so the plan preview never goes stale.
  /// Synchronous: handlers run concurrently, so yielding between reading
  /// `state` and emitting would let another handler's update be lost.
  RangeLoggerState _withPlan(RangeLoggerState next) {
    final template = next.templates
        .where((t) => t.id == next.selectedTemplateId)
        .firstOrNull;
    if (template == null) {
      return next.copyWith(clearPlan: true, planMessage: '');
    }
    final result = _buildPlan(
      template: template,
      clubs: next.sessionClubs,
      ballCount: next.bucketSize,
    );
    return result.fold(
      (failure) => next.copyWith(clearPlan: true, planMessage: failure.message),
      (plan) => next.copyWith(plan: plan, planMessage: ''),
    );
  }

  Future<void> _onSetupCompleted(
    RangeLoggerSetupCompleted event,
    Emitter<RangeLoggerState> emit,
  ) async {
    if (!state.canStartLogging) return;
    final firstPhase = state.plan?.phases.firstOrNull;
    emit(
      _enterPhase(
        state.copyWith(step: RangeLoggerStep.logging),
        index: 0,
        fallbackClub: state.sessionClubs.contains(state.selectedClub)
            ? state.selectedClub
            : state.sessionClubs.first,
        phase: firstPhase,
      ),
    );
  }

  /// Moves into phase [index]: resets its ball count, and points the club
  /// and intent at what the phase asks for (or [fallbackClub] with a full
  /// swing when there is no plan).
  RangeLoggerState _enterPhase(
    RangeLoggerState base, {
    required int index,
    required GolfClub fallbackClub,
    PlanPhase? phase,
  }) {
    final club = phase?.clubs.firstOrNull ?? fallbackClub;
    return base.copyWith(
      phaseIndex: index,
      phaseShots: 0,
      selectedClub: club,
      pendingIntent: phase?.intent ?? ShotIntent.full,
      pendingDistanceYds:
          base.lastDistanceByClub[club] ?? base.pendingDistanceYds,
    );
  }

  Future<void> _onLastClubsApplied(
    RangeLoggerLastClubsApplied event,
    Emitter<RangeLoggerState> emit,
  ) async {
    if (state.lastSessionClubs.isEmpty) return;
    final ordered = {
      for (final club in GolfClub.values)
        if (state.lastSessionClubs.contains(club)) club,
    };
    emit(
      _withPlan(
        state.copyWith(
          sessionClubs: ordered,
          selectedClub: ordered.contains(state.selectedClub)
              ? state.selectedClub
              : ordered.first,
        ),
      ),
    );
  }

  Future<void> _onClubsCleared(
    RangeLoggerClubsCleared event,
    Emitter<RangeLoggerState> emit,
  ) async {
    emit(_withPlan(state.copyWith(sessionClubs: const {})));
  }

  Future<void> _onClubToggled(
    RangeLoggerClubToggled event,
    Emitter<RangeLoggerState> emit,
  ) async {
    final clubs = {...state.sessionClubs};
    if (!clubs.remove(event.club)) clubs.add(event.club);
    // Keep the bag-ordered set so the logging chips never jump around.
    final ordered = {
      for (final club in GolfClub.values)
        if (clubs.contains(club)) club,
    };
    emit(
      _withPlan(
        state.copyWith(
          sessionClubs: ordered,
          selectedClub: ordered.contains(state.selectedClub) || ordered.isEmpty
              ? state.selectedClub
              : ordered.first,
        ),
      ),
    );
  }

  Future<void> _onClubSelected(
    RangeLoggerClubSelected event,
    Emitter<RangeLoggerState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedClub: event.club,
        pendingDistanceYds:
            state.lastDistanceByClub[event.club] ?? state.pendingDistanceYds,
      ),
    );
  }

  Future<void> _onDistanceChanged(
    RangeLoggerDistanceChanged event,
    Emitter<RangeLoggerState> emit,
  ) async {
    emit(state.copyWith(pendingDistanceYds: event.distanceYds));
  }

  Future<void> _onIntentChanged(
    RangeLoggerIntentChanged event,
    Emitter<RangeLoggerState> emit,
  ) async {
    emit(state.copyWith(pendingIntent: event.intent));
  }

  Future<void> _onShotLogged(
    RangeLoggerShotLogged event,
    Emitter<RangeLoggerState> emit,
  ) async {
    if (event.distanceYds <= 0) return;
    final logged = state.copyWith(
      shots: [
        ...state.shots,
        RangeShot(
          club: state.selectedClub,
          distanceYds: event.distanceYds,
          intent: state.pendingIntent,
        ),
      ],
      lastDistanceByClub: {
        ...state.lastDistanceByClub,
        state.selectedClub: event.distanceYds.round(),
      },
      phaseShots: state.phaseShots + 1,
    );
    final phase = logged.currentPhase;
    // The phase's balls are used up: roll into the next one automatically
    // so the golfer never has to look up from the ball.
    final phaseDone =
        phase != null &&
        logged.phaseShots >= phase.ballCount &&
        !logged.isLastPhase;
    emit(
      phaseDone
          ? _enterPhase(
              logged,
              index: logged.phaseIndex + 1,
              fallbackClub: logged.selectedClub,
              phase: logged.plan!.phases[logged.phaseIndex + 1],
            )
          : logged,
    );
  }

  Future<void> _onLastShotUndone(
    RangeLoggerLastShotUndone event,
    Emitter<RangeLoggerState> emit,
  ) async {
    if (state.shots.isEmpty) return;
    emit(
      state.copyWith(
        shots: state.shots.sublist(0, state.shots.length - 1),
        phaseShots: state.phaseShots > 0 ? state.phaseShots - 1 : 0,
      ),
    );
  }

  Future<void> _onPhaseAdvanced(
    RangeLoggerPhaseAdvanced event,
    Emitter<RangeLoggerState> emit,
  ) async {
    final plan = state.plan;
    if (plan == null || state.isLastPhase) return;
    emit(
      _enterPhase(
        state,
        index: state.phaseIndex + 1,
        fallbackClub: state.selectedClub,
        phase: plan.phases[state.phaseIndex + 1],
      ),
    );
  }

  Future<void> _onPhaseRewound(
    RangeLoggerPhaseRewound event,
    Emitter<RangeLoggerState> emit,
  ) async {
    final plan = state.plan;
    if (plan == null || state.isFirstPhase) return;
    emit(
      _enterPhase(
        state,
        index: state.phaseIndex - 1,
        fallbackClub: state.selectedClub,
        phase: plan.phases[state.phaseIndex - 1],
      ),
    );
  }

  Future<void> _onNotesChanged(
    RangeLoggerNotesChanged event,
    Emitter<RangeLoggerState> emit,
  ) async {
    emit(state.copyWith(notes: event.notes));
  }

  Future<void> _onFinished(
    RangeLoggerFinished event,
    Emitter<RangeLoggerState> emit,
  ) async {
    if (!state.canFinish) return;
    emit(state.copyWith(submitStatus: const SessionsStatus.loading()));
    final session = PracticeSession(
      date: DateTime.now(),
      locationId: state.selectedLocationId,
      bucketSize: state.bucketSize,
      clubEntries: state.clubEntries,
      notes: state.notes,
      planName: state.plan?.templateName ?? '',
    );
    final result = await _logSession(session);
    emit(
      result.fold(
        (failure) =>
            state.copyWith(submitStatus: SessionsStatus.failure(failure)),
        (saved) => state.copyWith(
          submitStatus: const SessionsStatus.success(),
          savedSession: saved,
        ),
      ),
    );
  }
}
