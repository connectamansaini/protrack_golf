/// Raised when a session plan can't be built, e.g. no usable clubs or too
/// few balls for the chosen template.
class PlansFailure implements Exception {
  PlansFailure(this.message);

  final String message;

  @override
  String toString() => message;
}
