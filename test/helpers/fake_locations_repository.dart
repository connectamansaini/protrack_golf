import 'package:dartz/dartz.dart';
import 'package:protrack_golf/src/locations/locations.dart';

/// In-memory [ILocationsRepository] for tests. Added locations get a
/// predictable id so assertions can reference them.
class FakeLocationsRepository implements ILocationsRepository {
  FakeLocationsRepository([List<Location> seed = const []])
    : _locations = List.of(seed);

  final List<Location> _locations;

  /// When set, every call fails with this failure.
  LocationsFailure? failure;

  List<Location> get locations => List.unmodifiable(_locations);

  @override
  Future<Either<LocationsFailure, List<Location>>> getLocations() async {
    final f = failure;
    if (f != null) return Left(f);
    return Right(List.of(_locations));
  }

  @override
  Future<Either<LocationsFailure, Location>> addLocation(
    Location location,
  ) async {
    final f = failure;
    if (f != null) return Left(f);
    final saved = location.copyWith(id: 'loc-${_locations.length + 1}');
    _locations.add(saved);
    return Right(saved);
  }

  @override
  Future<Either<LocationsFailure, Unit>> deleteLocation(String id) async {
    final f = failure;
    if (f != null) return Left(f);
    _locations.removeWhere((l) => l.id == id);
    return const Right(unit);
  }
}
