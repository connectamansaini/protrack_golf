import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/sessions/entities/club_recap.dart';
import 'package:protrack_golf/src/sessions/entities/session_recap.dart';

/// One club's recap: shots, average, best, and the change vs the previous
/// session that used it, as a coloured pill. Entity in, nothing out.
class ClubRecapCard extends StatelessWidget {
  const ClubRecapCard({required this.recap, super.key});

  final ClubRecap recap;

  static const double _pillTintAlpha = 0.12;

  @override
  Widget build(BuildContext context) {
    final delta = recap.deltaVsPreviousYds;
    final IconData deltaIcon;
    final Color deltaColor;
    final String deltaLabel;
    if (!recap.hasPrevious) {
      deltaIcon = Icons.fiber_new_outlined;
      deltaColor = AppColors.textSecondary;
      deltaLabel = 'First time';
    } else if (delta > SessionRecap.neutralBandYds) {
      deltaIcon = Icons.trending_up;
      deltaColor = AppColors.success;
      deltaLabel = '+${delta.toStringAsFixed(0)} yds';
    } else if (delta < -SessionRecap.neutralBandYds) {
      deltaIcon = Icons.trending_down;
      deltaColor = AppColors.decline;
      deltaLabel = '${delta.toStringAsFixed(0)} yds';
    } else {
      deltaIcon = Icons.trending_flat;
      deltaColor = AppColors.textSecondary;
      deltaLabel = 'Same as last time';
    }

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recap.club.label,
                    style: AppTypography.textTheme.titleLarge,
                  ),
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    '${recap.shots} shot${recap.shots == 1 ? '' : 's'}  ·  '
                    'best ${recap.bestYds.toStringAsFixed(0)} yds',
                    style: AppTypography.textTheme.bodySmall,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  _DeltaPill(
                    icon: deltaIcon,
                    color: deltaColor,
                    label: deltaLabel,
                    tintAlpha: _pillTintAlpha,
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  recap.averageYds.toStringAsFixed(0),
                  style: AppTypography.textTheme.headlineMedium?.copyWith(
                    color: AppColors.fairwayGreen,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text('avg yds', style: AppTypography.textTheme.labelSmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DeltaPill extends StatelessWidget {
  const _DeltaPill({
    required this.icon,
    required this.color,
    required this.label,
    required this.tintAlpha,
  });

  final IconData icon;
  final Color color;
  final String label;
  final double tintAlpha;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xs,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: tintAlpha),
        borderRadius: BorderRadius.circular(AppRadii.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: AppSpacing.md, color: color),
          const SizedBox(width: AppSpacing.xxs),
          Text(
            label,
            style: AppTypography.textTheme.labelMedium?.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
