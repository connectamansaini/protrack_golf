// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_phase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutinePhaseModel _$RoutinePhaseModelFromJson(Map<String, dynamic> json) =>
    RoutinePhaseModel(
      type: json['type'] as String? ?? 'warmUp',
      title: json['title'] as String? ?? '',
      drills:
          (json['drills'] as List<dynamic>?)
              ?.map((e) => DrillModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <DrillModel>[],
      shotAllocation: (json['shotAllocation'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$RoutinePhaseModelToJson(RoutinePhaseModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'drills': instance.drills.map((e) => e.toJson()).toList(),
      'shotAllocation': instance.shotAllocation,
    };
