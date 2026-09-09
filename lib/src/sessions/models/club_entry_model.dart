import 'package:json_annotation/json_annotation.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/sessions/entities/club_entry.dart';

part 'club_entry_model.g.dart';

/// Infrastructure DTO for [ClubEntry]. The club is stored as its enum
/// `name` string; parsing back into [GolfClub] happens in [toEntity].
@JsonSerializable()
class ClubEntryModel {
  const ClubEntryModel({
    this.club = 'driver',
    this.distances = const <double>[],
    this.notes = '',
  });

  factory ClubEntryModel.fromJson(Map<String, dynamic> json) =>
      _$ClubEntryModelFromJson(json);

  factory ClubEntryModel.fromEntity(ClubEntry entity) => ClubEntryModel(
    club: entity.club.name,
    distances: entity.distances,
    notes: entity.notes,
  );

  final String club;
  final List<double> distances;
  final String notes;

  static const empty = ClubEntryModel();

  Map<String, dynamic> toJson() => _$ClubEntryModelToJson(this);

  ClubEntry get toEntity => ClubEntry(
    club: GolfClub.fromName(club),
    distances: distances,
    notes: notes,
  );
}
