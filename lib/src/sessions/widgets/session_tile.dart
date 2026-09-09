import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/sessions/entities/practice_session.dart';

/// Renders a single [PracticeSession] summary card in the history list: a
/// date badge, where it was, the headline numbers, and the clubs used.
/// Entities in, callbacks out.
class SessionTile extends StatelessWidget {
  const SessionTile({
    required this.session,
    required this.locationName,
    super.key,
    this.onTap,
    this.onDelete,
  });

  final PracticeSession session;
  final String locationName;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final clubCount = session.clubEntries.length;
    final shots = session.totalShots;
    final best = session.bestDistance;
    final summary = [
      '$shots ball${shots == 1 ? '' : 's'}',
      '$clubCount club${clubCount == 1 ? '' : 's'}',
      if (best > 0) 'best ${best.toStringAsFixed(0)} yds',
    ].join('  ·  ');

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadii.md),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.sm),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _DateBadge(date: session.date),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      locationName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.textTheme.titleMedium,
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(summary, style: AppTypography.textTheme.bodySmall),
                    if (clubCount > 0) ...[
                      const SizedBox(height: AppSpacing.xs),
                      Wrap(
                        spacing: AppSpacing.xxs,
                        runSpacing: AppSpacing.xxs,
                        children: [
                          for (final entry in session.clubEntries)
                            _ClubPill(label: entry.club.label),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              if (onDelete != null)
                IconButton(
                  tooltip: 'Delete session',
                  icon: const Icon(
                    Icons.delete_outline,
                    color: AppColors.textSecondary,
                  ),
                  onPressed: onDelete,
                )
              else
                const Padding(
                  padding: EdgeInsets.only(top: AppSpacing.sm),
                  child: Icon(
                    Icons.chevron_right,
                    color: AppColors.textSecondary,
                  ),
                ),
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
      width: AppSpacing.xxl + AppSpacing.xs,
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      decoration: BoxDecoration(
        color: AppColors.fairwayGreenTint,
        borderRadius: BorderRadius.circular(AppRadii.sm),
      ),
      child: Column(
        children: [
          Text(
            '${date.day}',
            style: AppTypography.textTheme.headlineMedium?.copyWith(
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

class _ClubPill extends StatelessWidget {
  const _ClubPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xs,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border, width: AppStrokes.thin),
        borderRadius: BorderRadius.circular(AppRadii.pill),
      ),
      child: Text(label, style: AppTypography.textTheme.labelSmall),
    );
  }
}
