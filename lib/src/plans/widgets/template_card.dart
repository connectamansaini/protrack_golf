import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';

/// One selectable session-plan option: a name, a one-line pitch, and a
/// meta line (duration, balls). Disabled cards explain why in [meta].
/// Values in, callback out.
class TemplateCard extends StatelessWidget {
  const TemplateCard({
    required this.title,
    required this.subtitle,
    required this.meta,
    required this.selected,
    required this.onTap,
    super.key,
    this.enabled = true,
    this.icon = Icons.checklist_rtl,
  });

  final String title;
  final String subtitle;
  final String meta;
  final bool selected;
  final bool enabled;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textColor = enabled ? AppColors.textPrimary : AppColors.divider;
    return Material(
      color: selected ? AppColors.fairwayGreenTint : AppColors.surface,
      borderRadius: BorderRadius.circular(AppRadii.md),
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: BorderRadius.circular(AppRadii.md),
        child: Container(
          constraints: const BoxConstraints(minHeight: AppSpacing.tapTarget),
          padding: const EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            border: Border.all(
              color: selected
                  ? AppColors.fairwayGreen
                  : enabled
                  ? AppColors.border
                  : AppColors.divider,
              width: selected ? AppStrokes.regular : AppStrokes.thin,
            ),
            borderRadius: BorderRadius.circular(AppRadii.md),
          ),
          child: Row(
            children: [
              Container(
                width: AppSpacing.xl + AppSpacing.xs,
                height: AppSpacing.xl + AppSpacing.xs,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selected ? AppColors.fairwayGreen : AppColors.surface,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: enabled ? AppColors.fairwayGreen : AppColors.divider,
                    width: AppStrokes.regular,
                  ),
                ),
                child: Icon(
                  selected ? Icons.check : icon,
                  size: AppSpacing.lg,
                  color: selected
                      ? AppColors.white
                      : enabled
                      ? AppColors.fairwayGreen
                      : AppColors.divider,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTypography.textTheme.titleMedium?.copyWith(
                        color: textColor,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: AppTypography.textTheme.bodySmall?.copyWith(
                        color: enabled
                            ? AppColors.textSecondary
                            : AppColors.divider,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      meta,
                      style: AppTypography.textTheme.labelMedium?.copyWith(
                        color: enabled
                            ? AppColors.fairwayGreen
                            : AppColors.decline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
