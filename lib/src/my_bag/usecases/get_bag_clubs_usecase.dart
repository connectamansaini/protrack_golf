import 'package:dartz/dartz.dart';
import 'package:protrack_golf/src/my_bag/entities/bag_club.dart';
import 'package:protrack_golf/src/my_bag/helpers/my_bag_failure.dart';
import 'package:protrack_golf/src/my_bag/my_bag_repository.dart';

class GetBagClubsUsecase {
  GetBagClubsUsecase(this._repository);

  final IMyBagRepository _repository;

  Future<Either<MyBagFailure, List<BagClub>>> call() =>
      _repository.getBagClubs();
}
