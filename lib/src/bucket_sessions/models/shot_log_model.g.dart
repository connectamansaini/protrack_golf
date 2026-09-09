// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shot_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShotLogModel _$ShotLogModelFromJson(Map<String, dynamic> json) => ShotLogModel(
  timestampEpochMs: (json['timestampEpochMs'] as num?)?.toInt() ?? 0,
  shotIndex: (json['shotIndex'] as num?)?.toInt() ?? 0,
  club: json['club'] as String? ?? 'driver',
  contact: json['contact'] as String? ?? 'crisp',
  direction: json['direction'] as String? ?? 'straight',
  outcome: json['outcome'] as String? ?? 'hitTarget',
  carryDistanceYds: (json['carryDistanceYds'] as num?)?.toDouble() ?? 0,
  dispersionXYds: (json['dispersionXYds'] as num?)?.toDouble() ?? 0,
  dispersionYYds: (json['dispersionYYds'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$ShotLogModelToJson(ShotLogModel instance) =>
    <String, dynamic>{
      'timestampEpochMs': instance.timestampEpochMs,
      'shotIndex': instance.shotIndex,
      'club': instance.club,
      'contact': instance.contact,
      'direction': instance.direction,
      'outcome': instance.outcome,
      'carryDistanceYds': instance.carryDistanceYds,
      'dispersionXYds': instance.dispersionXYds,
      'dispersionYYds': instance.dispersionYYds,
    };
