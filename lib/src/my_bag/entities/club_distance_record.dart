import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:protrack_golf/core/core.dart';

part 'club_distance_record.freezed.dart';

/// One line of a golfer's personal yardage chart: how far a club goes on
/// average, at best, and most recently - all computed from logged practice
/// sessions - plus whether the golfer has put the club in their bag and, if
/// so, the distance they entered by hand ([manualDistanceYds] of 0 means
/// "not set").
@freezed
abstract class ClubDistanceRecord with _$ClubDistanceRecord {
  const factory ClubDistanceRecord({
    @Default(GolfClub.driver) GolfClub club,
    @Default(0) double averageYds,
    @Default(0) double bestYds,
    @Default(0) double latestYds,
    @Default(0) int shotCount,
    @Default(0) int sessionCount,
    @Default(false) bool inBag,
    @Default(0) double manualDistanceYds,
  }) = _ClubDistanceRecord;

  const ClubDistanceRecord._();

  static const empty = ClubDistanceRecord();

  bool get hasSessionData => shotCount > 0;

  bool get hasManualDistance => manualDistanceYds > 0;
}
