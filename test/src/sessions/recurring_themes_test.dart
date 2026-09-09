import 'package:flutter_test/flutter_test.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/sessions/sessions.dart';

import '../../helpers/fake_sessions_repository.dart';

PracticeSession _session(String id, int day, String notes) => PracticeSession(
  id: id,
  date: DateTime(2026, 8, day),
  notes: notes,
  clubEntries: const [
    ClubEntry(club: GolfClub.iron7, distances: [140]),
  ],
);

Future<SessionRecap> _recap(List<PracticeSession> sessions, String id) async {
  final result = await GetSessionRecapUsecase(
    FakeSessionsRepository(sessions),
  )(id);
  return result.getOrElse(() => throw StateError('left'));
}

void main() {
  group('GetSessionRecapUsecase recurring themes', () {
    test('surfaces words mentioned in more than one recent session', () async {
      final recap = await _recap([
        _session('a', 1, 'Kept slicing the driver'),
        _session('b', 2, 'Slicing again, thin contact'),
        _session('c', 3, 'Better tempo today, still slicing'),
      ], 'c');

      final keywords = recap.recurringThemes.map((t) => t.keyword).toList();
      expect(keywords, contains('slicing'));
      // "thin" and "tempo" only appear once each.
      expect(keywords, isNot(contains('thin')));
      expect(keywords, isNot(contains('tempo')));
      expect(recap.themeWindowSessions, 3);
    });

    test('counts sessions, not occurrences, and flags this session', () async {
      final recap = await _recap([
        _session('a', 1, 'slicing slicing slicing'),
        _session('b', 2, 'no problems'),
        _session('c', 3, 'slicing once'),
      ], 'c');

      final slicing = recap.recurringThemes.singleWhere(
        (t) => t.keyword == 'slicing',
      );
      expect(slicing.sessionCount, 2);
      expect(slicing.inThisSession, isTrue);
    });

    test('marks a theme absent from this session', () async {
      final recap = await _recap([
        _session('a', 1, 'topping everything'),
        _session('b', 2, 'topping again'),
        _session('c', 3, 'felt great'),
      ], 'c');

      final topping = recap.recurringThemes.singleWhere(
        (t) => t.keyword == 'topping',
      );
      expect(topping.inThisSession, isFalse);
    });

    test('ignores filler words and short words', () async {
      final recap = await _recap([
        _session('a', 1, 'today felt good with the driver'),
        _session('b', 2, 'today felt good with the driver'),
      ], 'b');

      final keywords = recap.recurringThemes.map((t) => t.keyword).toList();
      expect(keywords, ['driver']);
    });

    test('only looks at the last five sessions', () async {
      final sessions = [
        _session('old', 1, 'shanking'),
        for (var day = 2; day <= 6; day++) _session('s$day', day, 'clean'),
        _session('now', 7, 'shanking again'),
      ];

      final recap = await _recap(sessions, 'now');

      expect(recap.themeWindowSessions, 5);
      final keywords = recap.recurringThemes.map((t) => t.keyword).toList();
      // "shanking" appears in "old", which falls outside the window.
      expect(keywords, isNot(contains('shanking')));
    });

    test('is empty when nothing recurs', () async {
      final recap = await _recap([
        _session('a', 1, 'windy'),
        _session('b', 2, 'sunny'),
      ], 'b');

      expect(recap.recurringThemes, isEmpty);
    });
  });
}
