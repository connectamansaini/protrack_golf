import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:protrack_golf/src/sessions/entities/club_recap.dart';
import 'package:protrack_golf/src/sessions/entities/note_theme.dart';
import 'package:protrack_golf/src/sessions/entities/practice_session.dart';

part 'session_recap.freezed.dart';

/// The post-session summary shown after a range session is saved: the
/// session itself, a per-club comparison against the previous time each
/// club was hit, and any themes recurring across recent notes.
@freezed
abstract class SessionRecap with _$SessionRecap {
  const factory SessionRecap({
    required PracticeSession session,
    @Default(<ClubRecap>[]) List<ClubRecap> clubRecaps,
    @Default(<NoteTheme>[]) List<NoteTheme> recurringThemes,

    /// How many recent sessions (including this one) the themes were
    /// counted over.
    @Default(0) int themeWindowSessions,
  }) = _SessionRecap;

  const SessionRecap._();

  static SessionRecap empty = SessionRecap(session: PracticeSession.empty);

  int get totalShots =>
      clubRecaps.fold(0, (total, recap) => total + recap.shots);

  /// Changes smaller than this read as "about the same" rather than a real
  /// move in either direction.
  static const double neutralBandYds = 1;

  /// The club with the single longest shot of the session, if any.
  ClubRecap? get longestShot => clubRecaps.isEmpty
      ? null
      : clubRecaps.reduce((a, b) => a.bestYds >= b.bestYds ? a : b);

  int get improvedClubCount => clubRecaps
      .where((r) => r.hasPrevious && r.deltaVsPreviousYds > neutralBandYds)
      .length;

  int get newClubCount => clubRecaps.where((r) => !r.hasPrevious).length;
}
