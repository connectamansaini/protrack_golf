import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:protrack_golf/core/core.dart';

part 'club_entry.freezed.dart';

/// One club's worth of shots logged during a practice session: which club,
/// the full-potential distances hit, any practice balls, and free-form
/// notes.
///
/// [distances] are the shots that count: every average, best and trend in
/// the app is computed from them. [practiceDistances] are warm-up and
/// drill balls, kept so the bucket adds up but never used for yardages.
@freezed
abstract class ClubEntry with _$ClubEntry {
  const factory ClubEntry({
    @Default(GolfClub.driver) GolfClub club,
    @Default(<double>[]) List<double> distances,
    @Default(<double>[]) List<double> practiceDistances,
    @Default('') String notes,
  }) = _ClubEntry;

  const ClubEntry._();

  static const empty = ClubEntry();

  double get averageDistance => distances.isEmpty
      ? 0
      : distances.reduce((a, b) => a + b) / distances.length;

  double get bestDistance =>
      distances.fold(0, (best, d) => d > best ? d : best);

  int get fullShots => distances.length;

  int get practiceShots => practiceDistances.length;

  /// Every ball hit with this club, practice included.
  int get totalShots => fullShots + practiceShots;
}
