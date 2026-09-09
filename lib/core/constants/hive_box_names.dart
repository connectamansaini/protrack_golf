/// Names of the local Hive boxes, also reused as get_it instance names for
/// the corresponding `Box<Map>` registrations.
abstract final class HiveBoxNames {
  const HiveBoxNames._();

  static const String locations = 'locations_box';
  static const String sessions = 'sessions_box';
  static const String routines = 'routines_box';
  static const String bucketSessions = 'bucket_sessions_box';
  static const String bagClubs = 'bag_clubs_box';
}
