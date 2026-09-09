import 'package:json_annotation/json_annotation.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/routines/entities/routine_phase.dart';
import 'package:protrack_golf/src/routines/models/drill_model.dart';

part 'routine_phase_model.g.dart';

/// Infrastructure DTO for [RoutinePhase]. The phase `type` is stored as its
/// enum `name` string; parsing back into [RoutinePhaseType] happens in
/// [toEntity].
@JsonSerializable(explicitToJson: true)
class RoutinePhaseModel {
  const RoutinePhaseModel({
    this.type = 'warmUp',
    this.title = '',
    this.drills = const <DrillModel>[],
    this.shotAllocation = 0,
  });

  factory RoutinePhaseModel.fromJson(Map<String, dynamic> json) =>
      _$RoutinePhaseModelFromJson(json);

  factory RoutinePhaseModel.fromEntity(RoutinePhase entity) =>
      RoutinePhaseModel(
        type: entity.type.name,
        title: entity.title,
        drills: entity.drills.map(DrillModel.fromEntity).toList(),
        shotAllocation: entity.shotAllocation,
      );

  final String type;
  final String title;
  final List<DrillModel> drills;
  final int shotAllocation;

  static const empty = RoutinePhaseModel();

  Map<String, dynamic> toJson() => _$RoutinePhaseModelToJson(this);

  RoutinePhase get toEntity => RoutinePhase(
    type: RoutinePhaseType.fromName(type),
    title: title,
    drills: drills.map((model) => model.toEntity).toList(),
    shotAllocation: shotAllocation,
  );
}
