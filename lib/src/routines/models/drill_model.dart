import 'package:json_annotation/json_annotation.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/routines/entities/drill.dart';

part 'drill_model.g.dart';

/// Infrastructure DTO for [Drill]. `suggestedClub` is stored as its enum
/// `name` string (nullable); parsing back into [GolfClub]? happens in
/// [toEntity].
@JsonSerializable()
class DrillModel {
  const DrillModel({
    this.title = '',
    this.instructions = '',
    this.shotCount = 0,
    this.suggestedClub,
  });

  factory DrillModel.fromJson(Map<String, dynamic> json) =>
      _$DrillModelFromJson(json);

  factory DrillModel.fromEntity(Drill entity) => DrillModel(
    title: entity.title,
    instructions: entity.instructions,
    shotCount: entity.shotCount,
    suggestedClub: entity.suggestedClub?.name,
  );

  final String title;
  final String instructions;
  final int shotCount;
  final String? suggestedClub;

  static const empty = DrillModel();

  Map<String, dynamic> toJson() => _$DrillModelToJson(this);

  Drill get toEntity => Drill(
    title: title,
    instructions: instructions,
    shotCount: shotCount,
    suggestedClub: suggestedClub == null
        ? null
        : GolfClub.fromName(suggestedClub!),
  );
}
