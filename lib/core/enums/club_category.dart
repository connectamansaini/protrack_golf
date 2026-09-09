/// Quick-pick groupings for `GolfClub`, used by the 2-tap shot logger's
/// club selector (Wedges, Short/Mid/Long Irons, Woods, Driver).
enum ClubCategory {
  driver,
  woods,
  longIrons,
  midIrons,
  shortIrons,
  wedges,
  putter;

  String get label => switch (this) {
    ClubCategory.driver => 'Driver',
    ClubCategory.woods => 'Woods',
    ClubCategory.longIrons => 'Long Irons',
    ClubCategory.midIrons => 'Mid Irons',
    ClubCategory.shortIrons => 'Short Irons',
    ClubCategory.wedges => 'Wedges',
    ClubCategory.putter => 'Putter',
  };
}
