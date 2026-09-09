import 'package:dartz/dartz.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/my_bag/entities/bag_club.dart';
import 'package:protrack_golf/src/my_bag/helpers/my_bag_failure.dart';
import 'package:protrack_golf/src/my_bag/my_bag_repository.dart';

/// Adds a club to the bag, or updates its distance if it is already there.
/// Negative distances are clamped to 0 ("not set"); the original `addedAt`
/// is preserved on edits so the bag keeps its history.
class SaveBagClubUsecase {
  SaveBagClubUsecase(this._repository);

  final IMyBagRepository _repository;

  Future<Either<MyBagFailure, BagClub>> call({
    required GolfClub club,
    required double distanceYds,
  }) async {
    final existingResult = await _repository.getBagClubs();
    return existingResult.fold(Left.new, (bagClubs) {
      final existing = bagClubs.where((b) => b.club == club).firstOrNull;
      return _repository.saveBagClub(
        BagClub(
          club: club,
          distanceYds: distanceYds < 0 ? 0 : distanceYds,
          addedAt: existing?.addedAt ?? DateTime.now(),
        ),
      );
    });
  }
}
