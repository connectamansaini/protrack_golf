import 'package:flutter/material.dart';
import 'package:protrack_golf/core/design/design.dart';

/// The app's single selectable chip: solid dark green with white bold text
/// when selected, white with a dark outline otherwise, and never shorter
/// than `AppSpacing.tapTarget`. Value in, callback out.
class AppChoiceChip extends StatelessWidget {
  const AppChoiceChip({
    required this.label,
    required this.selected,
    required this.onSelected,
    super.key,
  });

  final String label;
  final bool selected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      // White so the tick stays visible on the solid green selected chip.
      showCheckmark: true,
      checkmarkColor: AppColors.white,
      selectedColor: AppColors.fairwayGreen,
      backgroundColor: AppColors.surface,
      side: BorderSide(
        color: selected ? AppColors.fairwayGreen : AppColors.border,
        width: AppStrokes.regular,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadii.pill),
      ),
      labelStyle: AppTypography.textTheme.bodyLarge?.copyWith(
        color: selected ? AppColors.white : AppColors.textPrimary,
        fontWeight: FontWeight.w700,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      onSelected: (_) => onSelected(),
    );
  }
}
