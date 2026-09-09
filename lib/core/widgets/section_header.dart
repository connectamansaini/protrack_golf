import 'package:flutter/material.dart';
import 'package:protrack_golf/core/design/design.dart';

/// A consistent section title used across list/detail screens.
class SectionHeader extends StatelessWidget {
  const SectionHeader(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: Text(title, style: AppTypography.textTheme.titleMedium),
    );
  }
}
