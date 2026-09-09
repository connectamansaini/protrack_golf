import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/routines/entities/routine_phase.dart';

part 'practice_routine.freezed.dart';

/// A generated, phase-based practice plan for a single bucket of balls,
/// tailored to the golfer's [HandicapTier].
@freezed
abstract class PracticeRoutine with _$PracticeRoutine {
  const factory PracticeRoutine({
    required DateTime createdAt,
    @Default('') String id,
    @Default(0) int bucketSize,
    @Default(HandicapTier.beginner) HandicapTier handicapTier,
    @Default(<RoutinePhase>[]) List<RoutinePhase> phases,
  }) = _PracticeRoutine;

  const PracticeRoutine._();

  static PracticeRoutine empty = PracticeRoutine(createdAt: DateTime(2000));

  int get totalAllocatedShots =>
      phases.fold(0, (sum, phase) => sum + phase.shotAllocation);
}
