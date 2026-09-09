import 'package:json_annotation/json_annotation.dart';
import 'package:protrack_golf/src/locations/entities/location.dart';

part 'location_model.g.dart';

/// Infrastructure DTO for [Location]. No nullable fields - every field has
/// a default so a partially-corrupt Hive record still parses.
@JsonSerializable()
class LocationModel {
  const LocationModel({this.id = '', this.name = '', this.notes = ''});

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  factory LocationModel.fromEntity(Location entity) => LocationModel(
    id: entity.id,
    name: entity.name,
    notes: entity.notes,
  );

  final String id;
  final String name;
  final String notes;

  static const empty = LocationModel();

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);

  Location get toEntity => Location(id: id, name: name, notes: notes);
}
