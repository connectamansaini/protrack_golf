import 'package:dartz/dartz.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/locations/entities/location.dart';
import 'package:protrack_golf/src/locations/helpers/locations_failure.dart';
import 'package:protrack_golf/src/locations/locations_data_source.dart';
import 'package:protrack_golf/src/locations/models/location_model.dart';

/// Domain-facing contract for the locations feature. Never throws - always
/// returns an [Either].
abstract interface class ILocationsRepository {
  Future<Either<LocationsFailure, List<Location>>> getLocations();

  Future<Either<LocationsFailure, Location>> addLocation(Location location);

  Future<Either<LocationsFailure, Unit>> deleteLocation(String id);
}

class LocationsRepository implements ILocationsRepository {
  LocationsRepository(this._dataSource);

  final LocationsDataSource _dataSource;

  @override
  Future<Either<LocationsFailure, List<Location>>> getLocations() async {
    try {
      final models = await _dataSource.getLocations();
      return Right(models.map((model) => model.toEntity).toList());
    } on LocationsFailure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<LocationsFailure, Location>> addLocation(
    Location location,
  ) async {
    try {
      final entity = location.id.isEmpty
          ? location.copyWith(id: IdGenerator.generate())
          : location;
      await _dataSource.saveLocation(LocationModel.fromEntity(entity));
      return Right(entity);
    } on LocationsFailure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<LocationsFailure, Unit>> deleteLocation(String id) async {
    try {
      await _dataSource.deleteLocation(id);
      return const Right(unit);
    } on LocationsFailure catch (failure) {
      return Left(failure);
    }
  }
}
