import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';

/// The green "this month" summary at the top of the Range tab: sessions,
/// balls hit, and when the golfer last practised. Values in, nothing out.
class RangeOverviewCard extends StatelessWidget {
  const RangeOverviewCard({
    required this.sessionsThisMonth,
    required this.shotsThisMonth,
    required this.lastSessionDate,
    super.key,
  });

  final int sessionsThisMonth;
  final int shotsThisMonth;
  final DateTime? lastSessionDate;

  @override
  Widget build(BuildContext context) {
    final lastSession = lastSessionDate;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.fairwayGreen,
        borderRadius: BorderRadius.circular(AppRadii.lg),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'This month',
              style: AppTypography.textTheme.labelMedium?.copyWith(
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                Expanded(
                  child: _Stat(
                    value: '$sessionsThisMonth',
                    label: sessionsThisMonth == 1 ? 'session' : 'sessions',
                  ),
                ),
                Expanded(
                  child: _Stat(value: '$shotsThisMonth', label: 'balls hit'),
                ),
                Expanded(
                  child: _Stat(
                    value: lastSession == null
                        ? '—'
                        : DateFormatter.shortDate(lastSession),
                    label: 'last session',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTypography.textTheme.headlineMedium?.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          label,
          style: AppTypography.textTheme.bodySmall?.copyWith(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
