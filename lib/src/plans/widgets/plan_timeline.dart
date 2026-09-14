import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/plans/entities/session_plan.dart';

/// The phases of a plan as a numbered list: title, balls, clubs, and a
/// practice/full badge, with the practice-vs-full split underneath.
/// Entity in, nothing out.
class PlanTimeline extends StatelessWidget {
  const PlanTimeline({required this.plan, super.key});

  final SessionPlan plan;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < plan.phases.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.xs),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: AppSpacing.lg,
                  height: AppSpacing.lg,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: plan.phases[i].isPractice
                        ? AppColors.sandGoldLight
                        : AppColors.fairwayGreen,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${i + 1}',
                    style: AppTypography.textTheme.labelMedium?.copyWith(
                      color: plan.phases[i].isPractice
                          ? AppColors.textPrimary
                          : AppColors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.xs),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plan.phases[i].title,
                        style: AppTypography.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '${plan.phases[i].ballCount} balls  ·  '
                        '${plan.phases[i].clubs.map((c) => c.label).join(', ')}',
                        style: AppTypography.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.xs),
                ShotIntentBadge(plan.phases[i].intent, compact: true),
              ],
            ),
          ),
        Text(
          '${plan.practiceBalls} practice balls  ·  ${plan.fullBalls} full '
          'potential balls that count toward your yardages',
          style: AppTypography.textTheme.bodySmall?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
