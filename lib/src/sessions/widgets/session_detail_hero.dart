import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/sessions/entities/practice_session.dart';

/// The green header of a session's detail screen: when and where, the
/// headline numbers, and a button through to the recap. Entity in,
/// callback out.
class SessionDetailHero extends StatelessWidget {
  const SessionDetailHero({
    required this.session,
    required this.locationName,
    required this.onViewRecap,
    super.key,
  });

  final PracticeSession session;
  final String locationName;
  final VoidCallback onViewRecap;

  @override
  Widget build(BuildContext context) {
    final clubs = session.clubEntries.length;
    final best = session.bestDistance;
    final bestClub = session.clubEntries
        .where((e) => e.distances.isNotEmpty && e.bestDistance == best)
        .map((e) => e.club.label)
        .firstOrNull;
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
              DateFormatter.mediumDate(session.date),
              style: AppTypography.textTheme.headlineMedium?.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: AppSpacing.xxs),
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: AppSpacing.md,
                  color: AppColors.white,
                ),
                const SizedBox(width: AppSpacing.xxs),
                Expanded(
                  child: Text(
                    '$locationName  ·  ${session.bucketSize}-ball bucket',
                    style: AppTypography.textTheme.bodyMedium?.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: _Stat(
                    value: '${session.totalShots}',
                    label: 'balls hit',
                  ),
                ),
                Expanded(
                  child: _Stat(
                    value: '$clubs',
                    label: clubs == 1 ? 'club' : 'clubs',
                  ),
                ),
                Expanded(
                  child: _Stat(
                    value: best > 0 ? best.toStringAsFixed(0) : '—',
                    label: bestClub == null ? 'best shot' : 'best · $bestClub',
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            SizedBox(
              height: AppSpacing.tapTarget,
              child: FilledButton.icon(
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.white,
                  foregroundColor: AppColors.fairwayGreen,
                ),
                onPressed: onViewRecap,
                icon: const Icon(Icons.insights_outlined),
                label: const Text('View recap'),
              ),
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
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTypography.textTheme.bodySmall?.copyWith(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
