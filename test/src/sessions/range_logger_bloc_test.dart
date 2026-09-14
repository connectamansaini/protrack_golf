import 'package:flutter_test/flutter_test.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/locations/locations.dart';
import 'package:protrack_golf/src/plans/plans.dart';
import 'package:protrack_golf/src/sessions/sessions.dart';

import '../../helpers/fake_locations_repository.dart';
import '../../helpers/fake_sessions_repository.dart';

/// Lets queued events run to completion. The fakes are in-memory, so a
/// short yield is plenty.
Future<void> settle() => Future<void>.delayed(const Duration(milliseconds: 20));

void main() {
  const riverside = Location(id: 'riverside', name: 'Riverside Driving Range');
  const hilltop = Location(id: 'hilltop', name: 'Hilltop Golf Club');

  final lastSession = PracticeSession(
    id: 'last',
    date: DateTime(2026, 9),
    locationId: 'riverside',
    clubEntries: const [
      ClubEntry(club: GolfClub.pitchingWedge, distances: [90]),
      ClubEntry(distances: [210]),
    ],
  );

  late FakeLocationsRepository locations;
  late FakeSessionsRepository sessions;

  RangeLoggerBloc build() => RangeLoggerBloc(
    GetLocationsUsecase(locations),
    AddLocationUsecase(locations),
    LogSessionUsecase(sessions),
    GetSessionsUsecase(sessions),
    const GetSessionTemplatesUsecase(),
    const BuildSessionPlanUsecase(),
  );

  setUp(() {
    locations = FakeLocationsRepository([riverside]);
    sessions = FakeSessionsRepository([lastSession]);
  });

  group('RangeLoggerBloc setup', () {
    test('loads locations, pre-selects the only one, and remembers the last '
        'session clubs', () async {
      final bloc = build()..add(const RangeLoggerStarted());
      await settle();

      expect(bloc.state.availableLocations, [riverside]);
      expect(bloc.state.selectedLocationId, 'riverside');
      expect(bloc.state.lastSessionClubs, {
        GolfClub.driver,
        GolfClub.pitchingWedge,
      });
      await bloc.close();
    });

    test('does not pre-select when there are several locations', () async {
      locations = FakeLocationsRepository([riverside, hilltop]);
      final bloc = build()..add(const RangeLoggerStarted());
      await settle();

      expect(bloc.state.selectedLocationId, isEmpty);
      expect(bloc.state.canStartLogging, isFalse);
      await bloc.close();
    });

    test('toggling clubs keeps bag order and moves the selection off a '
        'removed club', () async {
      final bloc = build()
        ..add(const RangeLoggerStarted())
        ..add(const RangeLoggerClubToggled(GolfClub.driver));
      await settle();

      expect(bloc.state.sessionClubs.toList(), [
        GolfClub.driver,
        GolfClub.iron7,
      ]);
      expect(bloc.state.selectedClub, GolfClub.iron7);

      bloc.add(const RangeLoggerClubToggled(GolfClub.iron7));
      await settle();

      expect(bloc.state.sessionClubs.toList(), [GolfClub.driver]);
      expect(bloc.state.selectedClub, GolfClub.driver);
      await bloc.close();
    });

    test('"same as last time" applies the previous session clubs', () async {
      final bloc = build()
        ..add(const RangeLoggerStarted())
        ..add(const RangeLoggerLastClubsApplied());
      await settle();

      expect(bloc.state.sessionClubs.toList(), [
        GolfClub.driver,
        GolfClub.pitchingWedge,
      ]);
      expect(bloc.state.selectedClub, GolfClub.driver);
      await bloc.close();
    });

    test('clearing clubs blocks starting until one is chosen', () async {
      final bloc = build()
        ..add(const RangeLoggerStarted())
        ..add(const RangeLoggerClubsCleared());
      await settle();

      expect(bloc.state.canStartLogging, isFalse);

      bloc
        ..add(const RangeLoggerClubToggled(GolfClub.iron8))
        ..add(const RangeLoggerSetupCompleted());
      await settle();

      expect(bloc.state.step, RangeLoggerStep.logging);
      expect(bloc.state.selectedClub, GolfClub.iron8);
      await bloc.close();
    });
  });

  group('RangeLoggerBloc logging', () {
    Future<RangeLoggerBloc> started() async {
      final bloc = build()
        ..add(const RangeLoggerStarted())
        ..add(const RangeLoggerClubToggled(GolfClub.driver))
        ..add(const RangeLoggerBucketSizeChanged(25))
        ..add(const RangeLoggerSetupCompleted());
      await settle();
      return bloc;
    }

    test('records shots against the selected club and counts down', () async {
      final bloc = await started();
      bloc
        ..add(const RangeLoggerDistanceChanged(120))
        ..add(const RangeLoggerShotLogged(120))
        ..add(const RangeLoggerShotLogged(120));
      await settle();

      expect(bloc.state.shotCount, 2);
      expect(bloc.state.ballsRemaining, 23);
      expect(bloc.state.shotCountsByClub, {GolfClub.iron7: 2});
      expect(bloc.state.selectedClubAverageYds, 120);
      await bloc.close();
    });

    test('remembers the last distance per club when switching', () async {
      final bloc = await started();
      bloc
        ..add(const RangeLoggerDistanceChanged(120))
        ..add(const RangeLoggerShotLogged(120))
        ..add(const RangeLoggerClubSelected(GolfClub.driver))
        ..add(const RangeLoggerDistanceChanged(210))
        ..add(const RangeLoggerShotLogged(210))
        ..add(const RangeLoggerClubSelected(GolfClub.iron7));
      await settle();

      expect(bloc.state.pendingDistanceYds, 120);

      bloc.add(const RangeLoggerClubSelected(GolfClub.driver));
      await settle();

      expect(bloc.state.pendingDistanceYds, 210);
      await bloc.close();
    });

    test('undo removes only the most recent shot', () async {
      final bloc = await started();
      bloc
        ..add(const RangeLoggerShotLogged(100))
        ..add(const RangeLoggerClubSelected(GolfClub.driver))
        ..add(const RangeLoggerShotLogged(200))
        ..add(const RangeLoggerLastShotUndone());
      await settle();

      expect(bloc.state.shots.map((s) => s.club), [GolfClub.iron7]);
      expect(bloc.state.canFinish, isTrue);

      bloc.add(const RangeLoggerLastShotUndone());
      await settle();

      expect(bloc.state.shots, isEmpty);
      expect(bloc.state.canFinish, isFalse);
      await bloc.close();
    });

    test('ignores non-positive distances', () async {
      final bloc = await started()
        ..add(const RangeLoggerShotLogged(0));
      await settle();

      expect(bloc.state.shots, isEmpty);
      await bloc.close();
    });

    test('finishing saves one club entry per club, in bag order', () async {
      final bloc = await started();
      bloc
        ..add(const RangeLoggerShotLogged(140))
        ..add(const RangeLoggerShotLogged(150))
        ..add(const RangeLoggerClubSelected(GolfClub.driver))
        ..add(const RangeLoggerShotLogged(220))
        ..add(const RangeLoggerNotesChanged('Windy'))
        ..add(const RangeLoggerFinished());
      await settle();

      expect(bloc.state.submitStatus, isA<AppStatusSuccess<SessionsFailure>>());
      final saved = bloc.state.savedSession!;
      expect(saved.locationId, 'riverside');
      expect(saved.bucketSize, 25);
      expect(saved.notes, 'Windy');
      expect(saved.clubEntries.map((e) => e.club), [
        GolfClub.driver,
        GolfClub.iron7,
      ]);
      expect(saved.clubEntries.last.distances, [140, 150]);

      final stored = await sessions.getSessions();
      expect(stored.getOrElse(() => []).length, 2);
      await bloc.close();
    });

    test('cannot finish with no shots', () async {
      final bloc = await started()
        ..add(const RangeLoggerFinished());
      await settle();

      expect(bloc.state.submitStatus, isA<AppStatusInitial<SessionsFailure>>());
      expect(bloc.state.savedSession, isNull);
      await bloc.close();
    });

    test('practice balls are saved apart from full-potential ones', () async {
      final bloc = await started();
      bloc
        ..add(const RangeLoggerIntentChanged(ShotIntent.practice))
        ..add(const RangeLoggerShotLogged(90))
        ..add(const RangeLoggerIntentChanged(ShotIntent.full))
        ..add(const RangeLoggerShotLogged(140))
        ..add(const RangeLoggerShotLogged(150))
        ..add(const RangeLoggerFinished());
      await settle();

      expect(bloc.state.practiceShotCount, 1);
      expect(bloc.state.fullShotCount, 2);
      // Only full shots feed the running average.
      expect(bloc.state.selectedClubAverageYds, 145);
      final entry = bloc.state.savedSession!.clubEntries.single;
      expect(entry.distances, [140, 150]);
      expect(entry.practiceDistances, [90]);
      expect(bloc.state.savedSession!.planName, isEmpty);
      await bloc.close();
    });
  });

  group('RangeLoggerBloc session plans', () {
    test('loads the template catalogue and starts on free practice', () async {
      final bloc = build()..add(const RangeLoggerStarted());
      await settle();

      expect(bloc.state.templates, SessionTemplates.all);
      expect(bloc.state.selectedTemplateId, isEmpty);
      expect(bloc.state.hasPlan, isFalse);
      await bloc.close();
    });

    test('builds a plan for the chosen template and keeps it in sync with '
        'clubs and bucket', () async {
      final bloc = build()
        ..add(const RangeLoggerStarted())
        ..add(const RangeLoggerBucketSizeChanged(100))
        ..add(const RangeLoggerTemplateSelected(SessionTemplates.focusedId));
      await settle();

      expect(bloc.state.plan?.templateName, 'Focused Practice');
      expect(bloc.state.plan?.totalBalls, 100);
      expect(bloc.state.plan?.phases.length, 5);

      bloc.add(const RangeLoggerBucketSizeChanged(25));
      await settle();

      // Too few balls for this template: the plan drops with a reason.
      expect(bloc.state.hasPlan, isFalse);
      expect(bloc.state.planMessage, contains('40'));
      expect(bloc.state.selectedTemplateId, SessionTemplates.focusedId);

      bloc.add(const RangeLoggerBucketSizeChanged(50));
      await settle();

      expect(bloc.state.plan?.totalBalls, 50);
      expect(bloc.state.planMessage, isEmpty);
      await bloc.close();
    });

    test('walks the phases: intent and club follow the plan, and a phase '
        'rolls over when its balls are used up', () async {
      final bloc = build()
        ..add(const RangeLoggerStarted())
        ..add(const RangeLoggerClubToggled(GolfClub.pitchingWedge))
        ..add(const RangeLoggerBucketSizeChanged(30))
        ..add(const RangeLoggerTemplateSelected(SessionTemplates.quickId))
        ..add(const RangeLoggerSetupCompleted());
      await settle();

      final plan = bloc.state.plan!;
      expect(plan.phases.map((p) => p.ballCount), [6, 12, 12]);
      expect(bloc.state.phaseIndex, 0);
      expect(bloc.state.pendingIntent, ShotIntent.practice);
      // Warm-up uses the shortest club brought.
      expect(bloc.state.selectedClub, GolfClub.pitchingWedge);

      for (var i = 0; i < 6; i++) {
        bloc.add(const RangeLoggerShotLogged(80));
      }
      await settle();

      expect(bloc.state.phaseIndex, 1);
      expect(bloc.state.phaseShots, 0);
      expect(bloc.state.selectedClub, GolfClub.iron7);
      expect(bloc.state.pendingIntent, ShotIntent.practice);
      expect(bloc.state.practiceShotCount, 6);

      bloc.add(const RangeLoggerPhaseAdvanced());
      await settle();

      expect(bloc.state.phaseIndex, 2);
      expect(bloc.state.isLastPhase, isTrue);
      expect(bloc.state.pendingIntent, ShotIntent.full);

      bloc.add(const RangeLoggerPhaseRewound());
      await settle();

      expect(bloc.state.phaseIndex, 1);
      expect(bloc.state.pendingIntent, ShotIntent.practice);
      await bloc.close();
    });

    test('the last phase never rolls over, and finishing records the plan '
        'name', () async {
      final bloc = build()
        ..add(const RangeLoggerStarted())
        ..add(const RangeLoggerBucketSizeChanged(20))
        ..add(const RangeLoggerTemplateSelected(SessionTemplates.dialInId))
        ..add(const RangeLoggerSetupCompleted())
        ..add(const RangeLoggerPhaseAdvanced());
      await settle();

      expect(bloc.state.isLastPhase, isTrue);
      for (var i = 0; i < 20; i++) {
        bloc.add(const RangeLoggerShotLogged(140));
      }
      bloc.add(const RangeLoggerFinished());
      await settle();

      expect(bloc.state.phaseIndex, 1);
      expect(bloc.state.savedSession?.planName, 'Dial In Distances');
      expect(bloc.state.savedSession?.fullShots, 20);
      await bloc.close();
    });
  });
}
