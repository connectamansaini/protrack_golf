/// Flight-shape tags captured by the 2-tap shot logger.
enum ShotDirection {
  pull,
  straight,
  push,
  slice,
  hook;

  String get label => switch (this) {
    ShotDirection.pull => 'Pull',
    ShotDirection.straight => 'Straight',
    ShotDirection.push => 'Push',
    ShotDirection.slice => 'Slice',
    ShotDirection.hook => 'Hook',
  };

  /// Parses a stored `name` (see `Enum.name`) back into a [ShotDirection],
  /// falling back to [ShotDirection.straight] if the value is unrecognized.
  static ShotDirection fromName(String name) => ShotDirection.values.firstWhere(
    (direction) => direction.name == name,
    orElse: () => ShotDirection.straight,
  );
}
