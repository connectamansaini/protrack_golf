// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'practice_routine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PracticeRoutineModel _$PracticeRoutineModelFromJson(
  Map<String, dynamic> json,
) => PracticeRoutineModel(
  id: json['id'] as String? ?? '',
  createdAtEpochMs: (json['createdAtEpochMs'] as num?)?.toInt() ?? 0,
  bucketSize: (json['bucketSize'] as num?)?.toInt() ?? 0,
  handicapTier: json['handicapTier'] as String? ?? 'beginner',
  phases:
      (json['phases'] as List<dynamic>?)
          ?.map((e) => RoutinePhaseModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <RoutinePhaseModel>[],
);

Map<String, dynamic> _$PracticeRoutineModelToJson(
  PracticeRoutineModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'createdAtEpochMs': instance.createdAtEpochMs,
  'bucketSize': instance.bucketSize,
  'handicapTier': instance.handicapTier,
  'phases': instance.phases.map((e) => e.toJson()).toList(),
};
