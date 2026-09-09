import 'package:flutter_test/flutter_test.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/my_bag/my_bag.dart';
import 'package:protrack_golf/src/sessions/sessions.dart';

import '../../helpers/fake_my_bag_repository.dart';
import '../../helpers/fake_sessions_repository.dart';

void main() {
  group('GetClubDistanceRecordsUsecase', () {
    final older = PracticeSession(
      id: 'older',
      date: DateTime(2026, 8, 2),
      clubEntries: const [
        ClubEntry(club: GolfClub.iron7, distances: [140, 150]),
        // `club` defaults to GolfClub.driver.
        ClubEntry(distances: [200]),
        ClubEntry(club: GolfClub.putter),
      ],
    );
    final newer = PracticeSession(
      id: 'newer',
      date: DateTime(2026, 8, 15),
      clubEntries: const [
        ClubEntry(club: GolfClub.iron7, distances: [160]),
      ],
    );

    test(
      'returns an empty list when nothing has been logged or added',
      () async {
        final usecase = GetClubDistanceRecordsUsecase(
          FakeSessionsRepository(const []),
          FakeMyBagRepository(),
        );

        final result = await usecase();

        expect(result.isRight(), isTrue);
        expect(result.getOrElse(() => throw StateError('left')), isEmpty);
      },
    );

    test('aggregates shots per club across sessions in bag order', () async {
      final usecase = GetClubDistanceRecordsUsecase(
        FakeSessionsRepository([older, newer]),
        FakeMyBagRepository(),
      );

      final result = await usecase();
      final records = result.getOrElse(() => throw StateError('left'));

      expect(records.map((r) => r.club), [GolfClub.driver, GolfClub.iron7]);

      final iron7 = records.last;
      expect(iron7.shotCount, 3);
      expect(iron7.sessionCount, 2);
      expect(iron7.averageYds, closeTo(150, 0.001));
      expect(iron7.bestYds, 160);
      expect(iron7.latestYds, 160);
      expect(iron7.inBag, isFalse);
      expect(iron7.manualDistanceYds, 0);

      final driver = records.first;
      expect(driver.shotCount, 1);
      expect(driver.sessionCount, 1);
      expect(driver.latestYds, 200);
    });

    test('unions bag clubs with session clubs, keeping bag order', () async {
      final usecase = GetClubDistanceRecordsUsecase(
        FakeSessionsRepository([older, newer]),
        FakeMyBagRepository([
          BagClub(
            club: GolfClub.sandWedge,
            distanceYds: 80,
            addedAt: DateTime(2026, 8),
          ),
          BagClub(
            club: GolfClub.iron7,
            distanceYds: 155,
            addedAt: DateTime(2026, 8),
          ),
          BagClub(club: GolfClub.wood3, addedAt: DateTime(2026, 8)),
        ]),
      );

      final result = await usecase();
      final records = result.getOrElse(() => throw StateError('left'));

      expect(records.map((r) => r.club), [
        GolfClub.driver,
        GolfClub.wood3,
        GolfClub.iron7,
        GolfClub.sandWedge,
      ]);

      // Session-only club: not in the bag, no manual distance.
      final driver = records[0];
      expect(driver.inBag, isFalse);
      expect(driver.hasManualDistance, isFalse);
      expect(driver.hasSessionData, isTrue);

      // Bag-only club with no distance set: zeros everywhere, still listed.
      final wood3 = records[1];
      expect(wood3.inBag, isTrue);
      expect(wood3.manualDistanceYds, 0);
      expect(wood3.shotCount, 0);
      expect(wood3.sessionCount, 0);
      expect(wood3.averageYds, 0);
      expect(wood3.hasSessionData, isFalse);

      // Club in both: computed stats plus the manual distance.
      final iron7 = records[2];
      expect(iron7.inBag, isTrue);
      expect(iron7.manualDistanceYds, 155);
      expect(iron7.shotCount, 3);
      expect(iron7.averageYds, closeTo(150, 0.001));

      // Bag-only club with a distance.
      final sandWedge = records[3];
      expect(sandWedge.inBag, isTrue);
      expect(sandWedge.manualDistanceYds, 80);
      expect(sandWedge.hasManualDistance, isTrue);
      expect(sandWedge.shotCount, 0);
    });
  });
}
