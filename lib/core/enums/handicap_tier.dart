/// The three difficulty bands the session generator and shot logger key
/// their content off of: Beginner 25+, Mid 12-24, Low <12.
enum HandicapTier {
  beginner,
  mid,
  low;

  String get label => switch (this) {
    HandicapTier.beginner => 'Beginner',
    HandicapTier.mid => 'Mid',
    HandicapTier.low => 'Low',
  };

  String get handicapRangeLabel => switch (this) {
    HandicapTier.beginner => '25+',
    HandicapTier.mid => '12–24',
    HandicapTier.low => '<12',
  };

  /// Parses a stored `name` (see `Enum.name`) back into a [HandicapTier],
  /// falling back to [HandicapTier.beginner] if the value is unrecognized.
  static HandicapTier fromName(String name) => HandicapTier.values.firstWhere(
    (tier) => tier.name == name,
    orElse: () => HandicapTier.beginner,
  );
}
