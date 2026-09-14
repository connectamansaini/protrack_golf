import 'package:flutter_test/flutter_test.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/plans/plans.dart';

void main() {
  const usecase = BuildSessionPlanUsecase();

  SessionPlan plan(SessionTemplate template, Set<GolfClub> clubs, int balls) {
    final result = usecase(
      template: template,
      clubs: clubs,
      ballCount: balls,
    );
    return result.fold((f) => throw f, (p) => p);
  }

  group('BuildSessionPlanUsecase', () {
    test('focused practice splits 100 balls into the five phases', () async {
      final result = plan(
        SessionTemplates.focused,
        {GolfClub.driver, GolfClub.iron7, GolfClub.pitchingWedge},
        100,
      );

      expect(result.phases.map((p) => p.kind), [
        PracticePhaseKind.warmUp,
        PracticePhaseKind.block,
        PracticePhaseKind.measured,
        PracticePhaseKind.pressured,
        PracticePhaseKind.varied,
      ]);
      expect(result.phases.map((p) => p.ballCount), [10, 25, 25, 25, 15]);
      expect(result.practiceBalls, 35);
      expect(result.fullBalls, 65);
      // Warm-up with the shortest club; block with the 7 iron; measured
      // with the 7 iron and its neighbours; the rest with everything.
      expect(result.phases[0].clubs, [GolfClub.pitchingWedge]);
      expect(result.phases[1].clubs, [GolfClub.iron7]);
      expect(result.phases[2].clubs, [
        GolfClub.driver,
        GolfClub.iron7,
        GolfClub.pitchingWedge,
      ]);
      expect(result.phases[3].clubs.length, 3);
      expect(result.phases[3].drills.first, contains('PW > 7 Iron > Driver'));
    });

    test('ball counts always add up to the bucket', () async {
      for (final balls in [40, 41, 47, 63, 99, 150]) {
        final result = plan(
          SessionTemplates.focused,
          {GolfClub.iron6, GolfClub.iron9},
          balls,
        );
        final sum = result.phases.fold(0, (s, p) => s + p.ballCount);
        expect(sum, balls, reason: '$balls balls');
        expect(result.phases.every((p) => p.ballCount > 0), isTrue);
      }
    });

    test('dial-in gives every club its own full-potential block, shortest '
        'first', () async {
      final result = plan(
        SessionTemplates.dialIn,
        {GolfClub.driver, GolfClub.iron5, GolfClub.sandWedge},
        50,
      );

      expect(result.phases.length, 4);
      expect(result.phases.first.intent, ShotIntent.practice);
      expect(result.phases.skip(1).map((p) => p.clubs.single), [
        GolfClub.sandWedge,
        GolfClub.iron5,
        GolfClub.driver,
      ]);
      expect(result.phases.skip(1).every((p) => !p.isPractice), isTrue);
      expect(result.phases.map((p) => p.ballCount), [8, 14, 14, 14]);
    });

    test('quick bucket picks the nearest short or mid iron to drill', () async {
      final result = plan(
        SessionTemplates.quick,
        {GolfClub.driver, GolfClub.iron9, GolfClub.wood3},
        30,
      );

      expect(result.phases[1].kind, PracticePhaseKind.block);
      expect(result.phases[1].clubs, [GolfClub.iron9]);
      expect(result.phases.map((p) => p.ballCount), [6, 12, 12]);
    });

    test(
      'with only one club the pressured drill becomes three windows',
      () async {
        final result = plan(SessionTemplates.focused, {
          GolfClub.iron7,
        }, 40);

        expect(result.phases[3].drills.first, contains('three windows'));
        expect(result.phases[2].clubs, [GolfClub.iron7]);
      },
    );

    test('rejects too few balls, and a bag with only a putter', () async {
      final fewBalls = usecase(
        template: SessionTemplates.focused,
        clubs: {GolfClub.iron7},
        ballCount: 25,
      );
      expect(fewBalls.isLeft(), isTrue);
      expect(fewBalls.fold((f) => f.message, (_) => ''), contains('40'));

      final putterOnly = usecase(
        template: SessionTemplates.quick,
        clubs: {GolfClub.putter},
        ballCount: 50,
      );
      expect(putterOnly.isLeft(), isTrue);
    });
  });
}
