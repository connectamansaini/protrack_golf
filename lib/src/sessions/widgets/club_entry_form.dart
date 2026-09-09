import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/sessions/entities/club_entry.dart';
import 'package:protrack_golf/src/sessions/widgets/club_selector_tile.dart';

/// A small inline form for building one [ClubEntry] at a time: choose a
/// club, slide to each distance and add it, then save the entry. Reports the
/// finished entry via [onAdd] - it holds no persistence logic itself.
class ClubEntryForm extends StatefulWidget {
  const ClubEntryForm({required this.onAdd, super.key});

  final ValueChanged<ClubEntry> onAdd;

  @override
  State<ClubEntryForm> createState() => _ClubEntryFormState();
}

class _ClubEntryFormState extends State<ClubEntryForm> {
  static const int _defaultDistanceYds = 100;

  GolfClub _club = GolfClub.iron7;
  int _distanceYds = _defaultDistanceYds;
  final List<double> _distances = [];
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  double get _average => _distances.isEmpty
      ? 0
      : _distances.reduce((a, b) => a + b) / _distances.length;

  double get _best => _distances.fold(0, (b, d) => d > b ? d : b);

  void _addShot() => setState(() => _distances.add(_distanceYds.toDouble()));

  void _removeShot(int index) => setState(() => _distances.removeAt(index));

  void _submit() {
    if (_distances.isEmpty) return;
    widget.onAdd(
      ClubEntry(
        club: _club,
        distances: List.of(_distances),
        notes: _notesController.text.trim(),
      ),
    );
    _notesController.clear();
    setState(_distances.clear);
  }

  @override
  Widget build(BuildContext context) {
    final shots = _distances.length;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border, width: AppStrokes.thin),
        borderRadius: BorderRadius.circular(AppRadii.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClubSelectorTile(
            club: _club,
            onChanged: (club) => setState(() => _club = club),
          ),
          const SizedBox(height: AppSpacing.sm),
          DistanceSlider(
            distanceYds: _distanceYds,
            onChanged: (value) => setState(() => _distanceYds = value),
          ),
          const SizedBox(height: AppSpacing.xs),
          PrimaryButton(
            label: 'Add $_distanceYds yd shot',
            icon: Icons.add,
            onPressed: _addShot,
          ),
          if (shots > 0) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(
              '$shots shot${shots == 1 ? '' : 's'}  ·  '
              'avg ${_average.toStringAsFixed(0)}  ·  '
              'best ${_best.toStringAsFixed(0)} yds',
              style: AppTypography.textTheme.labelMedium?.copyWith(
                color: AppColors.fairwayGreen,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: [
                for (var i = 0; i < _distances.length; i++)
                  InputChip(
                    label: Text(
                      '#${i + 1}  ${_distances[i].toStringAsFixed(0)}',
                    ),
                    onDeleted: () => _removeShot(i),
                    deleteButtonTooltipMessage: 'Remove shot',
                  ),
              ],
            ),
          ],
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _notesController,
            decoration: const InputDecoration(
              labelText: 'Notes for this club (optional)',
              hintText: 'e.g. thinning it, ball flight left',
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          SecondaryButton(
            label: shots == 0
                ? 'Add shots to save ${_club.label}'
                : 'Save ${_club.label} entry  ·  $shots shot'
                      '${shots == 1 ? '' : 's'}',
            icon: Icons.playlist_add_check,
            onPressed: shots == 0 ? null : _submit,
          ),
        ],
      ),
    );
  }
}
