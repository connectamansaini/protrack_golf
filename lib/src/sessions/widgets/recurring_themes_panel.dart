import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/sessions/entities/note_theme.dart';

/// Words that keep appearing in recent session notes, as chips: filled when
/// this session mentioned them too, outlined otherwise. Entities in.
class RecurringThemesPanel extends StatelessWidget {
  const RecurringThemesPanel({
    required this.themes,
    required this.windowSessions,
    super.key,
  });

  final List<NoteTheme> themes;
  final int windowSessions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Words that came up in more than one of your last '
          '$windowSessions sessions.',
          style: AppTypography.textTheme.bodySmall,
        ),
        const SizedBox(height: AppSpacing.xs),
        Wrap(
          spacing: AppSpacing.xs,
          runSpacing: AppSpacing.xs,
          children: [
            for (final theme in themes)
              _ThemeChip(theme: theme, windowSessions: windowSessions),
          ],
        ),
      ],
    );
  }
}

class _ThemeChip extends StatelessWidget {
  const _ThemeChip({required this.theme, required this.windowSessions});

  final NoteTheme theme;
  final int windowSessions;

  @override
  Widget build(BuildContext context) {
    final highlighted = theme.inThisSession;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: highlighted ? AppColors.fairwayGreen : AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadii.pill),
        border: Border.all(
          color: highlighted ? AppColors.fairwayGreen : AppColors.border,
          width: AppStrokes.thin,
        ),
      ),
      child: Text(
        '${theme.keyword}  ·  ${theme.sessionCount} of $windowSessions',
        style: AppTypography.textTheme.labelMedium?.copyWith(
          color: highlighted ? AppColors.white : AppColors.textPrimary,
        ),
      ),
    );
  }
}
