import 'package:flutter/material.dart';
import 'package:protrack_golf/core/design/design.dart';
import 'package:protrack_golf/core/enums/shot_intent.dart';

/// A small pill saying whether balls are practice (gold) or full potential
/// (green). Value in, nothing out.
class ShotIntentBadge extends StatelessWidget {
  const ShotIntentBadge(this.intent, {super.key, this.compact = false});

  final ShotIntent intent;

  /// Uses the short label ("Full" instead of "Full potential").
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final practice = intent == ShotIntent.practice;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xs,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: practice ? AppColors.sandGoldLight : AppColors.fairwayGreenTint,
        borderRadius: BorderRadius.circular(AppRadii.pill),
      ),
      child: Text(
        compact ? intent.shortLabel : intent.label,
        style: AppTypography.textTheme.labelMedium?.copyWith(
          color: practice ? AppColors.textPrimary : AppColors.fairwayGreen,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
