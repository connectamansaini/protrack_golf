import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:protrack_golf/src/sessions/entities/club_entry.dart';

part 'practice_session.freezed.dart';

/// A single practice-range session: where, how many balls, which clubs and
/// distances, notes, and any attached media.
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
  }) = _PracticeSession;

  const PracticeSession._();

  static PracticeSession empty = PracticeSession(date: DateTime(2000));

  /// Every recorded distance across all clubs, i.e. balls actually hit.
  int get totalShots =>
      clubEntries.fold(0, (sum, entry) => sum + entry.distances.length);

  /// The longest recorded distance in the session, or 0 if none.
  double get bestDistance => clubEntries
      .expand((entry) => entry.distances)
      .fold(0, (best, distance) => distance > best ? distance : best);
}
