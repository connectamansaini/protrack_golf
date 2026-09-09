part of 'range_logger_bloc.dart';

class RangeLoggerState extends Equatable {
  const RangeLoggerState({
    this.step = RangeLoggerStep.setup,
    this.locationsStatus = const LocationsStatus.initial(),
    this.availableLocations = const [],
    this.selectedLocationId = '',
    this.bucketSize = 50,
    this.sessionClubs = const {GolfClub.iron7},
    this.lastSessionClubs = const {},
    this.selectedClub = GolfClub.iron7,
    this.pendingDistanceYds = 100,
    this.lastDistanceByClub = const {},
    this.shots = const [],
    this.notes = '',
    this.submitStatus = const SessionsStatus.initial(),
    this.savedSession,
  });

  final RangeLoggerStep step;
  final LocationsStatus locationsStatus;
  final List<Location> availableLocations;
  final String selectedLocationId;
  final int bucketSize;

  /// The clubs chosen for this session; the logging step only offers these.
  final Set<GolfClub> sessionClubs;

  /// Clubs hit in the most recent saved session, offered as a one-tap preset.
  final Set<GolfClub> lastSessionClubs;
  final GolfClub selectedClub;

  /// The distance the next "Add shot" tap records, driven by the slider.
  final int pendingDistanceYds;

  /// Last recorded distance per club, so switching clubs lands the slider
  /// near where that club's shots have been going.
  final Map<GolfClub, int> lastDistanceByClub;

  /// Every shot in the order it was hit, so "undo last shot" is trivial.
  final List<RangeShot> shots;
  final String notes;
  final SessionsStatus submitStatus;
  final PracticeSession? savedSession;

  bool get canStartLogging =>
      selectedLocationId.isNotEmpty && bucketSize > 0 && sessionClubs.isNotEmpty;

  bool get canFinish => shots.isNotEmpty;

  int get shotCount => shots.length;

  /// Balls left in the bucket, never below zero (a golfer can keep logging
  /// past the nominal bucket size).
  int get ballsRemaining =>
      bucketSize - shotCount < 0 ? 0 : bucketSize - shotCount;

  /// Shots logged per club so far this session.
  Map<GolfClub, int> get shotCountsByClub {
    final counts = <GolfClub, int>{};
    for (final shot in shots) {
      counts[shot.club] = (counts[shot.club] ?? 0) + 1;
    }
    return counts;
  }

  int get selectedClubShots => shotCountsByClub[selectedClub] ?? 0;

  double get selectedClubAverageYds {
    final distances = [
      for (final shot in shots)
        if (shot.club == selectedClub) shot.distanceYds,
    ];
    return distances.isEmpty
        ? 0
        : distances.reduce((a, b) => a + b) / distances.length;
  }

  /// The in-progress session's club entries: one `ClubEntry` per club used,
  /// in bag order, with that club's distances in the order they were hit.
  List<ClubEntry> get clubEntries {
    final byClub = <GolfClub, List<double>>{};
    for (final shot in shots) {
      byClub.putIfAbsent(shot.club, () => []).add(shot.distanceYds);
    }
    return [
      for (final club in GolfClub.values)
        if (byClub[club] case final distances?)
          ClubEntry(club: club, distances: distances),
    ];
  }

  RangeLoggerState copyWith({
    RangeLoggerStep? step,
    LocationsStatus? locationsStatus,
    List<Location>? availableLocations,
    String? selectedLocationId,
    int? bucketSize,
    Set<GolfClub>? sessionClubs,
    Set<GolfClub>? lastSessionClubs,
    GolfClub? selectedClub,
    int? pendingDistanceYds,
    Map<GolfClub, int>? lastDistanceByClub,
    List<RangeShot>? shots,
    String? notes,
    SessionsStatus? submitStatus,
    PracticeSession? savedSession,
  }) {
    return RangeLoggerState(
      step: step ?? this.step,
      locationsStatus: locationsStatus ?? this.locationsStatus,
      availableLocations: availableLocations ?? this.availableLocations,
      selectedLocationId: selectedLocationId ?? this.selectedLocationId,
      bucketSize: bucketSize ?? this.bucketSize,
      sessionClubs: sessionClubs ?? this.sessionClubs,
      lastSessionClubs: lastSessionClubs ?? this.lastSessionClubs,
      selectedClub: selectedClub ?? this.selectedClub,
      pendingDistanceYds: pendingDistanceYds ?? this.pendingDistanceYds,
      lastDistanceByClub: lastDistanceByClub ?? this.lastDistanceByClub,
      shots: shots ?? this.shots,
      notes: notes ?? this.notes,
      submitStatus: submitStatus ?? this.submitStatus,
      savedSession: savedSession ?? this.savedSession,
    );
  }

  @override
  List<Object?> get props => [
    step,
    locationsStatus,
    availableLocations,
    selectedLocationId,
    bucketSize,
    sessionClubs,
    lastSessionClubs,
    selectedClub,
    pendingDistanceYds,
    lastDistanceByClub,
    shots,
    notes,
    submitStatus,
    savedSession,
  ];
}
