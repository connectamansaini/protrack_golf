import 'package:dartz/dartz.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/my_bag/entities/bag_club.dart';
import 'package:protrack_golf/src/my_bag/helpers/my_bag_failure.dart';
import 'package:protrack_golf/src/my_bag/models/bag_club_model.dart';
import 'package:protrack_golf/src/my_bag/my_bag_data_source.dart';

/// Domain-facing contract for the manually-managed bag. Never throws -
/// always returns an [Either].
abstract interface class IMyBagRepository {
  Future<Either<MyBagFailure, List<BagClub>>> getBagClubs();

  /// Inserts or replaces the entry for `bagClub.club`.
  Future<Either<MyBagFailure, BagClub>> saveBagClub(BagClub bagClub);

  Future<Either<MyBagFailure, Unit>> removeBagClub(GolfClub club);
}

class MyBagRepository implements IMyBagRepository {
  MyBagRepository(this._dataSource);

  final MyBagDataSource _dataSource;

  @override
  Future<Either<MyBagFailure, List<BagClub>>> getBagClubs() async {
    try {
      final models = await _dataSource.getBagClubs();
      final bagClubs = models.map((model) => model.toEntity).toList()
        ..sort((a, b) => a.club.index.compareTo(b.club.index));
      return Right(bagClubs);
    } on MyBagFailure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<MyBagFailure, BagClub>> saveBagClub(BagClub bagClub) async {
    try {
      await _dataSource.saveBagClub(BagClubModel.fromEntity(bagClub));
      return Right(bagClub);
    } on MyBagFailure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<MyBagFailure, Unit>> removeBagClub(GolfClub club) async {
    try {
      await _dataSource.removeBagClub(club.name);
      return const Right(unit);
    } on MyBagFailure catch (failure) {
      return Left(failure);
    }
  }
}
