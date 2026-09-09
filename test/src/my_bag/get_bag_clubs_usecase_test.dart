import 'package:flutter_test/flutter_test.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/my_bag/my_bag.dart';

import '../../helpers/fake_my_bag_repository.dart';

void main() {
  group('GetBagClubsUsecase', () {
    test('returns an empty list for a new bag', () async {
      final usecase = GetBagClubsUsecase(FakeMyBagRepository());

      final result = await usecase();

      expect(result.isRight(), isTrue);
      expect(result.getOrElse(() => throw StateError('left')), isEmpty);
    });

    test('returns clubs in bag order regardless of insertion order', () async {
      final usecase = GetBagClubsUsecase(
        FakeMyBagRepository([
          BagClub(club: GolfClub.putter, addedAt: DateTime(2026, 8, 3)),
          BagClub(
            // `club` defaults to GolfClub.driver.
            distanceYds: 230,
            addedAt: DateTime(2026, 8, 2),
          ),
          BagClub(
            club: GolfClub.iron7,
            distanceYds: 150,
            addedAt: DateTime(2026, 8),
          ),
        ]),
      );

      final result = await usecase();
      final bagClubs = result.getOrElse(() => throw StateError('left'));

      expect(bagClubs.map((b) => b.club), [
        GolfClub.driver,
        GolfClub.iron7,
        GolfClub.putter,
      ]);
      expect(bagClubs.first.distanceYds, 230);
      expect(bagClubs.first.hasDistance, isTrue);
      expect(bagClubs.last.hasDistance, isFalse);
    });
  });
}
