import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:protrack_golf/core/core.dart';

part 'range_shot.freezed.dart';

/// A single shot logged at the range: which club, how far, and whether it
/// was a practice ball or a full-potential swing. Kept in chronological
/// order by the range logger so the last shot can be undone; folded into
/// `ClubEntry`s when the session is saved.
@freezed
abstract class RangeShot with _$RangeShot {
  const factory RangeShot({
    @Default(GolfClub.driver) GolfClub club,
    @Default(0) double distanceYds,
    @Default(ShotIntent.full) ShotIntent intent,
  }) = _RangeShot;

  const RangeShot._();

  static const empty = RangeShot();

  bool get isPractice => intent == ShotIntent.practice;
}
