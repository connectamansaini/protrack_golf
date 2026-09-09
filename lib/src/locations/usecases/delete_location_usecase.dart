import 'package:dartz/dartz.dart';
import 'package:protrack_golf/src/locations/helpers/locations_failure.dart';
import 'package:protrack_golf/src/locations/locations_repository.dart';

class DeleteLocationUsecase {
  DeleteLocationUsecase(this._repository);

  final ILocationsRepository _repository;

  Future<Either<LocationsFailure, Unit>> call(String id) =>
      _repository.deleteLocation(id);
}
