// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrillModel _$DrillModelFromJson(Map<String, dynamic> json) => DrillModel(
  title: json['title'] as String? ?? '',
  instructions: json['instructions'] as String? ?? '',
  shotCount: (json['shotCount'] as num?)?.toInt() ?? 0,
  suggestedClub: json['suggestedClub'] as String?,
);

Map<String, dynamic> _$DrillModelToJson(DrillModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'instructions': instance.instructions,
      'shotCount': instance.shotCount,
      'suggestedClub': instance.suggestedClub,
    };
