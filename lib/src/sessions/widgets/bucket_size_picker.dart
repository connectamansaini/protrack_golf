import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';

/// Quick chips for common bucket sizes plus a "Custom" chip that reveals a
/// ball-count slider. Value in, callback out.
class BucketSizePicker extends StatefulWidget {
  const BucketSizePicker({
    required this.bucketSize,
    required this.onChanged,
    super.key,
  });

  final int bucketSize;
  final ValueChanged<int> onChanged;

  static const List<int> presets = [25, 50, 100];
  static const int minCustom = 5;
  static const int maxCustom = 200;
  static const int customStep = 5;

  @override
  State<BucketSizePicker> createState() => _BucketSizePickerState();
}

class _BucketSizePickerState extends State<BucketSizePicker> {
  // Tracked locally because a preset value (e.g. 50) is ambiguous: it can be
  // reached either by tapping its chip or by dragging the custom slider.
  late bool _customSelected = !BucketSizePicker.presets.contains(
    widget.bucketSize,
  );

  int get _sliderValue {
    final clamped = widget.bucketSize.clamp(
      BucketSizePicker.minCustom,
      BucketSizePicker.maxCustom,
    );
    const step = BucketSizePicker.customStep;
    return (clamped / step).round() * step;
  }

  void _selectPreset(int preset) {
    setState(() => _customSelected = false);
    widget.onChanged(preset);
  }

  void _selectCustom() {
    setState(() => _customSelected = true);
    if (_sliderValue != widget.bucketSize) {
      widget.onChanged(_sliderValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: AppSpacing.xs,
          runSpacing: AppSpacing.xs,
          children: [
            for (final preset in BucketSizePicker.presets)
              AppChoiceChip(
                label: '$preset balls',
                selected: !_customSelected && widget.bucketSize == preset,
                onSelected: () => _selectPreset(preset),
              ),
            AppChoiceChip(
              label: 'Custom',
              selected: _customSelected,
              onSelected: _selectCustom,
            ),
          ],
        ),
        if (_customSelected) ...[
          const SizedBox(height: AppSpacing.sm),
          Text(
            '$_sliderValue balls',
            style: AppTypography.textTheme.titleLarge?.copyWith(
              color: AppColors.fairwayGreen,
            ),
          ),
          Slider(
            value: _sliderValue.toDouble(),
            min: BucketSizePicker.minCustom.toDouble(),
            max: BucketSizePicker.maxCustom.toDouble(),
            divisions:
                (BucketSizePicker.maxCustom - BucketSizePicker.minCustom) ~/
                BucketSizePicker.customStep,
            label: '$_sliderValue',
            onChanged: (value) => widget.onChanged(value.round()),
          ),
        ],
      ],
    );
  }
}
