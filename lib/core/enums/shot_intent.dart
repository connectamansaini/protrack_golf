/// Why a ball was hit. Only [full] shots count toward a club's yardages;
/// [practice] balls (warm-up swings, technique drills) are logged so the
/// bucket count is honest but never skew the numbers in My Bag.
enum ShotIntent {
  practice,
  full;

  String get label => switch (this) {
    ShotIntent.practice => 'Practice',
    ShotIntent.full => 'Full potential',
  };

  /// Short form for chips and badges.
  String get shortLabel => switch (this) {
    ShotIntent.practice => 'Practice',
    ShotIntent.full => 'Full',
  };

  static ShotIntent fromName(String name) => ShotIntent.values.firstWhere(
    (intent) => intent.name == name,
    orElse: () => ShotIntent.full,
  );
}
