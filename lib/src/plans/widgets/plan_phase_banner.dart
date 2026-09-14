import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/plans/entities/plan_phase.dart';

/// The current phase of a session plan, shown at the top of the logger:
/// where you are, what these balls are for, which clubs, the drills, and
/// controls to move between phases. Entity in, callbacks out.
class PlanPhaseBanner extends StatelessWidget {
  const PlanPhaseBanner({
    required this.phase,
    required this.phaseNumber,
    required this.phaseCount,
    required this.shotsInPhase,
    required this.selectedClub,
    required this.onClubSelected,
    super.key,
    this.onPrevious,
    this.onNext,
  });

  final PlanPhase phase;
  final int phaseNumber;
  final int phaseCount;
  final int shotsInPhase;
  final GolfClub selectedClub;
  final ValueChanged<GolfClub> onClubSelected;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    final progress = phase.ballCount == 0
        ? 0.0
        : (shotsInPhase / phase.ballCount).clamp(0.0, 1.0);
    final left = phase.ballCount - shotsInPhase;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: phase.isPractice
            ? AppColors.surface
            : AppColors.fairwayGreenTint,
        border: Border.all(
          color: phase.isPractice ? AppColors.sandGold : AppColors.fairwayGreen,
          width: AppStrokes.regular,
        ),
        borderRadius: BorderRadius.circular(AppRadii.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Phase $phaseNumber of $phaseCount',
                  style: AppTypography.textTheme.labelMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              ShotIntentBadge(phase.intent),
            ],
          ),
          const SizedBox(height: AppSpacing.xxs),
          Text(phase.title, style: AppTypography.textTheme.headlineSmall),
          const SizedBox(height: AppSpacing.xxs),
          Text(phase.goal, style: AppTypography.textTheme.bodyMedium),
          const SizedBox(height: AppSpacing.xs),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadii.pill),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: AppSpacing.xs,
              color: phase.isPractice
                  ? AppColors.sandGold
                  : AppColors.fairwayGreen,
              backgroundColor: AppColors.fairwayGreenTint,
            ),
          ),
          const SizedBox(height: AppSpacing.xxs),
          Text(
            left > 0
                ? '$shotsInPhase of ${phase.ballCount} hit  ·  $left to go'
                : '${phase.ballCount} of ${phase.ballCount} hit  ·  phase '
                      'done',
            style: AppTypography.textTheme.bodySmall,
          ),
          const SizedBox(height: AppSpacing.xs),
          Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: [
              for (final club in phase.clubs)
                AppChoiceChip(
                  label: club.label,
                  selected: club == selectedClub,
                  onSelected: () => onClubSelected(club),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          for (final drill in phase.drills)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.xxs),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: AppSpacing.xxs),
                    child: Icon(
                      Icons.circle,
                      size: AppSpacing.xs,
                      color: AppColors.fairwayGreen,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Expanded(
                    child: Text(
                      drill,
                      style: AppTypography.textTheme.bodySmall?.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Row(
            children: [
              TextButton.icon(
                onPressed: onPrevious,
                icon: const Icon(Icons.chevron_left),
                label: const Text('Back'),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: onNext,
                icon: const Icon(Icons.chevron_right),
                label: Text(onNext == null ? 'Last phase' : 'Next phase'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
