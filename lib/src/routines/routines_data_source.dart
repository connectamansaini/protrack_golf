import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:protrack_golf/src/routines/helpers/routines_failure.dart';
import 'package:protrack_golf/src/routines/models/practice_routine_model.dart';

/// Reads/writes [PracticeRoutineModel]s from the local Hive box.
///
/// Never lets a [HiveError] or other exception escape - everything is
/// wrapped in a [RoutinesFailure].
class RoutinesDataSource {
  RoutinesDataSource(this._box);

  final Box<Map<dynamic, dynamic>> _box;

  /// Hive returns nested `Map`/`List` structures typed as `dynamic`, which
  /// don't satisfy `Map<String, dynamic>` casts required by the generated
  /// `fromJson`. Round-tripping through JSON normalizes every nested value.
  Map<String, dynamic> _normalize(Map<dynamic, dynamic> raw) =>
      jsonDecode(jsonEncode(raw)) as Map<String, dynamic>;

  Future<List<PracticeRoutineModel>> getRoutines() async {
    try {
      return _box.values
          .map((raw) => PracticeRoutineModel.fromJson(_normalize(raw)))
          .toList();
    } catch (e) {
      throw RoutinesFailure('Could not load routines: $e');
    }
  }

  Future<PracticeRoutineModel> getRoutineById(String id) async {
    try {
      final raw = _box.get(id);
      if (raw == null) {
        throw RoutinesFailure('Routine $id was not found');
      }
      return PracticeRoutineModel.fromJson(_normalize(raw));
    } on RoutinesFailure {
      rethrow;
    } catch (e) {
      throw RoutinesFailure('Could not load routine: $e');
    }
  }

  Future<void> saveRoutine(PracticeRoutineModel model) async {
    try {
      await _box.put(model.id, model.toJson());
    } catch (e) {
      throw RoutinesFailure('Could not save routine: $e');
    }
  }

  Future<void> deleteRoutine(String id) async {
    try {
      await _box.delete(id);
    } catch (e) {
      throw RoutinesFailure('Could not delete routine: $e');
    }
  }
}
