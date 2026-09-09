import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:protrack_golf/src/my_bag/helpers/my_bag_failure.dart';
import 'package:protrack_golf/src/my_bag/models/bag_club_model.dart';

/// Reads/writes [BagClubModel]s from the local Hive box, keyed by the club's
/// enum name so each club is stored at most once.
///
/// Never lets a [HiveError] or other exception escape - everything is
/// wrapped in a [MyBagFailure].
class MyBagDataSource {
  MyBagDataSource(this._box);

  final Box<Map<dynamic, dynamic>> _box;

  /// Hive returns nested `Map`/`List` structures typed as `dynamic`, which
  /// don't satisfy `Map<String, dynamic>` casts required by the generated
  /// `fromJson`. Round-tripping through JSON normalizes every nested value.
  Map<String, dynamic> _normalize(Map<dynamic, dynamic> raw) =>
      jsonDecode(jsonEncode(raw)) as Map<String, dynamic>;

  Future<List<BagClubModel>> getBagClubs() async {
    try {
      return _box.values
          .map((raw) => BagClubModel.fromJson(_normalize(raw)))
          .toList();
    } catch (e) {
      throw MyBagFailure('Could not load your bag: $e');
    }
  }

  Future<void> saveBagClub(BagClubModel model) async {
    try {
      await _box.put(model.club, model.toJson());
    } catch (e) {
      throw MyBagFailure('Could not save club: $e');
    }
  }

  Future<void> removeBagClub(String clubName) async {
    try {
      await _box.delete(clubName);
    } catch (e) {
      throw MyBagFailure('Could not remove club: $e');
    }
  }
}
