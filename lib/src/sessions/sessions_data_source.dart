import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:protrack_golf/src/sessions/helpers/sessions_failure.dart';
import 'package:protrack_golf/src/sessions/models/practice_session_model.dart';

/// Reads/writes [PracticeSessionModel]s from the local Hive box.
///
/// Never lets a [HiveError] or other exception escape - everything is
/// wrapped in a [SessionsFailure].
class SessionsDataSource {
  SessionsDataSource(this._box);

  final Box<Map<dynamic, dynamic>> _box;

  /// Hive returns nested `Map`/`List` structures typed as `dynamic`, which
  /// don't satisfy `Map<String, dynamic>` casts required by the generated
  /// `fromJson`. Round-tripping through JSON normalizes every nested value.
  Map<String, dynamic> _normalize(Map<dynamic, dynamic> raw) =>
      jsonDecode(jsonEncode(raw)) as Map<String, dynamic>;

  Future<List<PracticeSessionModel>> getSessions() async {
    try {
      return _box.values
          .map((raw) => PracticeSessionModel.fromJson(_normalize(raw)))
          .toList();
    } catch (e) {
      throw SessionsFailure('Could not load sessions: $e');
    }
  }

  Future<PracticeSessionModel> getSessionById(String id) async {
    try {
      final raw = _box.get(id);
      if (raw == null) {
        throw SessionsFailure('Session $id was not found');
      }
      return PracticeSessionModel.fromJson(_normalize(raw));
    } on SessionsFailure {
      rethrow;
    } catch (e) {
      throw SessionsFailure('Could not load session: $e');
    }
  }

  Future<void> saveSession(PracticeSessionModel model) async {
    try {
      await _box.put(model.id, model.toJson());
    } catch (e) {
      throw SessionsFailure('Could not save session: $e');
    }
  }

  Future<void> deleteSession(String id) async {
    try {
      await _box.delete(id);
    } catch (e) {
      throw SessionsFailure('Could not delete session: $e');
    }
  }
}
