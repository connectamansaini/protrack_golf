import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/my_bag/entities/club_session_summary.dart';

/// One row of the "sessions with this club" list: a date badge, shots and
/// best, with that session's average on the right. Entity in, callback out.
class ClubSessionSummaryTile extends StatelessWidget {
  const ClubSessionSummaryTile({required this.summary, super.key, this.onTap});

  final ClubSessionSummary summary;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadii.md),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.sm),
          child: Row(
            children: [
              _DateBadge(date: summary.date),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormatter.mediumDate(summary.date),
                      style: AppTypography.textTheme.titleMedium,
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      '${summary.shots} shot${summary.shots == 1 ? '' : 's'}'
                      '  ·  best ${summary.bestYds.toStringAsFixed(0)} yds',
                      style: AppTypography.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    summary.averageYds.toStringAsFixed(0),
                    style: AppTypography.textTheme.titleLarge?.copyWith(
                      color: AppColors.fairwayGreen,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text('avg yds', style: AppTypography.textTheme.labelSmall),
                ],
              ),
              if (onTap != null) ...[
                const SizedBox(width: AppSpacing.xxs),
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.textSecondary,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _DateBadge extends StatelessWidget {
  const _DateBadge({required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSpacing.xxl,
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxs),
      decoration: BoxDecoration(
        color: AppColors.fairwayGreenTint,
        borderRadius: BorderRadius.circular(AppRadii.sm),
      ),
      child: Column(
        children: [
          Text(
            '${date.day}',
            style: AppTypography.textTheme.titleLarge?.copyWith(
              color: AppColors.fairwayGreen,
              fontWeight: FontWeight.w800,
              height: 1,
            ),
          ),
          Text(
            DateFormatter.shortMonth(date).toUpperCase(),
            style: AppTypography.textTheme.labelSmall?.copyWith(
              color: AppColors.fairwayGreen,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
