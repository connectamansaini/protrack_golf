import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/my_bag/entities/club_distance_record.dart';
import 'package:protrack_golf/src/progress/progress.dart';

/// The green header of a club's detail screen: what it is, the golfer's own
/// distance next to the range numbers, and a one-line read on the trend.
/// Entities in, nothing out.
class ClubDetailHero extends StatelessWidget {
  const ClubDetailHero({required this.record, required this.trend, super.key});

  final ClubDistanceRecord record;
  final ClubTrend trend;

  /// Trend moves smaller than this read as flat.
  static const double _flatBandYds = 1;

  String? get _trendLine {
    if (trend.dataPoints.length < 2) return null;
    final delta = trend.trendDelta;
    if (delta > _flatBandYds) {
      return 'Trending up ${delta.toStringAsFixed(0)} yds on your early '
          'sessions.';
    }
    if (delta < -_flatBandYds) {
      return 'Down ${delta.abs().toStringAsFixed(0)} yds on your early '
          'sessions - a few more balls will settle it.';
    }
    return 'Holding steady across your sessions.';
  }

  @override
  Widget build(BuildContext context) {
    final trendLine = _trendLine;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.fairwayGreen,
        borderRadius: BorderRadius.circular(AppRadii.lg),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    record.club.category.label,
                    style: AppTypography.textTheme.labelMedium?.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
                if (record.inBag) const _InBagPill(),
              ],
            ),
            Text(
              record.club.label,
              style: AppTypography.textTheme.headlineMedium?.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: _Stat(
                    value: record.hasManualDistance
                        ? record.manualDistanceYds.toStringAsFixed(0)
                        : '—',
                    label: 'your yds',
                  ),
                ),
                Expanded(
                  child: _Stat(
                    value: record.hasSessionData
                        ? record.averageYds.toStringAsFixed(0)
                        : '—',
                    label: 'range avg',
                  ),
                ),
                Expanded(
                  child: _Stat(
                    value: record.hasSessionData
                        ? record.bestYds.toStringAsFixed(0)
                        : '—',
                    label: 'best',
                  ),
                ),
              ],
            ),
            if (record.hasSessionData) ...[
              const SizedBox(height: AppSpacing.sm),
              Text(
                '${record.shotCount} shot${record.shotCount == 1 ? '' : 's'}'
                '  ·  ${record.sessionCount} session'
                '${record.sessionCount == 1 ? '' : 's'}',
                style: AppTypography.textTheme.bodySmall?.copyWith(
                  color: AppColors.white,
                ),
              ),
            ],
            if (trendLine != null) ...[
              const SizedBox(height: AppSpacing.sm),
              Text(
                trendLine,
                style: AppTypography.textTheme.bodyLarge?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: AppTypography.textTheme.headlineMedium?.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          label,
          style: AppTypography.textTheme.bodySmall?.copyWith(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}

class _InBagPill extends StatelessWidget {
  const _InBagPill();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xs,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadii.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check,
            size: AppSpacing.md,
            color: AppColors.fairwayGreen,
          ),
          const SizedBox(width: AppSpacing.xxs),
          Text(
            'In bag',
            style: AppTypography.textTheme.labelSmall?.copyWith(
              color: AppColors.fairwayGreen,
            ),
          ),
        ],
      ),
    );
  }
}
