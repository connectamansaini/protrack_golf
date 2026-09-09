import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/sessions/widgets/club_quick_picker.dart';

/// The chosen club as a tinted header row; tapping it opens a sheet with the
/// grouped club picker. Value in, callback out. When [onChanged] is null the
/// row is read-only (used when a form is locked to one club).
class ClubSelectorTile extends StatelessWidget {
  const ClubSelectorTile({
    required this.club,
    super.key,
    this.onChanged,
    this.hidden = const <GolfClub>{},
    this.includePutter = false,
  });

  final GolfClub club;
  final ValueChanged<GolfClub>? onChanged;

  /// Clubs the picker shouldn't offer (e.g. already in the bag).
  final Set<GolfClub> hidden;
  final bool includePutter;

  /// Opens the grouped picker and returns the tapped club, or null if the
  /// sheet was dismissed.
  static Future<GolfClub?> pick(
    BuildContext context, {
    required GolfClub selected,
    Set<GolfClub> hidden = const <GolfClub>{},
    bool includePutter = false,
  }) {
    return showModalBottomSheet<GolfClub>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (sheetContext) => SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Which club?', style: AppTypography.textTheme.headlineSmall),
            const SizedBox(height: AppSpacing.sm),
            ClubQuickPicker(
              selected: selected,
              hidden: hidden,
              includePutter: includePutter,
              onSelected: (club) => Navigator.of(sheetContext).pop(club),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _open(BuildContext context) async {
    final picked = await pick(
      context,
      selected: club,
      hidden: hidden,
      includePutter: includePutter,
    );
    if (picked != null) onChanged?.call(picked);
  }

  @override
  Widget build(BuildContext context) {
    final editable = onChanged != null;
    return Material(
      color: AppColors.fairwayGreenTint,
      borderRadius: BorderRadius.circular(AppRadii.md),
      child: InkWell(
        onTap: editable ? () => _open(context) : null,
        borderRadius: BorderRadius.circular(AppRadii.md),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.sm,
          ),
          child: Row(
            children: [
              const Icon(Icons.sports_golf, color: AppColors.fairwayGreen),
              const SizedBox(width: AppSpacing.xs),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      club.label,
                      style: AppTypography.textTheme.titleLarge?.copyWith(
                        color: AppColors.fairwayGreen,
                      ),
                    ),
                    Text(
                      club.category.label,
                      style: AppTypography.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              if (editable) ...[
                Text(
                  'Change',
                  style: AppTypography.textTheme.labelMedium?.copyWith(
                    color: AppColors.fairwayGreen,
                  ),
                ),
                const Icon(Icons.expand_more, color: AppColors.fairwayGreen),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
