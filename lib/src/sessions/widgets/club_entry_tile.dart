import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/sessions/entities/club_entry.dart';

/// Renders one logged [ClubEntry]: the club with its average on the right,
/// every shot as a chip, and any notes. Entity in, callback out.
class ClubEntryTile extends StatelessWidget {
  const ClubEntryTile({required this.entry, super.key, this.onRemove});

  final ClubEntry entry;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    final shots = entry.distances.length;
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.club.label,
                        style: AppTypography.textTheme.titleLarge,
                      ),
                      const SizedBox(height: AppSpacing.xxs),
                      Text(
                        shots == 0
                            ? 'No distances recorded'
                            : '$shots shot${shots == 1 ? '' : 's'}  ·  '
                                  'best ${entry.bestDistance.toStringAsFixed(0)} yds',
                        style: AppTypography.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                if (shots > 0) ...[
                  const SizedBox(width: AppSpacing.sm),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        entry.averageDistance.toStringAsFixed(0),
                        style: AppTypography.textTheme.headlineMedium?.copyWith(
                          color: AppColors.fairwayGreen,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'avg yds',
                        style: AppTypography.textTheme.labelSmall,
                      ),
                    ],
                  ),
                ],
                if (onRemove != null)
                  IconButton(
                    tooltip: 'Remove ${entry.club.label} entry',
                    icon: const Icon(Icons.close),
                    onPressed: onRemove,
                  ),
              ],
            ),
            if (shots > 0) ...[
              const SizedBox(height: AppSpacing.xs),
              Wrap(
                spacing: AppSpacing.xxs,
                runSpacing: AppSpacing.xxs,
                children: [
                  for (final distance in entry.distances)
                    _ShotPill(label: distance.toStringAsFixed(0)),
                ],
              ),
            ],
            if (entry.notes.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.xs),
              Text(
                entry.notes,
                style: AppTypography.textTheme.bodyMedium?.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ShotPill extends StatelessWidget {
  const _ShotPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xs,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: AppColors.fairwayGreenTint,
        borderRadius: BorderRadius.circular(AppRadii.pill),
      ),
      child: Text(
        label,
        style: AppTypography.textTheme.labelMedium?.copyWith(
          color: AppColors.fairwayGreen,
        ),
      ),
    );
  }
}
