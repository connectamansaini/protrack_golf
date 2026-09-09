import 'package:flutter_test/flutter_test.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/locations/locations.dart';
import 'package:protrack_golf/src/sessions/sessions.dart';

import '../../helpers/fake_locations_repository.dart';
import '../../helpers/fake_sessions_repository.dart';

/// Lets queued events run to completion. The fakes are in-memory, so a
/// short yield is plenty.
Future<void> settle() => Future<void>.delayed(const Duration(milliseconds: 20));

void main() {
  const dwarka = Location(id: 'dwarka', name: 'Dwarka Golf Range');
  const qutub = Location(id: 'qutub', name: 'Qutub Golf Course');

  final lastSession = PracticeSession(
    id: 'last',
    date: DateTime(2026, 9),
    locationId: 'dwarka',
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
  );

  setUp(() {
    locations = FakeLocationsRepository([dwarka]);
    sessions = FakeSessionsRepository([lastSession]);
  });

  group('RangeLoggerBloc setup', () {
    test('loads locations, pre-selects the only one, and remembers the last '
        'session clubs', () async {
      final bloc = build()..add(const RangeLoggerStarted());
      await settle();

      expect(bloc.state.availableLocations, [dwarka]);
      expect(bloc.state.selectedLocationId, 'dwarka');
      expect(bloc.state.lastSessionClubs, {
        GolfClub.driver,
        GolfClub.pitchingWedge,
      });
      await bloc.close();
    });

    test('does not pre-select when there are several locations', () async {
      locations = FakeLocationsRepository([dwarka, qutub]);
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
      final bloc = await started()..add(const RangeLoggerShotLogged(0));
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
      expect(saved.locationId, 'dwarka');
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
      final bloc = await started()..add(const RangeLoggerFinished());
      await settle();

      expect(bloc.state.submitStatus, isA<AppStatusInitial<SessionsFailure>>());
      expect(bloc.state.savedSession, isNull);
      await bloc.close();
    });
  });
}
