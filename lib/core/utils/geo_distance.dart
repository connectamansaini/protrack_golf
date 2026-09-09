import 'dart:math' as math;

/// Great-circle distance helpers for the range GPS pin-calibration feature:
/// converts latitude/longitude pairs into a human-relevant yardage.
abstract final class GeoDistance {
  const GeoDistance._();

  static const double _earthRadiusMeters = 6371000;
  static const double _metersPerYard = 0.9144;

  /// Haversine distance between two lat/lng points, in yards.
  static double distanceYds({
    required double fromLat,
    required double fromLng,
    required double toLat,
    required double toLng,
  }) {
    final dLat = _degToRad(toLat - fromLat);
    final dLng = _degToRad(toLng - fromLng);
    final a =
        math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_degToRad(fromLat)) *
            math.cos(_degToRad(toLat)) *
            math.sin(dLng / 2) *
            math.sin(dLng / 2);
    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    final meters = _earthRadiusMeters * c;
    return meters / _metersPerYard;
  }

  static double _degToRad(double deg) => deg * (math.pi / 180);
}
