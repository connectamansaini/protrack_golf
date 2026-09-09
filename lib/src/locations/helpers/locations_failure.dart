/// Raised by `LocationsDataSource` and caught at the repository boundary.
class LocationsFailure implements Exception {
  LocationsFailure(this.message);

  final String message;

  @override
  String toString() => message;
}
