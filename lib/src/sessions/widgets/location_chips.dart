import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/locations/entities/location.dart';

/// Locations as big chips (easier than a dropdown with gloves on), plus a
/// way to add a new one. Entities in, callbacks out.
class LocationChips extends StatelessWidget {
  const LocationChips({
    required this.locations,
    required this.selectedId,
    required this.onSelected,
    required this.onAddNew,
    super.key,
  });

  final List<Location> locations;
  final String selectedId;
  final ValueChanged<String> onSelected;
  final VoidCallback onAddNew;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.xs,
      runSpacing: AppSpacing.xs,
      children: [
        for (final location in locations)
          AppChoiceChip(
            label: location.name,
            selected: location.id == selectedId,
            onSelected: () => onSelected(location.id),
          ),
        ActionChip(
          avatar: const Icon(
            Icons.add_location_alt_outlined,
            size: AppSpacing.md,
          ),
          label: Text(locations.isEmpty ? 'Add a location' : 'New'),
          onPressed: onAddNew,
        ),
      ],
    );
  }
}
