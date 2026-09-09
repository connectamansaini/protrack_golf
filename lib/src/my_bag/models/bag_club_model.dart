import 'package:json_annotation/json_annotation.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/my_bag/entities/bag_club.dart';

part 'bag_club_model.g.dart';

/// Infrastructure DTO for [BagClub]. The club is stored as its enum `name`
/// string (which doubles as the Hive key, so a club appears at most once)
/// and `addedAt` as epoch milliseconds; both are parsed back in [toEntity].
@JsonSerializable()
class BagClubModel {
  const BagClubModel({
    this.club = 'driver',
    this.distanceYds = 0,
    this.addedAtEpochMs = 0,
  });

  factory BagClubModel.fromJson(Map<String, dynamic> json) =>
      _$BagClubModelFromJson(json);

  factory BagClubModel.fromEntity(BagClub entity) => BagClubModel(
    club: entity.club.name,
    distanceYds: entity.distanceYds,
    addedAtEpochMs: entity.addedAt.millisecondsSinceEpoch,
  );

  final String club;
  final double distanceYds;
  final int addedAtEpochMs;

  static const empty = BagClubModel();

  Map<String, dynamic> toJson() => _$BagClubModelToJson(this);

  BagClub get toEntity => BagClub(
    club: GolfClub.fromName(club),
    distanceYds: distanceYds,
    addedAt: DateTime.fromMillisecondsSinceEpoch(addedAtEpochMs),
  );
}
