/// Route paths for the sessions feature (the Log/History tab, plus its
/// add/range-logger/detail/recap routes).
abstract final class SessionsRoutes {
  const SessionsRoutes._();

  static const String tab = '/sessions';
  static const String newSession = '/sessions/new';
  static const String rangeLogger = '/sessions/range';
  static const String detailPattern = '/sessions/:id';
  static const String recapPattern = '/sessions/:id/recap';

  static String detail(String id) => '/sessions/$id';

  static String recap(String id) => '/sessions/$id/recap';
}

/// Route paths for the locations feature.
abstract final class LocationsRoutes {
  const LocationsRoutes._();

  static const String list = '/locations';
}

/// Route paths for the My Bag tab and its per-club detail screen. The club
/// is passed in the path as its `GolfClub.name`.
abstract final class MyBagRoutes {
  const MyBagRoutes._();

  static const String tab = '/my-bag';
  static const String clubPattern = '/my-bag/:club';

  static String club(String clubName) => '/my-bag/$clubName';
}
