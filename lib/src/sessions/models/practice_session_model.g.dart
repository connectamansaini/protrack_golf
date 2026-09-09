// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'practice_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PracticeSessionModel _$PracticeSessionModelFromJson(
  Map<String, dynamic> json,
) => PracticeSessionModel(
  id: json['id'] as String? ?? '',
  dateEpochMs: (json['dateEpochMs'] as num?)?.toInt() ?? 0,
  locationId: json['locationId'] as String? ?? '',
  bucketSize: (json['bucketSize'] as num?)?.toInt() ?? 0,
  clubEntries:
      (json['clubEntries'] as List<dynamic>?)
          ?.map((e) => ClubEntryModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ClubEntryModel>[],
  notes: json['notes'] as String? ?? '',
  mediaPaths:
      (json['mediaPaths'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
);

Map<String, dynamic> _$PracticeSessionModelToJson(
  PracticeSessionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'dateEpochMs': instance.dateEpochMs,
  'locationId': instance.locationId,
  'bucketSize': instance.bucketSize,
  'clubEntries': instance.clubEntries.map((e) => e.toJson()).toList(),
  'notes': instance.notes,
  'mediaPaths': instance.mediaPaths,
};
