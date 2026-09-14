import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';

/// Practice or full potential for the next ball, with a one-line reminder
/// of what the difference means. Value in, callback out.
class ShotIntentToggle extends StatelessWidget {
  const ShotIntentToggle({
    required this.intent,
    required this.onChanged,
    super.key,
  });

  final ShotIntent intent;
  final ValueChanged<ShotIntent> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: AppSpacing.tapTarget,
          child: SegmentedButton<ShotIntent>(
            segments: const [
              ButtonSegment(
                value: ShotIntent.practice,
                icon: Icon(Icons.fitness_center),
                label: Text('Practice'),
              ),
              ButtonSegment(
                value: ShotIntent.full,
                icon: Icon(Icons.bolt),
                label: Text('Full potential'),
              ),
            ],
            selected: {intent},
            showSelectedIcon: false,
            style: SegmentedButton.styleFrom(
              backgroundColor: AppColors.surface,
              foregroundColor: AppColors.textPrimary,
              selectedBackgroundColor: intent == ShotIntent.practice
                  ? AppColors.sandGoldLight
                  : AppColors.fairwayGreen,
              selectedForegroundColor: intent == ShotIntent.practice
                  ? AppColors.textPrimary
                  : AppColors.white,
              side: const BorderSide(
                color: AppColors.border,
                width: AppStrokes.regular,
              ),
              textStyle: AppTypography.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            onSelectionChanged: (selection) => onChanged(selection.first),
          ),
        ),
        const SizedBox(height: AppSpacing.xxs),
        Text(
          intent == ShotIntent.practice
              ? 'Practice balls are logged but never count toward your '
                    'yardages.'
              : 'Full potential balls feed the averages in My Bag.',
          style: AppTypography.textTheme.bodySmall?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
