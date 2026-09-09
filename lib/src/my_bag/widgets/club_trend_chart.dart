import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/progress/progress.dart';

/// A themed line chart of one club's average distance per session, oldest
/// to newest (x = session index, y = yards). Entity in, no logic beyond
/// mapping data points to chart spots and axis bounds.
class ClubTrendChart extends StatelessWidget {
  const ClubTrendChart({required this.trend, super.key});

  final ClubTrend trend;

  static const double _height = 220;
  static const int _maxBottomLabels = 5;

  @override
  Widget build(BuildContext context) {
    final points = trend.dataPoints;
    final spots = [
      for (var i = 0; i < points.length; i++)
        FlSpot(i.toDouble(), points[i].averageDistance),
    ];
    final yValues = points.map((p) => p.averageDistance);
    final minYds = yValues.isEmpty ? 0.0 : yValues.reduce(math.min);
    final maxYds = yValues.isEmpty ? 0.0 : yValues.reduce(math.max);
    final padding = math.max(5, (maxYds - minYds) * 0.2);
    final minY = math.max(0, ((minYds - padding) / 10).floor() * 10).toDouble();
    final maxY = (((maxYds + padding) / 10).ceil() * 10).toDouble();
    final labelStep = math.max(1, (points.length / _maxBottomLabels).ceil());

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.xs,
          AppSpacing.md,
          AppSpacing.md,
          AppSpacing.xs,
        ),
        child: SizedBox(
          height: _height,
          child: LineChart(
            LineChartData(
              minX: 0,
              maxX: math.max(1, points.length - 1).toDouble(),
              minY: minY,
              maxY: maxY,
              gridData: FlGridData(
                drawVerticalLine: false,
                getDrawingHorizontalLine: (_) =>
                    const FlLine(color: AppColors.divider, strokeWidth: 1),
              ),
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(),
                rightTitles: const AxisTitles(),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    getTitlesWidget: (value, meta) => Text(
                      value.toStringAsFixed(0),
                      style: AppTypography.textTheme.bodySmall,
                    ),
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 28,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      final index = value.round();
                      final isWholeIndex = (value - index).abs() < 0.01;
                      if (!isWholeIndex ||
                          index < 0 ||
                          index >= points.length ||
                          index % labelStep != 0) {
                        return const SizedBox.shrink();
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top: AppSpacing.xs),
                        child: Text(
                          DateFormatter.shortDate(points[index].date),
                          style: AppTypography.textTheme.bodySmall,
                        ),
                      );
                    },
                  ),
                ),
              ),
              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  getTooltipColor: (_) => AppColors.fairwayGreenDark,
                  getTooltipItems: (touchedSpots) => [
                    for (final spot in touchedSpots)
                      LineTooltipItem(
                        '${spot.y.toStringAsFixed(0)} yds',
                        AppTypography.textTheme.labelLarge ??
                            const TextStyle(color: AppColors.white),
                      ),
                  ],
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  curveSmoothness: 0.25,
                  preventCurveOverShooting: true,
                  color: AppColors.fairwayGreen,
                  barWidth: 3,
                  dotData: FlDotData(
                    getDotPainter: (spot, percent, bar, index) =>
                        FlDotCirclePainter(
                          radius: 4,
                          color: AppColors.sandGold,
                          strokeColor: AppColors.white,
                          strokeWidth: 2,
                        ),
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    color: AppColors.fairwayGreenLight.withValues(alpha: 0.15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
