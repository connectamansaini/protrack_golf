import 'package:dartz/dartz.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/plans/entities/plan_phase.dart';
import 'package:protrack_golf/src/plans/entities/session_plan.dart';
import 'package:protrack_golf/src/plans/entities/session_template.dart';
import 'package:protrack_golf/src/plans/helpers/plans_failure.dart';
import 'package:protrack_golf/src/plans/helpers/session_templates.dart';

/// Turns a [SessionTemplate] into a concrete [SessionPlan] for the clubs
/// the golfer brought and the bucket they bought: which phases, how many
/// balls each, which clubs, and what to do with them.
///
/// Synchronous on purpose: it is a pure computation, and the range logger
/// recomputes it inside event handlers that must not yield mid-update.
class BuildSessionPlanUsecase {
  const BuildSessionPlanUsecase();

  Either<PlansFailure, SessionPlan> call({
    required SessionTemplate template,
    required Set<GolfClub> clubs,
    required int ballCount,
  }) {
    // Longest to shortest, putter excluded: you can't log putts at a range.
    final ordered = [
      for (final club in GolfClub.values)
        if (clubs.contains(club) && club != GolfClub.putter) club,
    ];
    if (ordered.isEmpty) {
      return Left(
        PlansFailure('Pick at least one club (other than the putter).'),
      );
    }
    if (!template.supportsBucket(ballCount)) {
      return Left(
        PlansFailure(
          '${template.name} needs at least ${template.minBalls} balls.',
        ),
      );
    }
    final phases = switch (template.id) {
      SessionTemplates.focusedId => _focused(ordered, ballCount),
      SessionTemplates.dialInId => _dialIn(ordered, ballCount),
      SessionTemplates.quickId => _quick(ordered, ballCount),
      _ => null,
    };
    if (phases == null) {
      return Left(PlansFailure('Unknown session template "${template.id}".'));
    }
    return Right(
      SessionPlan(
        templateId: template.id,
        templateName: template.name,
        totalBalls: ballCount,
        phases: phases,
      ),
    );
  }

  List<PlanPhase> _focused(List<GolfClub> ordered, int balls) {
    final counts = _allocate(balls, const [0.10, 0.25, 0.25, 0.25, 0.15]);
    final focus = _focusClub(ordered);
    return [
      _warmUp(ordered, counts[0]),
      _block(focus, counts[1]),
      _measured(_around(ordered, focus), counts[2]),
      _pressured(ordered, counts[3]),
      _varied(ordered, counts[4], title: 'Varied practice'),
    ];
  }

  List<PlanPhase> _dialIn(List<GolfClub> ordered, int balls) {
    final warm = _allocate(balls, const [0.15, 0.85]).first;
    final perClub = _allocate(
      balls - warm,
      List.filled(ordered.length, 1 / ordered.length),
    );
    // Shortest club first: easier swings early, the driver when loose.
    final shortestFirst = ordered.reversed.toList();
    return [
      _warmUp(ordered, warm),
      for (var i = 0; i < shortestFirst.length; i++)
        _yardage(shortestFirst[i], perClub[i]),
    ];
  }

  List<PlanPhase> _quick(List<GolfClub> ordered, int balls) {
    final counts = _allocate(balls, const [0.20, 0.40, 0.40]);
    return [
      _warmUp(ordered, counts[0]),
      _block(_focusClub(ordered), counts[1]),
      _varied(ordered, counts[2], title: 'Play it'),
    ];
  }

  // ---- phases -------------------------------------------------------------

  PlanPhase _warmUp(List<GolfClub> ordered, int balls) {
    final club = ordered.last;
    const stretch =
        'Before the first ball: 10 lunges, 10 squats, toe taps, assisted '
        'twists, then 10 slow swings holding two clubs together.';
    final swings =
        'Half swings with your ${club.label} at 60% effort. Smooth tempo, '
        'clean contact, no target.';
    const reminder =
        'These are practice balls: they will not count toward your yardages.';
    return PlanPhase(
      title: 'Warm-up',
      intent: ShotIntent.practice,
      ballCount: balls,
      clubs: [club],
      goal: 'Loosen up before you hit a single ball in anger.',
      drills: [stretch, swings, reminder],
    );
  }

  PlanPhase _block(GolfClub focus, int balls) {
    const pickOne =
        'Pick ONE thing to change: turning into your trail hip, a flatter '
        'lead wrist at the top, a fuller finish.';
    final exaggerate =
        'Exaggerate it on every ${focus.label} swing. Where the ball goes '
        'does not matter yet.';
    const rehearse =
        'Same club, same target, slow and deliberate. Rehearse the feel '
        'before each ball.';
    return PlanPhase(
      kind: PracticePhaseKind.block,
      title: 'Block practice',
      intent: ShotIntent.practice,
      ballCount: balls,
      clubs: [focus],
      goal: 'One technical change, exaggerated until it feels normal.',
      drills: [pickOne, exaggerate, rehearse],
    );
  }

  PlanPhase _measured(List<GolfClub> clubs, int balls) {
    const film =
        'Film three swings, or use a training aid, and compare what you feel '
        'with what you see.';
    const zone =
        'Pick a landing zone and count how many balls finish inside it.';
    const counts =
        'Full swings that count: every ball here goes into your yardage chart.';
    return PlanPhase(
      kind: PracticePhaseKind.measured,
      title: 'Measured practice',
      ballCount: balls,
      clubs: clubs,
      goal: 'Check the change holds at full speed.',
      drills: [film, zone, counts],
    );
  }

  PlanPhase _pressured(List<GolfClub> ordered, int balls) {
    final shortestFirst = ordered.reversed.map((c) => c.label).toList();
    final ladder = shortestFirst.length == 1
        ? 'Pick three windows for your ${shortestFirst.first}: short, '
              'normal, long. Hit them in order.'
        : 'Ladder: ${shortestFirst.join(' > ')}. Call the club and a '
              'yardage window before every ball.';
    const restart =
        'Miss the window? Start the ladder again from the shortest club.';
    const commit = 'Every ball counts: normal, committed swings, no rescues.';
    return PlanPhase(
      kind: PracticePhaseKind.pressured,
      title: 'Pressured practice',
      ballCount: balls,
      clubs: ordered,
      goal: 'A game with a consequence.',
      drills: [ladder, restart, commit],
    );
  }

  PlanPhase _varied(
    List<GolfClub> ordered,
    int balls, {
    required String title,
  }) {
    const never = 'Never the same club or the same target twice in a row.';
    const picture =
        'Picture a hole you know: tee shot, approach, pitch. Change the ball '
        'flight if you can.';
    const routine = 'Full pre-shot routine on every ball. These count.';
    return PlanPhase(
      kind: PracticePhaseKind.varied,
      title: title,
      ballCount: balls,
      clubs: ordered,
      goal: 'Play a hole in your head.',
      drills: [never, picture, routine],
    );
  }

  PlanPhase _yardage(GolfClub club, int balls) => PlanPhase(
    kind: PracticePhaseKind.yardage,
    title: '${club.label} yardages',
    ballCount: balls,
    clubs: [club],
    goal: 'Find your real ${club.label} number.',
    drills: const [
      'Normal, committed swings at one target. Not your hardest.',
      'Log every ball, even the thin one. The average is the truth.',
    ],
  );

  // ---- helpers ------------------------------------------------------------

  /// Splits [total] balls by [shares] (which sum to 1). Every phase gets at
  /// least one ball when the bucket allows it; leftover balls go to the
  /// phases with the largest remainders, so the counts always add up.
  static List<int> _allocate(int total, List<double> shares) {
    final raw = [for (final share in shares) share * total];
    final counts = [for (final value in raw) value.floor()];
    for (var i = 0; i < counts.length; i++) {
      if (counts[i] == 0 && total >= counts.length) counts[i] = 1;
    }
    var assigned = counts.fold(0, (sum, c) => sum + c);
    final byRemainder = List.generate(counts.length, (i) => i)
      ..sort((a, b) => (raw[b] - counts[b]).compareTo(raw[a] - counts[a]));
    var cursor = 0;
    while (assigned < total) {
      counts[byRemainder[cursor % counts.length]]++;
      assigned++;
      cursor++;
    }
    while (assigned > total) {
      final richest = List.generate(counts.length, (i) => i)
        ..sort((a, b) => counts[b].compareTo(counts[a]));
      counts[richest.first]--;
      assigned--;
    }
    return counts;
  }

  /// The club to drill with: a 7 iron if it's here, else the nearest mid or
  /// short iron, else whatever sits in the middle of the set.
  static GolfClub _focusClub(List<GolfClub> ordered) {
    const preferred = [
      GolfClub.iron7,
      GolfClub.iron8,
      GolfClub.iron6,
      GolfClub.iron9,
      GolfClub.iron5,
      GolfClub.pitchingWedge,
    ];
    for (final club in preferred) {
      if (ordered.contains(club)) return club;
    }
    return ordered[ordered.length ~/ 2];
  }

  /// The focus club with its immediate longer and shorter neighbours.
  static List<GolfClub> _around(List<GolfClub> ordered, GolfClub focus) {
    final i = ordered.indexOf(focus);
    return [
      if (i > 0) ordered[i - 1],
      focus,
      if (i < ordered.length - 1) ordered[i + 1],
    ];
  }
}
