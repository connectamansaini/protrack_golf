import 'package:protrack_golf/core/enums/enums.dart';

/// Classifies a numeric handicap index into the coarse [HandicapTier]
/// buckets the session generator and shot logger key their difficulty off
/// of.
abstract final class HandicapMath {
  const HandicapMath._();

  static HandicapTier tierForIndex(double handicapIndex) {
    if (handicapIndex >= 25) return HandicapTier.beginner;
    if (handicapIndex >= 12) return HandicapTier.mid;
    return HandicapTier.low;
  }
}
