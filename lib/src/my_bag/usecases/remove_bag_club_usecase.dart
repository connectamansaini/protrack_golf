import 'package:dartz/dartz.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/my_bag/helpers/my_bag_failure.dart';
import 'package:protrack_golf/src/my_bag/my_bag_repository.dart';

class RemoveBagClubUsecase {
  RemoveBagClubUsecase(this._repository);

  final IMyBagRepository _repository;

  Future<Either<MyBagFailure, Unit>> call(GolfClub club) =>
      _repository.removeBagClub(club);
}
