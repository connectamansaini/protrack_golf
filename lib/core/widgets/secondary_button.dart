import 'package:flutter/material.dart';
import 'package:protrack_golf/core/design/design.dart';

/// A lower-emphasis outlined button, used for secondary actions: a 2px
/// fairway-green outline with bold green text.
class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.fairwayGreen,
        disabledForegroundColor: AppColors.textSecondary,
        side: BorderSide(
          color: onPressed == null
              ? AppColors.textSecondary
              : AppColors.fairwayGreen,
          width: AppStrokes.regular,
        ),
        minimumSize: const Size(AppSpacing.tapTarget, AppSpacing.tapTarget),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.sm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.md),
        ),
        textStyle: AppTypography.textTheme.labelLarge,
      ),
      child: icon == null
          ? Text(label)
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 18),
                const SizedBox(width: AppSpacing.xs),
                Text(label),
              ],
            ),
    );
  }
}
