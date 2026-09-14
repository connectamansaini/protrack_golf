import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:protrack_golf/src/plans/entities/plan_phase.dart';

part 'session_plan.freezed.dart';

/// A template applied to a real bucket: the ordered phases with their ball
/// counts summing to [totalBalls].
@freezed
abstract class SessionPlan with _$SessionPlan {
  const factory SessionPlan({
    @Default('') String templateId,
    @Default('') String templateName,
    @Default(0) int totalBalls,
    @Default(<PlanPhase>[]) List<PlanPhase> phases,
  }) = _SessionPlan;

  const SessionPlan._();

  static const empty = SessionPlan();

  int get phaseCount => phases.length;

  int get practiceBalls => phases
      .where((phase) => phase.isPractice)
      .fold(0, (sum, phase) => sum + phase.ballCount);

  int get fullBalls => totalBalls - practiceBalls;

  /// Balls hit before phase [index] starts.
  int ballsBefore(int index) =>
      phases.take(index).fold(0, (sum, phase) => sum + phase.ballCount);
}
