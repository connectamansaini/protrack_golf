import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/sessions/entities/range_shot.dart';

/// The last few logged shots, newest first and highlighted, with an "undo
/// last shot" action. Entities in, callback out.
class RecentShotsList extends StatelessWidget {
  const RecentShotsList({required this.shots, super.key, this.onUndo});

  final List<RangeShot> shots;
  final VoidCallback? onUndo;

  static const int _maxVisible = 5;

  @override
  Widget build(BuildContext context) {
    final total = shots.length;
    final recent = shots.reversed.take(_maxVisible).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SectionHeader(total == 0 ? 'Recent shots' : 'Recent shots  ·  $total'),
            TextButton.icon(
              onPressed: shots.isEmpty ? null : onUndo,
              icon: const Icon(Icons.undo, size: AppSpacing.md),
              label: const Text('Undo last'),
            ),
          ],
        ),
        if (recent.isEmpty)
          Text(
            'No shots yet - pick a club, set the distance, and tap Add.',
            style: AppTypography.textTheme.bodySmall,
          )
        else
          for (var i = 0; i < recent.length; i++)
            _ShotRow(
              number: total - i,
              shot: recent[i],
              latest: i == 0,
            ),
      ],
    );
  }
}

class _ShotRow extends StatelessWidget {
  const _ShotRow({
    required this.number,
    required this.shot,
    required this.latest,
  });

  final int number;
  final RangeShot shot;
  final bool latest;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.xxs),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: latest ? AppColors.fairwayGreenTint : AppColors.surface,
        border: Border.all(
          color: latest ? AppColors.fairwayGreen : AppColors.border,
          width: AppStrokes.thin,
        ),
        borderRadius: BorderRadius.circular(AppRadii.sm),
      ),
      child: Row(
        children: [
          SizedBox(
            width: AppSpacing.xl,
            child: Text(
              '#$number',
              style: AppTypography.textTheme.labelMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          Expanded(
            child: Text(
              shot.club.label,
              style: AppTypography.textTheme.bodyMedium?.copyWith(
                fontWeight: latest ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ),
          Text(
            '${shot.distanceYds.toStringAsFixed(0)} yds',
            style: AppTypography.textTheme.titleMedium?.copyWith(
              color: latest ? AppColors.fairwayGreen : AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
