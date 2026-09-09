import 'package:flutter/material.dart';
import 'package:protrack_golf/core/design/design.dart';

/// A keyboard-free yardage input for the range: a big readout, a slider,
/// and -/+ nudge buttons. Value in, callback out.
class DistanceSlider extends StatelessWidget {
  const DistanceSlider({
    required this.distanceYds,
    required this.onChanged,
    super.key,
  });

  final int distanceYds;
  final ValueChanged<int> onChanged;

  static const int minYds = 10;
  static const int maxYds = 300;
  static const int step = 5;

  int get _clamped => distanceYds.clamp(minYds, maxYds);

  void _nudge(int delta) => onChanged((_clamped + delta).clamp(minYds, maxYds));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _NudgeButton(
              icon: Icons.remove,
              tooltip: '-$step yards',
              onPressed: _clamped > minYds ? () => _nudge(-step) : null,
            ),
            SizedBox(
              width: AppSpacing.xxl * 3,
              child: Text(
                '$_clamped',
                textAlign: TextAlign.center,
                style: AppTypography.textTheme.headlineMedium?.copyWith(
                  color: AppColors.fairwayGreen,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            _NudgeButton(
              icon: Icons.add,
              tooltip: '+$step yards',
              onPressed: _clamped < maxYds ? () => _nudge(step) : null,
            ),
          ],
        ),
        Text('yards', style: AppTypography.textTheme.labelMedium),
        Slider(
          value: _clamped.toDouble(),
          min: minYds.toDouble(),
          max: maxYds.toDouble(),
          divisions: (maxYds - minYds) ~/ step,
          label: '$_clamped yds',
          onChanged: (value) => onChanged(value.round()),
        ),
      ],
    );
  }
}

class _NudgeButton extends StatelessWidget {
  const _NudgeButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: AppSpacing.tapTarget + AppSpacing.sm,
      child: IconButton.outlined(
        tooltip: tooltip,
        icon: Icon(icon),
        iconSize: AppSpacing.lg,
        onPressed: onPressed,
      ),
    );
  }
}
