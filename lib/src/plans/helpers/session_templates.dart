import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/plans/entities/session_template.dart';

/// The built-in catalogue. Ids are stable: they are what the range logger
/// remembers as "selected", so never renumber them.
abstract final class SessionTemplates {
  static const focusedId = 'focused';
  static const dialInId = 'dial_in';
  static const quickId = 'quick';

  /// Warm up, bed in one change, measure it, add pressure, then vary. The
  /// classic hour-long structure for getting the most out of a bucket.
  static const focused = SessionTemplate(
    id: focusedId,
    name: 'Focused Practice',
    tagline: 'Five phases, one bucket, real improvement.',
    description:
        'Warm up with practice balls, exaggerate one technical change, '
        'check it holds at full speed, then put it under pressure and '
        'finish by playing a hole in your head.',
    minBalls: 40,
    idealBalls: 100,
    durationMinutes: 60,
    phaseKinds: [
      PracticePhaseKind.warmUp,
      PracticePhaseKind.block,
      PracticePhaseKind.measured,
      PracticePhaseKind.pressured,
      PracticePhaseKind.varied,
    ],
  );

  /// Short warm-up, then an even split of full-potential balls across every
  /// club chosen, so My Bag fills up with honest numbers.
  static const dialIn = SessionTemplate(
    id: dialInId,
    name: 'Dial In Distances',
    tagline: 'Build your yardage chart, one club at a time.',
    description:
        'A few practice balls to loosen up, then a block of committed '
        'swings with each club you brought. Every full ball feeds the '
        'distances in My Bag.',
    minBalls: 20,
    idealBalls: 50,
    durationMinutes: 40,
    phaseKinds: [PracticePhaseKind.warmUp, PracticePhaseKind.yardage],
  );

  /// The lunchtime bucket: loosen up, drill one thing, then play.
  static const quick = SessionTemplate(
    id: quickId,
    name: 'Quick Bucket',
    tagline: 'Short on time? Warm up, drill, play.',
    description:
        'Practice balls to warm up, a block on one feel with your go-to '
        'iron, then the rest at full potential with every club.',
    minBalls: 15,
    idealBalls: 30,
    durationMinutes: 25,
    phaseKinds: [
      PracticePhaseKind.warmUp,
      PracticePhaseKind.block,
      PracticePhaseKind.varied,
    ],
  );

  static const List<SessionTemplate> all = [focused, dialIn, quick];

  static SessionTemplate? byId(String id) =>
      all.where((template) => template.id == id).firstOrNull;
}
