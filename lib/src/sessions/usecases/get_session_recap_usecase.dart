import 'dart:math' as math;

import 'package:dartz/dartz.dart';
import 'package:protrack_golf/src/sessions/entities/club_entry.dart';
import 'package:protrack_golf/src/sessions/entities/club_recap.dart';
import 'package:protrack_golf/src/sessions/entities/note_theme.dart';
import 'package:protrack_golf/src/sessions/entities/practice_session.dart';
import 'package:protrack_golf/src/sessions/entities/session_recap.dart';
import 'package:protrack_golf/src/sessions/helpers/sessions_failure.dart';
import 'package:protrack_golf/src/sessions/sessions_repository.dart';

/// Builds the recap for one session: for every club hit, compares its
/// average against the most recent EARLIER session that used the same club,
/// and tallies words that recur across the notes of the last few sessions.
class GetSessionRecapUsecase {
  GetSessionRecapUsecase(this._repository);

  final ISessionsRepository _repository;

  /// How many recent sessions (including the one being recapped) count
  /// towards recurring note themes.
  static const int themeWindow = 5;

  /// A word has to show up in at least this many sessions to be a theme.
  static const int themeMinSessions = 2;

  static const int maxThemes = 6;

  static const Set<String> _stopWords = {
    'the',
    'and',
    'but',
    'for',
    'with',
    'was',
    'were',
    'this',
    'that',
    'today',
    'session',
    'felt',
    'feel',
    'feels',
    'really',
    'very',
    'just',
    'still',
    'again',
    'also',
    'okay',
    'good',
    'well',
    'kind',
    'lots',
    'more',
    'most',
    'some',
    'from',
    'into',
    'have',
    'had',
    'has',
    'not',
    'about',
    'shots',
    'shot',
    'balls',
    'ball',
    'range',
    'club',
    'clubs',
  };

  Future<Either<SessionsFailure, SessionRecap>> call(String id) async {
    final sessionResult = await _repository.getSessionById(id);
    return sessionResult.fold(Left.new, (session) async {
      final allResult = await _repository.getSessions();
      return allResult.fold(
        Left.new,
        (sessions) => Right(_buildRecap(session, sessions)),
      );
    });
  }

  SessionRecap _buildRecap(
    PracticeSession session,
    List<PracticeSession> allSessions,
  ) {
    final earlierNewestFirst =
        allSessions
            .where((s) => s.id != session.id && s.date.isBefore(session.date))
            .toList()
          ..sort((a, b) => b.date.compareTo(a.date));

    final recaps = <ClubRecap>[
      for (final entry in session.clubEntries)
        if (entry.distances.isNotEmpty)
          _recapForEntry(entry, earlierNewestFirst),
    ]..sort((a, b) => a.club.index.compareTo(b.club.index));

    final window = [
      session,
      ...earlierNewestFirst.take(themeWindow - 1),
    ];

    return SessionRecap(
      session: session,
      clubRecaps: recaps,
      recurringThemes: _themesIn(window, session),
      themeWindowSessions: window.length,
    );
  }

  ClubRecap _recapForEntry(ClubEntry entry, List<PracticeSession> earlier) {
    final previous = earlier
        .expand((s) => s.clubEntries)
        .where((e) => e.club == entry.club && e.distances.isNotEmpty)
        .firstOrNull;
    final average = entry.averageDistance;
    return ClubRecap(
      club: entry.club,
      shots: entry.distances.length,
      averageYds: average,
      bestYds: entry.distances.reduce(math.max),
      deltaVsPreviousYds: previous == null
          ? 0
          : average - previous.averageDistance,
      hasPrevious: previous != null,
    );
  }

  /// Words (minus filler) that appear in the notes of at least
  /// [themeMinSessions] of the [window] sessions, most frequent first.
  List<NoteTheme> _themesIn(
    List<PracticeSession> window,
    PracticeSession current,
  ) {
    final sessionsPerWord = <String, int>{};
    for (final session in window) {
      for (final word in _wordsIn(session)) {
        sessionsPerWord[word] = (sessionsPerWord[word] ?? 0) + 1;
      }
    }
    final currentWords = _wordsIn(current);
    final themes =
        [
            for (final entry in sessionsPerWord.entries)
              if (entry.value >= themeMinSessions)
                NoteTheme(
                  keyword: entry.key,
                  sessionCount: entry.value,
                  inThisSession: currentWords.contains(entry.key),
                ),
          ]..sort((a, b) {
            final byCount = b.sessionCount.compareTo(a.sessionCount);
            return byCount != 0 ? byCount : a.keyword.compareTo(b.keyword);
          });
    return themes.take(maxThemes).toList();
  }

  /// The distinct meaningful words across a session's notes and club notes.
  Set<String> _wordsIn(PracticeSession session) {
    final texts = [
      session.notes,
      for (final entry in session.clubEntries) entry.notes,
    ];
    return {
      for (final text in texts)
        for (final word in text.toLowerCase().split(RegExp('[^a-z]+')))
          if (word.length > 3 && !_stopWords.contains(word)) word,
    };
  }
}
