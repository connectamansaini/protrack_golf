/// Raised by `SessionsDataSource` and caught at the repository boundary.
class SessionsFailure implements Exception {
  SessionsFailure(this.message);

  final String message;

  @override
  String toString() => message;
}
