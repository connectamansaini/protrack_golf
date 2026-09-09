import 'package:flutter/material.dart';
import 'package:protrack_golf/core/design/design.dart';

/// The app's single primary call-to-action button: solid fairway green with
/// bold white text, never shorter than `AppSpacing.tapTarget`.
///
/// Entities/data in, callbacks out - this widget holds no business logic.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.icon,
    this.expand = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final child = icon == null
        ? Text(label)
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18),
              const SizedBox(width: AppSpacing.xs),
              Text(label),
            ],
          );

    final button = FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.fairwayGreen,
        foregroundColor: AppColors.white,
        disabledBackgroundColor: AppColors.divider,
        disabledForegroundColor: AppColors.white,
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
      child: child,
    );

    if (!expand) return button;
    return SizedBox(width: double.infinity, child: button);
  }
}
