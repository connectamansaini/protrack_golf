import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/sessions/widgets/club_selector_tile.dart';

/// Bottom sheet for putting a club in the bag with the distance the golfer
/// hits it, or editing that distance for a club already there ([lockClub]).
/// Reports the result via [onSave] - it owns no persistence logic itself.
class AddClubSheet extends StatefulWidget {
  const AddClubSheet({
    required this.onSave,
    super.key,
    this.initialClub,
    this.initialDistanceYds = 0,
    this.lockClub = false,
    this.hiddenClubs = const <GolfClub>{},
  });

  final void Function(GolfClub club, double distanceYds) onSave;

  /// Pre-selected club; defaults to the first club not in [hiddenClubs].
  final GolfClub? initialClub;
  final double initialDistanceYds;

  /// When true the club can't be changed - only its distance.
  final bool lockClub;

  /// Clubs not offered by the picker (typically those already in the bag).
  final Set<GolfClub> hiddenClubs;

  static Future<void> show(
    BuildContext context, {
    required void Function(GolfClub club, double distanceYds) onSave,
    GolfClub? initialClub,
    double initialDistanceYds = 0,
    bool lockClub = false,
    Set<GolfClub> hiddenClubs = const <GolfClub>{},
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => AddClubSheet(
        onSave: onSave,
        initialClub: initialClub,
        initialDistanceYds: initialDistanceYds,
        lockClub: lockClub,
        hiddenClubs: hiddenClubs,
      ),
    );
  }

  @override
  State<AddClubSheet> createState() => _AddClubSheetState();
}

class _AddClubSheetState extends State<AddClubSheet> {
  late GolfClub? _club =
      widget.initialClub ??
      GolfClub.values
          .where((club) => !widget.hiddenClubs.contains(club))
          .firstOrNull;

  /// Off means "not sure yet" and saves no distance (0).
  late bool _hasDistance = widget.initialDistanceYds > 0 || !widget.lockClub;

  late int _distanceYds = widget.initialDistanceYds > 0
      ? widget.initialDistanceYds.round()
      : _typicalDistanceFor(_club);

  /// A sensible starting point on the slider so the golfer nudges rather
  /// than drags from scratch.
  static int _typicalDistanceFor(GolfClub? club) => switch (club?.category) {
    ClubCategory.driver => 200,
    ClubCategory.woods => 170,
    ClubCategory.longIrons => 160,
    ClubCategory.midIrons => 140,
    ClubCategory.shortIrons => 120,
    ClubCategory.wedges => 90,
    ClubCategory.putter || null => DistanceSlider.minYds,
  };

  void _selectClub(GolfClub club) {
    setState(() {
      _club = club;
      if (widget.initialDistanceYds <= 0) {
        _distanceYds = _typicalDistanceFor(club);
      }
    });
  }

  void _save() {
    final club = _club;
    if (club == null) return;
    widget.onSave(club, _hasDistance ? _distanceYds.toDouble() : 0);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final club = _club;
    final title = widget.lockClub ? 'Edit distance' : 'Add club';
    final subtitle = widget.lockClub
        ? 'Update how far you hit it.'
        : 'Pick a club and, if you know it, how far you hit it.';
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.sm,
        AppSpacing.md,
        AppSpacing.lg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: AppSpacing.xxl,
              height: AppSpacing.xxs,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(AppRadii.pill),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Container(
                width: AppSpacing.xxl,
                height: AppSpacing.xxl,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.fairwayGreenTint,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  widget.lockClub ? Icons.edit_outlined : Icons.backpack_outlined,
                  color: AppColors.fairwayGreen,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTypography.textTheme.headlineSmall),
                    Text(subtitle, style: AppTypography.textTheme.bodySmall),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          if (club == null)
            Text(
              'Every club is already in your bag.',
              style: AppTypography.textTheme.bodyMedium,
            )
          else ...[
            ClubSelectorTile(
              club: club,
              hidden: widget.hiddenClubs,
              includePutter: true,
              onChanged: widget.lockClub ? null : _selectClub,
            ),
            const SizedBox(height: AppSpacing.md),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                'I know roughly how far I hit it',
                style: AppTypography.textTheme.bodyLarge,
              ),
              subtitle: Text(
                _hasDistance
                    ? 'Slide to your usual carry.'
                    : 'Not sure yet - range sessions will fill it in.',
                style: AppTypography.textTheme.bodySmall,
              ),
              value: _hasDistance,
              onChanged: (value) => setState(() => _hasDistance = value),
            ),
            if (_hasDistance) ...[
              const SizedBox(height: AppSpacing.xs),
              DistanceSlider(
                distanceYds: _distanceYds,
                onChanged: (value) => setState(() => _distanceYds = value),
              ),
            ],
            const SizedBox(height: AppSpacing.lg),
            SizedBox(
              height: AppSpacing.tapTarget + AppSpacing.xs,
              child: PrimaryButton(
                label: widget.lockClub
                    ? 'Save distance'
                    : 'Add ${club.label} to bag',
                icon: widget.lockClub ? Icons.check : Icons.add,
                onPressed: _save,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        ],
      ),
    );
  }
}
