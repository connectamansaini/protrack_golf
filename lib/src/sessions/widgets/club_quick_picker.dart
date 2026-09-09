import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';

/// Selectable club chips grouped by [ClubCategory]. Big tap targets for use
/// at the range. Selection in, callback out.
///
/// The putter is excluded by default (no distances to log at the range);
/// [includePutter] adds it for pickers that manage the whole bag, and
/// [hidden] drops clubs that shouldn't be offered (e.g. already in the bag).
class ClubQuickPicker extends StatelessWidget {
  const ClubQuickPicker({
    required this.selected,
    required this.onSelected,
    super.key,
    this.includePutter = false,
    this.hidden = const <GolfClub>{},
    this.counts = const <GolfClub, int>{},
  });

  final GolfClub selected;
  final ValueChanged<GolfClub> onSelected;
  final bool includePutter;
  final Set<GolfClub> hidden;

  /// Optional per-club counts shown on the chip (e.g. shots this session).
  final Map<GolfClub, int> counts;

  String _labelFor(GolfClub club) {
    final count = counts[club] ?? 0;
    return count == 0 ? club.label : '${club.label}  ·  $count';
  }

  List<GolfClub> _clubsIn(ClubCategory category) => [
    for (final club in GolfClub.values)
      if (club.category == category && !hidden.contains(club)) club,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final category in ClubCategory.values)
          if (includePutter || category != ClubCategory.putter)
            if (_clubsIn(category) case final clubs when clubs.isNotEmpty) ...[
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
                  for (final club in clubs)
                    AppChoiceChip(
                      label: _labelFor(club),
                      selected: club == selected,
                      onSelected: () => onSelected(club),
                    ),
                ],
              ),
            ],
      ],
    );
  }
}
