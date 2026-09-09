import 'package:json_annotation/json_annotation.dart';
import 'package:protrack_golf/src/sessions/entities/practice_session.dart';
import 'package:protrack_golf/src/sessions/models/club_entry_model.dart';

part 'practice_session_model.g.dart';

/// Infrastructure DTO for [PracticeSession]. The date is stored as epoch
/// milliseconds; parsing back into [DateTime] happens in [toEntity].
@JsonSerializable(explicitToJson: true)
class PracticeSessionModel {
  const PracticeSessionModel({
    this.id = '',
    this.dateEpochMs = 0,
    this.locationId = '',
    this.bucketSize = 0,
    this.clubEntries = const <ClubEntryModel>[],
    this.notes = '',
    this.mediaPaths = const <String>[],
  });

  factory PracticeSessionModel.fromJson(Map<String, dynamic> json) =>
      _$PracticeSessionModelFromJson(json);

  factory PracticeSessionModel.fromEntity(PracticeSession entity) =>
      PracticeSessionModel(
        id: entity.id,
        dateEpochMs: entity.date.millisecondsSinceEpoch,
        locationId: entity.locationId,
        bucketSize: entity.bucketSize,
        clubEntries: entity.clubEntries.map(ClubEntryModel.fromEntity).toList(),
        notes: entity.notes,
        mediaPaths: entity.mediaPaths,
      );

  final String id;
  final int dateEpochMs;
  final String locationId;
  final int bucketSize;
  final List<ClubEntryModel> clubEntries;
  final String notes;
  final List<String> mediaPaths;

  static const empty = PracticeSessionModel();

  Map<String, dynamic> toJson() => _$PracticeSessionModelToJson(this);

  PracticeSession get toEntity => PracticeSession(
    id: id,
    date: DateTime.fromMillisecondsSinceEpoch(dateEpochMs),
    locationId: locationId,
    bucketSize: bucketSize,
    clubEntries: clubEntries.map((model) => model.toEntity).toList(),
    notes: notes,
    mediaPaths: mediaPaths,
  );
}
