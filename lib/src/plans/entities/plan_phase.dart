import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:protrack_golf/core/core.dart';

part 'plan_phase.freezed.dart';

/// One block of a `SessionPlan`: how many balls, with which clubs, whether
/// they are practice or full-potential swings, and what to do with them.
@freezed
abstract class PlanPhase with _$PlanPhase {
  const factory PlanPhase({
    @Default(PracticePhaseKind.warmUp) PracticePhaseKind kind,
    @Default('') String title,
    @Default(ShotIntent.full) ShotIntent intent,
    @Default(0) int ballCount,
    @Default(<GolfClub>[]) List<GolfClub> clubs,
    @Default('') String goal,
    @Default(<String>[]) List<String> drills,
  }) = _PlanPhase;

  const PlanPhase._();

  static const empty = PlanPhase();

  bool get isPractice => intent == ShotIntent.practice;
}
