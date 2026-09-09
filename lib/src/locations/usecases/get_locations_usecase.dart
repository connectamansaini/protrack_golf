import 'package:dartz/dartz.dart';
import 'package:protrack_golf/src/locations/entities/location.dart';
import 'package:protrack_golf/src/locations/helpers/locations_failure.dart';
import 'package:protrack_golf/src/locations/locations_repository.dart';

class GetLocationsUsecase {
  GetLocationsUsecase(this._repository);

  final ILocationsRepository _repository;

  Future<Either<LocationsFailure, List<Location>>> call() =>
      _repository.getLocations();
}
