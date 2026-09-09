import 'package:freezed_annotation/freezed_annotation.dart';

part 'trend_point.freezed.dart';

/// One session's average distance for a given club, used to plot a trend.
@freezed
abstract class TrendPoint with _$TrendPoint {
  const factory TrendPoint({
    required DateTime date,
    @Default(0) double averageDistance,
  }) = _TrendPoint;

  const TrendPoint._();
}
