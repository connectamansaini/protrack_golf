import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:protrack_golf/src/bucket_sessions/helpers/bucket_sessions_failure.dart';
import 'package:protrack_golf/src/bucket_sessions/models/bucket_session_model.dart';

/// Reads/writes [BucketSessionModel]s from the local Hive box.
///
/// Never lets a [HiveError] or other exception escape - everything is
/// wrapped in a [BucketSessionsFailure].
class BucketSessionsDataSource {
  BucketSessionsDataSource(this._box);

  final Box<Map<dynamic, dynamic>> _box;

  /// Hive returns nested `Map`/`List` structures typed as `dynamic`, which
  /// don't satisfy `Map<String, dynamic>` casts required by the generated
  /// `fromJson`. Round-tripping through JSON normalizes every nested value.
  Map<String, dynamic> _normalize(Map<dynamic, dynamic> raw) =>
      jsonDecode(jsonEncode(raw)) as Map<String, dynamic>;

  Future<List<BucketSessionModel>> getSessions() async {
    try {
      return _box.values
          .map((raw) => BucketSessionModel.fromJson(_normalize(raw)))
          .toList();
    } catch (e) {
      throw BucketSessionsFailure('Could not load bucket sessions: $e');
    }
  }

  Future<BucketSessionModel> getSessionById(String id) async {
    try {
      final raw = _box.get(id);
      if (raw == null) {
        throw BucketSessionsFailure('Bucket session $id was not found');
      }
      return BucketSessionModel.fromJson(_normalize(raw));
    } on BucketSessionsFailure {
      rethrow;
    } catch (e) {
      throw BucketSessionsFailure('Could not load bucket session: $e');
    }
  }

  Future<void> saveSession(BucketSessionModel model) async {
    try {
      await _box.put(model.id, model.toJson());
    } catch (e) {
      throw BucketSessionsFailure('Could not save bucket session: $e');
    }
  }

  Future<void> deleteSession(String id) async {
    try {
      await _box.delete(id);
    } catch (e) {
      throw BucketSessionsFailure('Could not delete bucket session: $e');
    }
  }
}
