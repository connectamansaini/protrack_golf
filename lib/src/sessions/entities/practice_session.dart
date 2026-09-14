import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:protrack_golf/src/sessions/entities/club_entry.dart';

part 'practice_session.freezed.dart';

/// A single practice-range session: where, how many balls, which clubs and
/// distances, notes, any attached media, and the name of the session plan
/// that was followed (empty for free practice).
@freezed
abstract class PracticeSession with _$PracticeSession {
  const factory PracticeSession({
    required DateTime date,
    @Default('') String id,
    @Default('') String locationId,
    @Default(0) int bucketSize,
    @Default(<ClubEntry>[]) List<ClubEntry> clubEntries,
    @Default('') String notes,
    @Default(<String>[]) List<String> mediaPaths,
    @Default('') String planName,
  }) = _PracticeSession;

  const PracticeSession._();

  static PracticeSession empty = PracticeSession(date: DateTime(2000));

  /// Every ball hit across all clubs, practice balls included.
  int get totalShots =>
      clubEntries.fold(0, (sum, entry) => sum + entry.totalShots);

  /// Full-potential shots only: the ones that feed yardages.
  int get fullShots =>
      clubEntries.fold(0, (sum, entry) => sum + entry.fullShots);

  int get practiceShots =>
      clubEntries.fold(0, (sum, entry) => sum + entry.practiceShots);

  /// The longest full-potential distance in the session, or 0 if none.
  double get bestDistance => clubEntries
      .expand((entry) => entry.distances)
      .fold(0, (best, distance) => distance > best ? distance : best);
}
