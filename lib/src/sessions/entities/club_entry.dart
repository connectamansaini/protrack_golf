import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:protrack_golf/core/core.dart';

part 'club_entry.freezed.dart';

/// One club's worth of shots logged during a practice session: which club,
/// the distances hit, and free-form notes. Deliberately minimal for v1 -
/// no strike-quality rating, no ball-flight direction.
@freezed
abstract class ClubEntry with _$ClubEntry {
  const factory ClubEntry({
    @Default(GolfClub.driver) GolfClub club,
    @Default(<double>[]) List<double> distances,
    @Default('') String notes,
  }) = _ClubEntry;

  const ClubEntry._();

  static const empty = ClubEntry();

  double get averageDistance => distances.isEmpty
      ? 0
      : distances.reduce((a, b) => a + b) / distances.length;

  double get bestDistance =>
      distances.fold(0, (best, d) => d > best ? d : best);
}
