import 'package:json_annotation/json_annotation.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/bucket_sessions/entities/bucket_session.dart';
import 'package:protrack_golf/src/bucket_sessions/models/shot_log_model.dart';

part 'bucket_session_model.g.dart';

/// Infrastructure DTO for [BucketSession]. `date` is stored as epoch
/// milliseconds and `handicapTier` as its enum `name` string; both are
/// parsed back in [toEntity].
@JsonSerializable(explicitToJson: true)
class BucketSessionModel {
  const BucketSessionModel({
    this.id = '',
    this.dateEpochMs = 0,
    this.locationId = '',
    this.routineId = '',
    this.bucketSize = 0,
    this.handicapTier = 'beginner',
    this.shots = const <ShotLogModel>[],
    this.notes = '',
  });

  factory BucketSessionModel.fromJson(Map<String, dynamic> json) =>
      _$BucketSessionModelFromJson(json);

  factory BucketSessionModel.fromEntity(BucketSession entity) =>
      BucketSessionModel(
        id: entity.id,
        dateEpochMs: entity.date.millisecondsSinceEpoch,
        locationId: entity.locationId,
        routineId: entity.routineId,
        bucketSize: entity.bucketSize,
        handicapTier: entity.handicapTier.name,
        shots: entity.shots.map(ShotLogModel.fromEntity).toList(),
        notes: entity.notes,
      );

  final String id;
  final int dateEpochMs;
  final String locationId;
  final String routineId;
  final int bucketSize;
  final String handicapTier;
  final List<ShotLogModel> shots;
  final String notes;

  static const empty = BucketSessionModel();

  Map<String, dynamic> toJson() => _$BucketSessionModelToJson(this);

  BucketSession get toEntity => BucketSession(
    id: id,
    date: DateTime.fromMillisecondsSinceEpoch(dateEpochMs),
    locationId: locationId,
    routineId: routineId,
    bucketSize: bucketSize,
    handicapTier: HandicapTier.fromName(handicapTier),
    shots: shots.map((model) => model.toEntity).toList(),
    notes: notes,
  );
}
