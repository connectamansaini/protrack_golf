import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:protrack_golf/core/core.dart';

part 'shot_log.freezed.dart';

/// A single logged shot: club, contact quality, flight shape, and outcome
/// relative to the target, plus enough numbers to plot it on a dispersion
/// chart (see [DispersionMath]).
@freezed
abstract class ShotLog with _$ShotLog {
  const factory ShotLog({
    required DateTime timestamp,
    @Default(0) int shotIndex,
    @Default(GolfClub.driver) GolfClub club,
    @Default(ContactQuality.crisp) ContactQuality contact,
    @Default(ShotDirection.straight) ShotDirection direction,
    @Default(TargetOutcome.hitTarget) TargetOutcome outcome,
    @Default(0) double carryDistanceYds,
    @Default(0) double dispersionXYds,
    @Default(0) double dispersionYYds,
  }) = _ShotLog;

  const ShotLog._();

  static ShotLog empty = ShotLog(timestamp: DateTime(2000));

  bool get isSolidContact => contact == ContactQuality.crisp;
}
