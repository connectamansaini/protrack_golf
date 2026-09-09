import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/progress/entities/trend_point.dart';

part 'club_trend.freezed.dart';

/// Average-distance history for a single club, computed from a golfer's
/// logged practice sessions - oldest to newest.
@freezed
abstract class ClubTrend with _$ClubTrend {
  const factory ClubTrend({
    @Default(GolfClub.driver) GolfClub club,
    @Default(<TrendPoint>[]) List<TrendPoint> dataPoints,
  }) = _ClubTrend;

  const ClubTrend._();

  static const empty = ClubTrend();

  double get latestAverage =>
      dataPoints.isEmpty ? 0 : dataPoints.last.averageDistance;

  double get overallAverage {
    if (dataPoints.isEmpty) return 0;
    final total = dataPoints
        .map((point) => point.averageDistance)
        .reduce((a, b) => a + b);
    return total / dataPoints.length;
  }

  /// A simple, honest signal - not statistically rigorous - comparing the
  /// average of the first half of sessions to the second half.
  double get trendDelta {
    if (dataPoints.length < 2) return 0;
    final midpoint = dataPoints.length ~/ 2;
    final earlier = dataPoints.take(midpoint);
    final later = dataPoints.skip(midpoint);
    final earlierAvg =
        earlier.map((p) => p.averageDistance).reduce((a, b) => a + b) /
        earlier.length;
    final laterAvg =
        later.map((p) => p.averageDistance).reduce((a, b) => a + b) /
        later.length;
    return laterAvg - earlierAvg;
  }
}
