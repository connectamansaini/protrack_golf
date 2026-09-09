import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/locations/locations.dart';
import 'package:protrack_golf/src/sessions/entities/club_entry.dart';
import 'package:protrack_golf/src/sessions/entities/practice_session.dart';
import 'package:protrack_golf/src/sessions/entities/range_shot.dart';
import 'package:protrack_golf/src/sessions/helpers/range_logger_step.dart';
import 'package:protrack_golf/src/sessions/helpers/sessions_status.dart';
import 'package:protrack_golf/src/sessions/usecases/get_sessions_usecase.dart';
import 'package:protrack_golf/src/sessions/usecases/log_session_usecase.dart';

part 'range_logger_event.dart';
part 'range_logger_state.dart';

/// Drives the shot-by-shot range logger: a quick setup step (location and
/// bucket size), then one tap per shot until the golfer finishes, at which
/// point the shots are folded into `ClubEntry`s and saved as a regular
/// `PracticeSession`.
///
/// Depends on the locations feature's domain layer (its usecases) as a
/// cross-feature dependency, per the architecture spec.
class RangeLoggerBloc extends Bloc<RangeLoggerEvent, RangeLoggerState> {
  RangeLoggerBloc(
    this._getLocations,
    this._addLocation,
    this._logSession,
    this._getSessions,
  ) : super(const RangeLoggerState()) {
    on<RangeLoggerStarted>(_onStarted);
    on<RangeLoggerLocationSelected>(_onLocationSelected);
    on<RangeLoggerLocationAdded>(_onLocationAdded);
    on<RangeLoggerBucketSizeChanged>(_onBucketSizeChanged);
    on<RangeLoggerSetupCompleted>(_onSetupCompleted);
    on<RangeLoggerLastClubsApplied>(_onLastClubsApplied);
    on<RangeLoggerClubsCleared>(_onClubsCleared);
    on<RangeLoggerClubToggled>(_onClubToggled);
    on<RangeLoggerClubSelected>(_onClubSelected);
    on<RangeLoggerDistanceChanged>(_onDistanceChanged);
    on<RangeLoggerShotLogged>(_onShotLogged);
    on<RangeLoggerLastShotUndone>(_onLastShotUndone);
    on<RangeLoggerNotesChanged>(_onNotesChanged);
    on<RangeLoggerFinished>(_onFinished);
  }

  final GetLocationsUsecase _getLocations;
  final AddLocationUsecase _addLocation;
  final LogSessionUsecase _logSession;
  final GetSessionsUsecase _getSessions;

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
    emit(state.copyWith(lastSessionClubs: lastClubs));
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
    emit(state.copyWith(bucketSize: event.bucketSize));
  }

  Future<void> _onSetupCompleted(
    RangeLoggerSetupCompleted event,
    Emitter<RangeLoggerState> emit,
  ) async {
    if (!state.canStartLogging) return;
    emit(
      state.copyWith(
        step: RangeLoggerStep.logging,
        selectedClub: state.sessionClubs.contains(state.selectedClub)
            ? state.selectedClub
            : state.sessionClubs.first,
      ),
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
      state.copyWith(
        sessionClubs: ordered,
        selectedClub: ordered.contains(state.selectedClub)
            ? state.selectedClub
            : ordered.first,
      ),
    );
  }

  Future<void> _onClubsCleared(
    RangeLoggerClubsCleared event,
    Emitter<RangeLoggerState> emit,
  ) async {
    emit(state.copyWith(sessionClubs: const {}));
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
      state.copyWith(
        sessionClubs: ordered,
        selectedClub: ordered.contains(state.selectedClub) || ordered.isEmpty
            ? state.selectedClub
            : ordered.first,
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

  Future<void> _onShotLogged(
    RangeLoggerShotLogged event,
    Emitter<RangeLoggerState> emit,
  ) async {
    if (event.distanceYds <= 0) return;
    emit(
      state.copyWith(
        shots: [
          ...state.shots,
          RangeShot(club: state.selectedClub, distanceYds: event.distanceYds),
        ],
        lastDistanceByClub: {
          ...state.lastDistanceByClub,
          state.selectedClub: event.distanceYds.round(),
        },
      ),
    );
  }

  Future<void> _onLastShotUndone(
    RangeLoggerLastShotUndone event,
    Emitter<RangeLoggerState> emit,
  ) async {
    if (state.shots.isEmpty) return;
    emit(
      state.copyWith(shots: state.shots.sublist(0, state.shots.length - 1)),
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
