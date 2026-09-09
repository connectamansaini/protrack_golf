import 'package:flutter/material.dart';
import 'package:protrack_golf/core/design/design.dart';

/// One numbered step of a short setup flow: a header with the step's
/// current answer on the right (and a tick once it's done), and the control
/// underneath. Values in, nothing out.
class StepCard extends StatelessWidget {
  const StepCard({
    required this.number,
    required this.title,
    required this.summary,
    required this.done,
    required this.child,
    super.key,
  });

  final int number;
  final String title;
  final String summary;
  final bool done;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border, width: AppStrokes.thin),
        borderRadius: BorderRadius.circular(AppRadii.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                width: AppSpacing.lg + AppSpacing.xs,
                height: AppSpacing.lg + AppSpacing.xs,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: done ? AppColors.fairwayGreen : AppColors.surface,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.fairwayGreen,
                    width: AppStrokes.regular,
                  ),
                ),
                child: done
                    ? const Icon(
                        Icons.check,
                        size: AppSpacing.md,
                        color: AppColors.white,
                      )
                    : Text(
                        '$number',
                        style: AppTypography.textTheme.labelMedium?.copyWith(
                          color: AppColors.fairwayGreen,
                        ),
                      ),
              ),
              const SizedBox(width: AppSpacing.xs),
              Expanded(
                child: Text(title, style: AppTypography.textTheme.titleMedium),
              ),
              Flexible(
                child: Text(
                  summary,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  style: AppTypography.textTheme.labelMedium?.copyWith(
                    color: AppColors.fairwayGreen,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          child,
        ],
      ),
    );
  }
}
