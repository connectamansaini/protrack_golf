import 'package:flutter/material.dart';
import 'package:protrack_golf/core/design/design.dart';

/// Centered loading indicator used while a status is `loading`/`initial`.
class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AppColors.fairwayGreen),
    );
  }
}
