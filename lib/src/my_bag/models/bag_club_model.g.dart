// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bag_club_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BagClubModel _$BagClubModelFromJson(Map<String, dynamic> json) => BagClubModel(
  club: json['club'] as String? ?? 'driver',
  distanceYds: (json['distanceYds'] as num?)?.toDouble() ?? 0,
  addedAtEpochMs: (json['addedAtEpochMs'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$BagClubModelToJson(BagClubModel instance) =>
    <String, dynamic>{
      'club': instance.club,
      'distanceYds': instance.distanceYds,
      'addedAtEpochMs': instance.addedAtEpochMs,
    };
