import 'package:protrack_golf/core/enums/club_category.dart';

/// The set of clubs a beginner golfer is likely to track during practice.
enum GolfClub {
  driver,
  wood3,
  wood5,
  hybrid,
  iron3,
  iron4,
  iron5,
  iron6,
  iron7,
  iron8,
  iron9,
  pitchingWedge,
  gapWedge,
  sandWedge,
  lobWedge,
  putter;

  /// Short, display-friendly label for this club.
  String get label => switch (this) {
    GolfClub.driver => 'Driver',
    GolfClub.wood3 => '3 Wood',
    GolfClub.wood5 => '5 Wood',
    GolfClub.hybrid => 'Hybrid',
    GolfClub.iron3 => '3 Iron',
    GolfClub.iron4 => '4 Iron',
    GolfClub.iron5 => '5 Iron',
    GolfClub.iron6 => '6 Iron',
    GolfClub.iron7 => '7 Iron',
    GolfClub.iron8 => '8 Iron',
    GolfClub.iron9 => '9 Iron',
    GolfClub.pitchingWedge => 'PW',
    GolfClub.gapWedge => 'GW',
    GolfClub.sandWedge => 'SW',
    GolfClub.lobWedge => 'LW',
    GolfClub.putter => 'Putter',
  };

  /// Parses a stored `name` (see `Enum.name`) back into a [GolfClub],
  /// falling back to [GolfClub.driver] if the value is unrecognized.
  static GolfClub fromName(String name) => GolfClub.values.firstWhere(
    (club) => club.name == name,
    orElse: () => GolfClub.driver,
  );

  /// Quick-pick grouping used by the 2-tap shot logger's club selector.
  ClubCategory get category => switch (this) {
    GolfClub.driver => ClubCategory.driver,
    GolfClub.wood3 || GolfClub.wood5 || GolfClub.hybrid => ClubCategory.woods,
    GolfClub.iron3 || GolfClub.iron4 => ClubCategory.longIrons,
    GolfClub.iron5 || GolfClub.iron6 || GolfClub.iron7 => ClubCategory.midIrons,
    GolfClub.iron8 || GolfClub.iron9 => ClubCategory.shortIrons,
    GolfClub.pitchingWedge ||
    GolfClub.gapWedge ||
    GolfClub.sandWedge ||
    GolfClub.lobWedge => ClubCategory.wedges,
    GolfClub.putter => ClubCategory.putter,
  };
}
