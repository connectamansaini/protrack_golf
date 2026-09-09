import 'package:flutter_test/flutter_test.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/sessions/sessions.dart';

import '../../helpers/fake_sessions_repository.dart';

void main() {
  group('GetSessionRecapUsecase', () {
    final first = PracticeSession(
      id: 'first',
      date: DateTime(2026, 8, 2),
      clubEntries: const [
        ClubEntry(club: GolfClub.iron7, distances: [140, 150]),
      ],
    );
    final second = PracticeSession(
      id: 'second',
      date: DateTime(2026, 8, 8),
      clubEntries: const [
        ClubEntry(club: GolfClub.iron7, distances: [150, 160]),
        // `club` defaults to GolfClub.driver.
        ClubEntry(distances: [210]),
      ],
    );
    final third = PracticeSession(
      id: 'third',
      date: DateTime(2026, 8, 15),
      clubEntries: const [
        ClubEntry(club: GolfClub.iron7, distances: [150, 150]),
        ClubEntry(distances: [200, 220]),
      ],
    );

    test(
      'compares each club against the most recent earlier session',
      () async {
        final usecase = GetSessionRecapUsecase(
          FakeSessionsRepository([first, second, third]),
        );

        final result = await usecase('third');
        final recap = result.getOrElse(() => throw StateError('left'));

        expect(recap.session.id, 'third');
        expect(recap.clubRecaps.map((r) => r.club), [
          GolfClub.driver,
          GolfClub.iron7,
        ]);

        final driver = recap.clubRecaps.first;
        expect(driver.shots, 2);
        expect(driver.averageYds, 210);
        expect(driver.bestYds, 220);
        expect(driver.hasPrevious, isTrue);
        expect(driver.deltaVsPreviousYds, closeTo(0, 0.001));

        final iron7 = recap.clubRecaps.last;
        expect(iron7.hasPrevious, isTrue);
        // 150 this time vs 155 in "second" (not 145 in "first").
        expect(iron7.deltaVsPreviousYds, closeTo(-5, 0.001));
      },
    );

    test(
      'marks a club with no earlier session as having no previous',
      () async {
        final usecase = GetSessionRecapUsecase(
          FakeSessionsRepository([first, second, third]),
        );

        final result = await usecase('second');
        final recap = result.getOrElse(() => throw StateError('left'));

        final driver = recap.clubRecaps.firstWhere(
          (r) => r.club == GolfClub.driver,
        );
        expect(driver.hasPrevious, isFalse);
        expect(driver.deltaVsPreviousYds, 0);
      },
    );

    test('fails for an unknown session id', () async {
      final usecase = GetSessionRecapUsecase(FakeSessionsRepository([first]));

      final result = await usecase('missing');

      expect(result.isLeft(), isTrue);
    });
  });
}
