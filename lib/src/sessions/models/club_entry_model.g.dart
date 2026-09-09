// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClubEntryModel _$ClubEntryModelFromJson(Map<String, dynamic> json) =>
    ClubEntryModel(
      club: json['club'] as String? ?? 'driver',
      distances:
          (json['distances'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          const <double>[],
      notes: json['notes'] as String? ?? '',
    );

Map<String, dynamic> _$ClubEntryModelToJson(ClubEntryModel instance) =>
    <String, dynamic>{
      'club': instance.club,
      'distances': instance.distances,
      'notes': instance.notes,
    };
