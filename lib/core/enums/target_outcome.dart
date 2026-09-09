/// Outcome-relative-to-target tags captured by the 2-tap shot logger.
enum TargetOutcome {
  hitTarget,
  left,
  right,
  long,
  short;

  String get label => switch (this) {
    TargetOutcome.hitTarget => 'Hit Target',
    TargetOutcome.left => 'Left',
    TargetOutcome.right => 'Right',
    TargetOutcome.long => 'Long',
    TargetOutcome.short => 'Short',
  };

  /// Parses a stored `name` (see `Enum.name`) back into a [TargetOutcome],
  /// falling back to [TargetOutcome.hitTarget] if the value is unrecognized.
  static TargetOutcome fromName(String name) => TargetOutcome.values.firstWhere(
    (outcome) => outcome.name == name,
    orElse: () => TargetOutcome.hitTarget,
  );
}
