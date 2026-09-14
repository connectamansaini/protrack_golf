import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';

/// The green status card at the top of the range logger: balls left (big,
/// readable at arm's length), bucket progress, and how the currently
/// selected club is going this session. Numbers in, nothing out.
class BallsRemainingCounter extends StatelessWidget {
  const BallsRemainingCounter({
    required this.remaining,
    required this.hit,
    required this.bucketSize,
    required this.currentClubLabel,
    super.key,
    this.currentClubShots = 0,
    this.currentClubPracticeShots = 0,
    this.currentClubAverageYds = 0,
  });

  final int remaining;
  final int hit;
  final int bucketSize;
  final String currentClubLabel;

  /// Every ball hit with the current club this session.
  final int currentClubShots;

  /// How many of [currentClubShots] were practice balls (not averaged).
  final int currentClubPracticeShots;

  /// Average of the current club's full-potential shots.
  final double currentClubAverageYds;

  String get _clubLine {
    final full = currentClubShots - currentClubPracticeShots;
    if (currentClubShots == 0) return 'No $currentClubLabel shots yet';
    if (full == 0) {
      return '$currentClubPracticeShots practice  ·  none counted yet';
    }
    final avg =
        '$full counted  ·  avg '
        '${currentClubAverageYds.toStringAsFixed(0)} yds';
    return currentClubPracticeShots == 0
        ? avg
        : '$avg  ·  $currentClubPracticeShots practice';
  }

  @override
  Widget build(BuildContext context) {
    final progress = bucketSize == 0 ? 0.0 : (hit / bucketSize).clamp(0.0, 1.0);
    final clubLine = _clubLine;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.fairwayGreen,
        borderRadius: BorderRadius.circular(AppRadii.lg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$remaining',
                style: AppTypography.textTheme.displayLarge?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w800,
                  height: 1,
                ),
              ),
              const SizedBox(width: AppSpacing.xs),
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.xxs),
                child: Text(
                  'balls left',
                  style: AppTypography.textTheme.titleMedium?.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    currentClubLabel,
                    style: AppTypography.textTheme.titleMedium?.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    clubLine,
                    style: AppTypography.textTheme.bodySmall?.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadii.pill),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: AppSpacing.xs,
              color: AppColors.white,
              backgroundColor: AppColors.fairwayGreenDark,
            ),
          ),
          const SizedBox(height: AppSpacing.xxs),
          Text(
            '$hit of $bucketSize hit',
            style: AppTypography.textTheme.bodySmall?.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
