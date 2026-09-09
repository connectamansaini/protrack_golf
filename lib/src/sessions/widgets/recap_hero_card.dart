import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/sessions/entities/session_recap.dart';

/// The green header of the session recap: when and where, the headline
/// numbers, and a one-line takeaway. Entity in, nothing out.
class RecapHeroCard extends StatelessWidget {
  const RecapHeroCard({
    required this.recap,
    required this.locationName,
    super.key,
  });

  final SessionRecap recap;
  final String locationName;

  String get _takeaway {
    final improved = recap.improvedClubCount;
    final fresh = recap.newClubCount;
    if (improved > 0) {
      return '$improved club${improved == 1 ? '' : 's'} went further than '
          'last time.';
    }
    if (fresh == recap.clubRecaps.length && fresh > 0) {
      return 'First numbers logged for '
          '${fresh == 1 ? 'this club' : 'these clubs'} - now there is '
          'something to beat.';
    }
    return 'Logged and saved. Consistency beats distance.';
  }

  @override
  Widget build(BuildContext context) {
    final longest = recap.longestShot;
    final clubs = recap.clubRecaps.length;
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
            Row(
              children: [
                const Icon(Icons.check_circle, color: AppColors.white),
                const SizedBox(width: AppSpacing.xs),
                Text(
                  'Session complete',
                  style: AppTypography.textTheme.titleMedium?.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xxs),
            Text(
              '${DateFormatter.mediumDate(recap.session.date)}  ·  '
              '$locationName',
              style: AppTypography.textTheme.bodyMedium?.copyWith(
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: _Stat(
                    value: '${recap.totalShots}',
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
                    value: longest == null
                        ? '—'
                        : longest.bestYds.toStringAsFixed(0),
                    label: longest == null
                        ? 'best shot'
                        : 'best · ${longest.club.label}',
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              _takeaway,
              style: AppTypography.textTheme.bodyLarge?.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
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
