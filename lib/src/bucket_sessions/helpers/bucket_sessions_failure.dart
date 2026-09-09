/// Raised by `BucketSessionsDataSource` and caught at the repository
/// boundary.
class BucketSessionsFailure implements Exception {
  BucketSessionsFailure(this.message);

  final String message;

  @override
  String toString() => message;
}
