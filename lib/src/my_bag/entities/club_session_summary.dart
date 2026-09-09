import 'package:freezed_annotation/freezed_annotation.dart';

part 'club_session_summary.freezed.dart';

/// How a single club performed in a single practice session: when, how many
/// shots, and the average/best distance. Listed under the club's trend
/// chart on the club detail screen.
@freezed
abstract class ClubSessionSummary with _$ClubSessionSummary {
  const factory ClubSessionSummary({
    required DateTime date,
    @Default('') String sessionId,
    @Default(0) int shots,
    @Default(0) double averageYds,
    @Default(0) double bestYds,
  }) = _ClubSessionSummary;

  const ClubSessionSummary._();

  static ClubSessionSummary empty = ClubSessionSummary(date: DateTime(2000));
}
