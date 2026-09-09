import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/locations/entities/location.dart';

/// Lets the user pick an existing [Location] or trigger creating a new one.
/// Entities in, callbacks out.
class LocationPicker extends StatelessWidget {
  const LocationPicker({
    required this.locations,
    required this.selectedId,
    required this.onChanged,
    required this.onAddNew,
    super.key,
  });

  final List<Location> locations;
  final String selectedId;
  final ValueChanged<String> onChanged;
  final VoidCallback onAddNew;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField<String>(
            initialValue: selectedId.isEmpty ? null : selectedId,
            decoration: const InputDecoration(labelText: 'Location'),
            hint: const Text('Select a location'),
            items: [
              for (final location in locations)
                DropdownMenuItem(
                  value: location.id,
                  child: Text(location.name),
                ),
            ],
            onChanged: (value) {
              if (value != null) onChanged(value);
            },
          ),
        ),
        const SizedBox(width: AppSpacing.xs),
        IconButton(
          tooltip: 'New location',
          onPressed: onAddNew,
          icon: const Icon(Icons.add_location_alt_outlined),
          color: AppColors.fairwayGreen,
        ),
      ],
    );
  }
}
