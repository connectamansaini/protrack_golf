import 'package:flutter_test/flutter_test.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/my_bag/my_bag.dart';

import '../../helpers/fake_my_bag_repository.dart';

void main() {
  group('RemoveBagClubUsecase', () {
    test('removes only the given club', () async {
      final repository = FakeMyBagRepository([
        // `club` defaults to GolfClub.driver.
        BagClub(addedAt: DateTime(2026, 8)),
        BagClub(club: GolfClub.iron7, addedAt: DateTime(2026, 8)),
      ]);
      final usecase = RemoveBagClubUsecase(repository);

      final result = await usecase(GolfClub.driver);

      expect(result.isRight(), isTrue);
      final stored = await repository.getBagClubs();
      expect(
        stored.getOrElse(() => throw StateError('left')).map((b) => b.club),
        [GolfClub.iron7],
      );
    });

    test('succeeds when the club was not in the bag', () async {
      final usecase = RemoveBagClubUsecase(FakeMyBagRepository());

      final result = await usecase(GolfClub.lobWedge);

      expect(result.isRight(), isTrue);
    });
  });
}
