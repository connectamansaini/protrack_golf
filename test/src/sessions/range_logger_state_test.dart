import 'package:flutter_test/flutter_test.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/sessions/sessions.dart';

void main() {
  group('RangeLoggerState', () {
    test('folds shots into one ClubEntry per club in bag order', () {
      const state = RangeLoggerState(
        bucketSize: 25,
        shots: [
          RangeShot(club: GolfClub.iron7, distanceYds: 140),
          // `club` defaults to GolfClub.driver.
          RangeShot(distanceYds: 210),
          RangeShot(club: GolfClub.iron7, distanceYds: 150),
        ],
      );

      final entries = state.clubEntries;

      expect(entries.map((e) => e.club), [GolfClub.driver, GolfClub.iron7]);
      expect(entries.last.distances, [140, 150]);
      expect(state.shotCount, 3);
      expect(state.ballsRemaining, 22);
      expect(state.canFinish, isTrue);
    });

    test('keeps practice distances out of the yardage list', () {
      const state = RangeLoggerState(
        shots: [
          RangeShot(
            club: GolfClub.iron7,
            distanceYds: 90,
            intent: ShotIntent.practice,
          ),
          RangeShot(club: GolfClub.iron7, distanceYds: 140),
          RangeShot(
            club: GolfClub.pitchingWedge,
            distanceYds: 60,
            intent: ShotIntent.practice,
          ),
        ],
      );

      final entries = state.clubEntries;

      expect(entries.map((e) => e.club), [
        GolfClub.iron7,
        GolfClub.pitchingWedge,
      ]);
      expect(entries.first.distances, [140]);
      expect(entries.first.practiceDistances, [90]);
      expect(entries.last.distances, isEmpty);
      expect(entries.last.practiceDistances, [60]);
      expect(state.practiceShotCount, 2);
      expect(state.selectedClubAverageYds, 140);
      expect(state.shotCountsByClub[GolfClub.iron7], 2);
    });

    test('never reports negative balls remaining', () {
      const state = RangeLoggerState(
        bucketSize: 1,
        shots: [
          RangeShot(club: GolfClub.iron7, distanceYds: 140),
          RangeShot(club: GolfClub.iron7, distanceYds: 150),
        ],
      );

      expect(state.ballsRemaining, 0);
    });

    test('cannot start logging without a location', () {
      const state = RangeLoggerState();

      expect(state.canStartLogging, isFalse);
      expect(state.copyWith(selectedLocationId: 'loc').canStartLogging, isTrue);
      expect(state.canFinish, isFalse);
    });
  });
}
