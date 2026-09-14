import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:protrack_golf/core/core.dart';

part 'session_template.freezed.dart';

/// A named way to structure a bucket of balls. Templates are static
/// catalogue entries; `BuildSessionPlanUsecase` turns one into a concrete
/// `SessionPlan` for the golfer's clubs and ball count.
@freezed
abstract class SessionTemplate with _$SessionTemplate {
  const factory SessionTemplate({
    @Default('') String id,
    @Default('') String name,
    @Default('') String tagline,
    @Default('') String description,
    @Default(0) int minBalls,
    @Default(0) int idealBalls,
    @Default(0) int durationMinutes,
    @Default(<PracticePhaseKind>[]) List<PracticePhaseKind> phaseKinds,
  }) = _SessionTemplate;

  const SessionTemplate._();

  static const empty = SessionTemplate();

  bool supportsBucket(int ballCount) => ballCount >= minBalls;
}
