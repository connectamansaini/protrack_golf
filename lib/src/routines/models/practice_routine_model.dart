import 'package:json_annotation/json_annotation.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/routines/entities/practice_routine.dart';
import 'package:protrack_golf/src/routines/models/routine_phase_model.dart';

part 'practice_routine_model.g.dart';

/// Infrastructure DTO for [PracticeRoutine]. `createdAt` is stored as epoch
/// milliseconds and `handicapTier` as its enum `name` string; both are
/// parsed back in [toEntity].
@JsonSerializable(explicitToJson: true)
class PracticeRoutineModel {
  const PracticeRoutineModel({
    this.id = '',
    this.createdAtEpochMs = 0,
    this.bucketSize = 0,
    this.handicapTier = 'beginner',
    this.phases = const <RoutinePhaseModel>[],
  });

  factory PracticeRoutineModel.fromJson(Map<String, dynamic> json) =>
      _$PracticeRoutineModelFromJson(json);

  factory PracticeRoutineModel.fromEntity(PracticeRoutine entity) =>
      PracticeRoutineModel(
        id: entity.id,
        createdAtEpochMs: entity.createdAt.millisecondsSinceEpoch,
        bucketSize: entity.bucketSize,
        handicapTier: entity.handicapTier.name,
        phases: entity.phases.map(RoutinePhaseModel.fromEntity).toList(),
      );

  final String id;
  final int createdAtEpochMs;
  final int bucketSize;
  final String handicapTier;
  final List<RoutinePhaseModel> phases;

  static const empty = PracticeRoutineModel();

  Map<String, dynamic> toJson() => _$PracticeRoutineModelToJson(this);

  PracticeRoutine get toEntity => PracticeRoutine(
    id: id,
    createdAt: DateTime.fromMillisecondsSinceEpoch(createdAtEpochMs),
    bucketSize: bucketSize,
    handicapTier: HandicapTier.fromName(handicapTier),
    phases: phases.map((model) => model.toEntity).toList(),
  );
}
