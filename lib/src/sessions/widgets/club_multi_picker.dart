import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';

/// Multi-select club chips grouped by `ClubCategory`, for choosing which
/// clubs a range session will use. Selection in, toggle callback out.
///
/// The putter is excluded (no distances to record at the range).
class ClubMultiPicker extends StatelessWidget {
  const ClubMultiPicker({
    required this.selected,
    required this.onToggled,
    super.key,
  });

  final Set<GolfClub> selected;
  final ValueChanged<GolfClub> onToggled;

  List<GolfClub> _clubsIn(ClubCategory category) => [
    for (final club in GolfClub.values)
      if (club.category == category) club,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final category in ClubCategory.values)
          if (category != ClubCategory.putter) ...[
            Padding(
              padding: const EdgeInsets.only(
                top: AppSpacing.xs,
                bottom: AppSpacing.xxs,
              ),
              child: Text(
                category.label,
                style: AppTypography.textTheme.bodySmall,
              ),
            ),
            Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: [
                for (final club in _clubsIn(category))
                  AppChoiceChip(
                    label: club.label,
                    selected: selected.contains(club),
                    onSelected: () => onToggled(club),
                  ),
              ],
            ),
          ],
      ],
    );
  }
}
