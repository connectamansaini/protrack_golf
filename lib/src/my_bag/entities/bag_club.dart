import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:protrack_golf/core/core.dart';

part 'bag_club.freezed.dart';

/// A club the golfer has told us is in their bag, with the distance they
/// believe they hit it ([distanceYds] of 0 means "not set yet"). Entered by
/// hand - unlike `ClubDistanceRecord`, which is computed from sessions.
@freezed
abstract class BagClub with _$BagClub {
  const factory BagClub({
    required DateTime addedAt,
    @Default(GolfClub.driver) GolfClub club,
    @Default(0) double distanceYds,
  }) = _BagClub;

  const BagClub._();

  static BagClub empty = BagClub(addedAt: DateTime(2000));

  bool get hasDistance => distanceYds > 0;
}
