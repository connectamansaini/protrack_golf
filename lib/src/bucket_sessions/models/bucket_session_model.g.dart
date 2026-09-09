// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bucket_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BucketSessionModel _$BucketSessionModelFromJson(Map<String, dynamic> json) =>
    BucketSessionModel(
      id: json['id'] as String? ?? '',
      dateEpochMs: (json['dateEpochMs'] as num?)?.toInt() ?? 0,
      locationId: json['locationId'] as String? ?? '',
      routineId: json['routineId'] as String? ?? '',
      bucketSize: (json['bucketSize'] as num?)?.toInt() ?? 0,
      handicapTier: json['handicapTier'] as String? ?? 'beginner',
      shots:
          (json['shots'] as List<dynamic>?)
              ?.map((e) => ShotLogModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ShotLogModel>[],
      notes: json['notes'] as String? ?? '',
    );

Map<String, dynamic> _$BucketSessionModelToJson(BucketSessionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateEpochMs': instance.dateEpochMs,
      'locationId': instance.locationId,
      'routineId': instance.routineId,
      'bucketSize': instance.bucketSize,
      'handicapTier': instance.handicapTier,
      'shots': instance.shots.map((e) => e.toJson()).toList(),
      'notes': instance.notes,
    };
