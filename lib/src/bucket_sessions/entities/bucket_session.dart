import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/bucket_sessions/entities/shot_log.dart';

part 'bucket_session.freezed.dart';

/// A single range visit run through the 2-tap shot logger, optionally
/// against a generated `PracticeRoutine`, ready for the post-session
/// quality score and dispersion plot.
@freezed
abstract class BucketSession with _$BucketSession {
  const factory BucketSession({
    required DateTime date,
    @Default('') String id,
    @Default('') String locationId,
    @Default('') String routineId,
    @Default(0) int bucketSize,
    @Default(HandicapTier.beginner) HandicapTier handicapTier,
    @Default(<ShotLog>[]) List<ShotLog> shots,
    @Default('') String notes,
  }) = _BucketSession;

  const BucketSession._();

  static BucketSession empty = BucketSession(date: DateTime(2000));

  int get ballsRemaining => (bucketSize - shots.length).clamp(0, bucketSize);

  /// Session quality score: the share of shots logged with crisp contact.
  double get flushedRate => shots.isEmpty
      ? 0
      : shots.where((shot) => shot.isSolidContact).length / shots.length;
}
