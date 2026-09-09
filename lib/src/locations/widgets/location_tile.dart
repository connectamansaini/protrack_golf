import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/locations/entities/location.dart';

/// Renders a single [Location] with how much practice has happened there.
/// Entity and pre-computed stats in, callbacks out - no logic here.
class LocationTile extends StatelessWidget {
  const LocationTile({
    required this.location,
    super.key,
    this.sessionCount = 0,
    this.shotCount = 0,
    this.lastVisit,
    this.onTap,
    this.onDelete,
  });

  final Location location;
  final int sessionCount;
  final int shotCount;
  final DateTime? lastVisit;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final last = lastVisit;
    final stats = sessionCount == 0
        ? 'No sessions here yet'
        : [
            '$sessionCount session${sessionCount == 1 ? '' : 's'}',
            '$shotCount ball${shotCount == 1 ? '' : 's'}',
            if (last != null) 'last ${DateFormatter.shortDate(last)}',
          ].join('  ·  ');

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadii.md),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.sm),
          child: Row(
            children: [
              _Monogram(name: location.name, active: sessionCount > 0),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.textTheme.titleMedium,
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(stats, style: AppTypography.textTheme.bodySmall),
                    if (location.notes.isNotEmpty) ...[
                      const SizedBox(height: AppSpacing.xxs),
                      Text(
                        location.notes,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.textTheme.bodySmall?.copyWith(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (onDelete != null)
                IconButton(
                  tooltip: 'Delete location',
                  icon: const Icon(
                    Icons.delete_outline,
                    color: AppColors.textSecondary,
                  ),
                  onPressed: onDelete,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A round badge with the location's initial - green once it has sessions.
class _Monogram extends StatelessWidget {
  const _Monogram({required this.name, required this.active});

  final String name;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final initial = name.trim().isEmpty ? '?' : name.trim()[0].toUpperCase();
    return Container(
      width: AppSpacing.xxl,
      height: AppSpacing.xxl,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: active ? AppColors.fairwayGreen : AppColors.fairwayGreenTint,
        shape: BoxShape.circle,
      ),
      child: Text(
        initial,
        style: AppTypography.textTheme.titleLarge?.copyWith(
          color: active ? AppColors.white : AppColors.fairwayGreen,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
