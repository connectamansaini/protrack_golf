import 'package:flutter_test/flutter_test.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/sessions/sessions.dart';

void main() {
  group('SessionsState', () {
    final august = PracticeSession(
      id: 'aug',
      date: DateTime(2026, 8, 20),
      clubEntries: const [
        ClubEntry(club: GolfClub.iron7, distances: [140, 150, 145]),
      ],
    );
    final septemberEarly = PracticeSession(
      id: 'sep1',
      date: DateTime(2026, 9, 2),
      clubEntries: const [
        ClubEntry(distances: [210, 220]),
      ],
    );
    final septemberLate = PracticeSession(
      id: 'sep2',
      date: DateTime(2026, 9, 9),
      clubEntries: const [
        ClubEntry(club: GolfClub.iron7, distances: [150]),
        ClubEntry(club: GolfClub.pitchingWedge, distances: [90, 95]),
      ],
    );
    // Newest first, as the repository returns them.
    final state = SessionsState(
      status: const SessionsStatus.success(),
      sessions: [septemberLate, septemberEarly, august],
    );

    test('filters sessions to the calendar month of the given date', () {
      final now = DateTime(2026, 9, 15);

      expect(state.sessionsInMonth(now).map((s) => s.id), ['sep2', 'sep1']);
      expect(state.sessionsInMonth(DateTime(2026, 8)).length, 1);
      expect(state.sessionsInMonth(DateTime(2026, 7)), isEmpty);
    });

    test('sums balls hit across the month', () {
      expect(state.shotsInMonth(DateTime(2026, 9, 30)), 5);
      expect(state.shotsInMonth(DateTime(2026, 8, 30)), 3);
      expect(state.shotsInMonth(DateTime(2026)), 0);
    });

    test('latest session is the first in the list', () {
      expect(state.latestSession?.id, 'sep2');
      expect(const SessionsState().latestSession, isNull);
    });
  });

  group('PracticeSession', () {
    test('totalShots and bestDistance derive from every club entry', () {
      final session = PracticeSession(
        date: DateTime(2026, 9, 9),
        clubEntries: const [
          ClubEntry(club: GolfClub.iron7, distances: [140, 155]),
          ClubEntry(distances: [230, 200]),
          ClubEntry(club: GolfClub.putter),
        ],
      );

      expect(session.totalShots, 4);
      expect(session.bestDistance, 230);
      expect(PracticeSession.empty.totalShots, 0);
      expect(PracticeSession.empty.bestDistance, 0);
    });
  });
}
