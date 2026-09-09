import 'dart:math';

/// Generates simple, locally-unique string ids for Hive-backed entities.
abstract final class IdGenerator {
  const IdGenerator._();

  static final Random _random = Random();

  static String generate() {
    final timestamp = DateTime.now().microsecondsSinceEpoch;
    final salt = _random.nextInt(0x7FFFFFFF);
    return '$timestamp-$salt';
  }
}
