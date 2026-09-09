/// Raised by `MyBagDataSource` and caught at the repository boundary, and
/// also used when the My Bag usecases can't compute a golfer's yardage
/// records because the underlying sessions data couldn't be read.
class MyBagFailure implements Exception {
  MyBagFailure(this.message);

  final String message;

  @override
  String toString() => message;
}
