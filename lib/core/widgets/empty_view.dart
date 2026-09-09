import 'package:flutter/material.dart';
import 'package:protrack_golf/core/design/design.dart';

/// Centered empty state, used when a status is `empty` (a real, non-error
/// state - not something to be conflated with `failure`).
class EmptyView extends StatelessWidget {
  const EmptyView({
    required this.message,
    super.key,
    this.icon = Icons.golf_course_outlined,
  });

  final String message;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.textSecondary, size: 40),
            const SizedBox(height: AppSpacing.sm),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTypography.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
