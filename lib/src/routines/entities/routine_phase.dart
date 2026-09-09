import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/routines/entities/drill.dart';

part 'routine_phase.freezed.dart';

/// One stage of a generated `PracticeRoutine` - e.g. Warm-up or Long Game -
/// carrying its own ball allocation and drills.
@freezed
abstract class RoutinePhase with _$RoutinePhase {
  const factory RoutinePhase({
    @Default(RoutinePhaseType.warmUp) RoutinePhaseType type,
    @Default('') String title,
    @Default(<Drill>[]) List<Drill> drills,
    @Default(0) int shotAllocation,
  }) = _RoutinePhase;

  const RoutinePhase._();

  static const empty = RoutinePhase();
}
