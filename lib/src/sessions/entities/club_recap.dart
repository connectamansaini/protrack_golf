import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:protrack_golf/core/core.dart';

part 'club_recap.freezed.dart';

/// One club's summary for a session recap: shots, average, best, and how
/// the average compares to the most recent earlier session that used the
/// same club ([hasPrevious] is false when there is none).
@freezed
abstract class ClubRecap with _$ClubRecap {
  const factory ClubRecap({
    @Default(GolfClub.driver) GolfClub club,
    @Default(0) int shots,
    @Default(0) double averageYds,
    @Default(0) double bestYds,
    @Default(0) double deltaVsPreviousYds,
    @Default(false) bool hasPrevious,
  }) = _ClubRecap;

  const ClubRecap._();

  static const empty = ClubRecap();
}
