import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:protrack_golf/src/locations/helpers/locations_failure.dart';
import 'package:protrack_golf/src/locations/models/location_model.dart';

/// Reads/writes [LocationModel]s from the local Hive box.
///
/// Never lets a [HiveError] or other exception escape - everything is
/// wrapped in a [LocationsFailure].
class LocationsDataSource {
  LocationsDataSource(this._box);

  final Box<Map<dynamic, dynamic>> _box;

  /// Hive returns nested `Map`/`List` structures typed as `dynamic`, which
  /// don't satisfy `Map<String, dynamic>` casts required by the generated
  /// `fromJson`. Round-tripping through JSON normalizes every nested value.
  Map<String, dynamic> _normalize(Map<dynamic, dynamic> raw) =>
      jsonDecode(jsonEncode(raw)) as Map<String, dynamic>;

  Future<List<LocationModel>> getLocations() async {
    try {
      return _box.values
          .map((raw) => LocationModel.fromJson(_normalize(raw)))
          .toList();
    } catch (e) {
      throw LocationsFailure('Could not load locations: $e');
    }
  }

  Future<void> saveLocation(LocationModel model) async {
    try {
      await _box.put(model.id, model.toJson());
    } catch (e) {
      throw LocationsFailure('Could not save location: $e');
    }
  }

  Future<void> deleteLocation(String id) async {
    try {
      await _box.delete(id);
    } catch (e) {
      throw LocationsFailure('Could not delete location: $e');
    }
  }
}
