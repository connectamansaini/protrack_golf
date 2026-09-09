import 'package:json_annotation/json_annotation.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/bucket_sessions/entities/shot_log.dart';

part 'shot_log_model.g.dart';

/// Infrastructure DTO for [ShotLog]. `timestamp` is stored as epoch
/// milliseconds and every enum as its `name` string; all parsing back into
/// entity types happens in [toEntity].
@JsonSerializable()
class ShotLogModel {
  const ShotLogModel({
    this.timestampEpochMs = 0,
    this.shotIndex = 0,
    this.club = 'driver',
    this.contact = 'crisp',
    this.direction = 'straight',
    this.outcome = 'hitTarget',
    this.carryDistanceYds = 0,
    this.dispersionXYds = 0,
    this.dispersionYYds = 0,
  });

  factory ShotLogModel.fromJson(Map<String, dynamic> json) =>
      _$ShotLogModelFromJson(json);

  factory ShotLogModel.fromEntity(ShotLog entity) => ShotLogModel(
    timestampEpochMs: entity.timestamp.millisecondsSinceEpoch,
    shotIndex: entity.shotIndex,
    club: entity.club.name,
    contact: entity.contact.name,
    direction: entity.direction.name,
    outcome: entity.outcome.name,
    carryDistanceYds: entity.carryDistanceYds,
    dispersionXYds: entity.dispersionXYds,
    dispersionYYds: entity.dispersionYYds,
  );

  final int timestampEpochMs;
  final int shotIndex;
  final String club;
  final String contact;
  final String direction;
  final String outcome;
  final double carryDistanceYds;
  final double dispersionXYds;
  final double dispersionYYds;

  static const empty = ShotLogModel();

  Map<String, dynamic> toJson() => _$ShotLogModelToJson(this);

  ShotLog get toEntity => ShotLog(
    timestamp: DateTime.fromMillisecondsSinceEpoch(timestampEpochMs),
    shotIndex: shotIndex,
    club: GolfClub.fromName(club),
    contact: ContactQuality.fromName(contact),
    direction: ShotDirection.fromName(direction),
    outcome: TargetOutcome.fromName(outcome),
    carryDistanceYds: carryDistanceYds,
    dispersionXYds: dispersionXYds,
    dispersionYYds: dispersionYYds,
  );
}
