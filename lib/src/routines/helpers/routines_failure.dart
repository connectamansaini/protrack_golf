/// Raised by `RoutinesDataSource` and caught at the repository boundary.
class RoutinesFailure implements Exception {
  RoutinesFailure(this.message);

  final String message;

  @override
  String toString() => message;
}
