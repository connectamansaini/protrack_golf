/// Raised when the progress feature's usecases can't compute aggregates,
/// typically because the underlying sessions data couldn't be read.
class ProgressFailure implements Exception {
  ProgressFailure(this.message);

  final String message;

  @override
  String toString() => message;
}
