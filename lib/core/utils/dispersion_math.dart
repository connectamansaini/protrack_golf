import 'package:protrack_golf/core/enums/enums.dart';

/// A single X/Y point in yards for plotting shot dispersion. X is the
/// lateral offset from the target line (negative = left, positive =
/// right); Y is the long/short offset from the target distance (negative =
/// short, positive = long).
class DispersionPoint {
  const DispersionPoint({required this.x, required this.y});

  final double x;
  final double y;
}

/// Derives plottable dispersion coordinates from the qualitative tags the
/// 2-tap shot logger captures (no launch monitor yet - that's the Phase 2
/// BLE integration), so treat these as an approximate plotting aid rather
/// than a measured trajectory.
abstract final class DispersionMath {
  const DispersionMath._();

  /// Lateral offset in yards for a given [direction]. Curvature is scaled
  /// by [carryDistanceYds] because a slice or hook opens up further the
  /// longer the shot flies.
  static double lateralOffsetYds({
    required ShotDirection direction,
    required double carryDistanceYds,
  }) {
    final curvatureFactor = carryDistanceYds / 100;
    return switch (direction) {
      ShotDirection.straight => 0,
      ShotDirection.pull => -8 * curvatureFactor,
      ShotDirection.push => 8 * curvatureFactor,
      ShotDirection.hook => -18 * curvatureFactor,
      ShotDirection.slice => 18 * curvatureFactor,
    };
  }

  /// Long/short offset in yards: how far the shot actually carried past
  /// (positive) or short of (negative) the intended [targetDistanceYds].
  static double longShortOffsetYds({
    required double carryDistanceYds,
    required double targetDistanceYds,
  }) => carryDistanceYds - targetDistanceYds;

  /// Combines [lateralOffsetYds] and [longShortOffsetYds] into a single
  /// plottable [DispersionPoint].
  static DispersionPoint dispersionPoint({
    required ShotDirection direction,
    required double carryDistanceYds,
    required double targetDistanceYds,
  }) => DispersionPoint(
    x: lateralOffsetYds(
      direction: direction,
      carryDistanceYds: carryDistanceYds,
    ),
    y: longShortOffsetYds(
      carryDistanceYds: carryDistanceYds,
      targetDistanceYds: targetDistanceYds,
    ),
  );
}
