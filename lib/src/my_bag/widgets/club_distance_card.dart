import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/my_bag/entities/club_distance_record.dart';

/// Overflow-menu actions a card can offer, depending on which callbacks the
/// parent wired up.
enum _CardAction { editDistance, removeFromBag, addToBag }

/// One line of the yardage chart: club, the golfer's own distance when set,
/// range stats when there are any, and how much data backs them. Entity in,
/// callbacks out.
class ClubDistanceCard extends StatelessWidget {
  const ClubDistanceCard({
    required this.record,
    super.key,
    this.onTap,
    this.onLongPress,
    this.onEditDistance,
    this.onRemoveFromBag,
    this.onAddToBag,
  });

  final ClubDistanceRecord record;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onEditDistance;
  final VoidCallback? onRemoveFromBag;
  final VoidCallback? onAddToBag;

  bool get _hasMenu =>
      onEditDistance != null || onRemoveFromBag != null || onAddToBag != null;

  void _onMenuSelected(_CardAction action) {
    switch (action) {
      case _CardAction.editDistance:
        onEditDistance?.call();
      case _CardAction.removeFromBag:
        onRemoveFromBag?.call();
      case _CardAction.addToBag:
        onAddToBag?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bigNumber = record.hasManualDistance
        ? record.manualDistanceYds
        : record.averageYds;
    final bigCaption = record.hasManualDistance ? 'your yds' : 'avg yds';
    final showBigNumber = record.hasManualDistance || record.hasSessionData;

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        borderRadius: BorderRadius.circular(AppRadii.md),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.md,
            AppSpacing.md,
            AppSpacing.xs,
            AppSpacing.md,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            record.club.label,
                            style: AppTypography.textTheme.titleLarge,
                          ),
                        ),
                        if (record.inBag) ...[
                          const SizedBox(width: AppSpacing.xs),
                          const _InBagBadge(),
                        ],
                      ],
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    if (record.hasManualDistance)
                      Text(
                        'Your distance '
                        '${record.manualDistanceYds.toStringAsFixed(0)} yds',
                        style: AppTypography.textTheme.bodyLarge?.copyWith(
                          color: AppColors.fairwayGreen,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    if (record.hasSessionData) ...[
                      Text(
                        'avg ${record.averageYds.toStringAsFixed(0)}  ·  '
                        'best ${record.bestYds.toStringAsFixed(0)}  ·  '
                        'latest ${record.latestYds.toStringAsFixed(0)} yds',
                        style: AppTypography.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: AppSpacing.xxs),
                      Text(
                        '${record.shotCount} shot'
                        '${record.shotCount == 1 ? '' : 's'}  ·  '
                        '${record.sessionCount} session'
                        '${record.sessionCount == 1 ? '' : 's'}',
                        style: AppTypography.textTheme.bodySmall,
                      ),
                    ] else if (!record.hasManualDistance)
                      Text(
                        'No distance yet',
                        style: AppTypography.textTheme.bodySmall,
                      ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              if (showBigNumber)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      bigNumber.toStringAsFixed(0),
                      style: AppTypography.textTheme.headlineMedium?.copyWith(
                        color: AppColors.fairwayGreen,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(bigCaption, style: AppTypography.textTheme.labelSmall),
                  ],
                ),
              if (_hasMenu)
                PopupMenuButton<_CardAction>(
                  tooltip: 'Club options',
                  icon: const Icon(
                    Icons.more_vert,
                    color: AppColors.textPrimary,
                  ),
                  onSelected: _onMenuSelected,
                  itemBuilder: (context) => [
                    if (onEditDistance != null)
                      const PopupMenuItem(
                        value: _CardAction.editDistance,
                        child: Text('Edit distance'),
                      ),
                    if (onRemoveFromBag != null)
                      const PopupMenuItem(
                        value: _CardAction.removeFromBag,
                        child: Text('Remove from bag'),
                      ),
                    if (onAddToBag != null)
                      const PopupMenuItem(
                        value: _CardAction.addToBag,
                        child: Text('Add to bag'),
                      ),
                  ],
                )
              else if (onTap != null)
                const Padding(
                  padding: EdgeInsets.all(AppSpacing.xs),
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

class _InBagBadge extends StatelessWidget {
  const _InBagBadge();

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
        border: Border.all(
          color: AppColors.fairwayGreen,
          width: AppStrokes.thin,
        ),
      ),
      child: Text(
        'In bag',
        style: AppTypography.textTheme.labelSmall?.copyWith(
          color: AppColors.fairwayGreen,
        ),
      ),
    );
  }
}
