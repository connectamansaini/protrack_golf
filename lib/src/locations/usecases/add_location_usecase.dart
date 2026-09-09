import 'package:dartz/dartz.dart';
import 'package:protrack_golf/src/locations/entities/location.dart';
import 'package:protrack_golf/src/locations/helpers/locations_failure.dart';
import 'package:protrack_golf/src/locations/locations_repository.dart';

class AddLocationUsecase {
  AddLocationUsecase(this._repository);

  final ILocationsRepository _repository;

  Future<Either<LocationsFailure, Location>> call({
    required String name,
    String notes = '',
  }) => _repository.addLocation(Location(name: name, notes: notes));
}
