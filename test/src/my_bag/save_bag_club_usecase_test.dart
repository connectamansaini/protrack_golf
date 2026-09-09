import 'package:flutter_test/flutter_test.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/my_bag/my_bag.dart';

import '../../helpers/fake_my_bag_repository.dart';

void main() {
  group('SaveBagClubUsecase', () {
    test('adds a new club with the given distance', () async {
      final repository = FakeMyBagRepository();
      final usecase = SaveBagClubUsecase(repository);
      final before = DateTime.now();

      final result = await usecase(club: GolfClub.iron7, distanceYds: 150);
      final saved = result.getOrElse(() => throw StateError('left'));

      expect(saved.club, GolfClub.iron7);
      expect(saved.distanceYds, 150);
      expect(saved.addedAt.isBefore(before), isFalse);

      final stored = await repository.getBagClubs();
      expect(
        stored.getOrElse(() => throw StateError('left')).map((b) => b.club),
        [GolfClub.iron7],
      );
    });

    test('updates the distance of an existing club, keeping addedAt', () async {
      final originallyAdded = DateTime(2026, 8);
      final repository = FakeMyBagRepository([
        BagClub(
          club: GolfClub.iron7,
          distanceYds: 150,
          addedAt: originallyAdded,
        ),
      ]);
      final usecase = SaveBagClubUsecase(repository);

      final result = await usecase(club: GolfClub.iron7, distanceYds: 158);
      final saved = result.getOrElse(() => throw StateError('left'));

      expect(saved.distanceYds, 158);
      expect(saved.addedAt, originallyAdded);

      final stored = await repository.getBagClubs();
      final bagClubs = stored.getOrElse(() => throw StateError('left'));
      expect(bagClubs, hasLength(1));
      expect(bagClubs.single.distanceYds, 158);
    });

    test('clamps a negative distance to "not set"', () async {
      final usecase = SaveBagClubUsecase(FakeMyBagRepository());

      final result = await usecase(club: GolfClub.putter, distanceYds: -5);
      final saved = result.getOrElse(() => throw StateError('left'));

      expect(saved.distanceYds, 0);
      expect(saved.hasDistance, isFalse);
    });
  });
}
