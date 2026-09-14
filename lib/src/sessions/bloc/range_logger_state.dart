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
    this.templates = const [],
    this.selectedTemplateId = '',
    this.plan,
    this.planMessage = '',
    this.phaseIndex = 0,
    this.phaseShots = 0,
    this.selectedClub = GolfClub.iron7,
    this.pendingIntent = ShotIntent.full,
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

  /// Session templates the golfer can structure the bucket with.
  final List<SessionTemplate> templates;

  /// The chosen template id, or `''` for free practice.
  final String selectedTemplateId;

  /// The plan built from [selectedTemplateId] for the current clubs and
  /// bucket, or null for free practice (or when it couldn't be built).
  final SessionPlan? plan;

  /// Why the selected template couldn't be applied, if it couldn't.
  final String planMessage;

  /// Which phase of [plan] the golfer is in, and how many balls they have
  /// hit in it so far.
  final int phaseIndex;
  final int phaseShots;

  final GolfClub selectedClub;

  /// Whether the next ball is logged as practice or full potential.
  final ShotIntent pendingIntent;

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
      selectedLocationId.isNotEmpty &&
      bucketSize > 0 &&
      sessionClubs.isNotEmpty;

  bool get canFinish => shots.isNotEmpty;

  bool get hasPlan => plan != null;

  PlanPhase? get currentPhase {
    final phases = plan?.phases;
    if (phases == null || phaseIndex < 0 || phaseIndex >= phases.length) {
      return null;
    }
    return phases[phaseIndex];
  }

  bool get isFirstPhase => phaseIndex == 0;

  bool get isLastPhase => plan == null || phaseIndex >= plan!.phaseCount - 1;

  int get shotCount => shots.length;

  int get fullShotCount => shots.where((shot) => !shot.isPractice).length;

  int get practiceShotCount => shotCount - fullShotCount;

  /// Balls left in the bucket, never below zero (a golfer can keep logging
  /// past the nominal bucket size).
  int get ballsRemaining =>
      bucketSize - shotCount < 0 ? 0 : bucketSize - shotCount;

  /// Shots logged per club so far this session, practice included.
  Map<GolfClub, int> get shotCountsByClub {
    final counts = <GolfClub, int>{};
    for (final shot in shots) {
      counts[shot.club] = (counts[shot.club] ?? 0) + 1;
    }
    return counts;
  }

  int get selectedClubShots => shotCountsByClub[selectedClub] ?? 0;

  /// Average of the selected club's full-potential shots this session.
  double get selectedClubAverageYds {
    final distances = [
      for (final shot in shots)
        if (shot.club == selectedClub && !shot.isPractice) shot.distanceYds,
    ];
    return distances.isEmpty
        ? 0
        : distances.reduce((a, b) => a + b) / distances.length;
  }

  /// The in-progress session's club entries: one `ClubEntry` per club used,
  /// in bag order, full-potential and practice distances kept apart.
  List<ClubEntry> get clubEntries {
    final full = <GolfClub, List<double>>{};
    final practice = <GolfClub, List<double>>{};
    for (final shot in shots) {
      (shot.isPractice ? practice : full)
          .putIfAbsent(shot.club, () => [])
          .add(shot.distanceYds);
    }
    return [
      for (final club in GolfClub.values)
        if (full.containsKey(club) || practice.containsKey(club))
          ClubEntry(
            club: club,
            distances: full[club] ?? const [],
            practiceDistances: practice[club] ?? const [],
          ),
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
    List<SessionTemplate>? templates,
    String? selectedTemplateId,
    SessionPlan? plan,
    bool clearPlan = false,
    String? planMessage,
    int? phaseIndex,
    int? phaseShots,
    GolfClub? selectedClub,
    ShotIntent? pendingIntent,
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
      templates: templates ?? this.templates,
      selectedTemplateId: selectedTemplateId ?? this.selectedTemplateId,
      plan: clearPlan ? null : plan ?? this.plan,
      planMessage: planMessage ?? this.planMessage,
      phaseIndex: phaseIndex ?? this.phaseIndex,
      phaseShots: phaseShots ?? this.phaseShots,
      selectedClub: selectedClub ?? this.selectedClub,
      pendingIntent: pendingIntent ?? this.pendingIntent,
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
    templates,
    selectedTemplateId,
    plan,
    planMessage,
    phaseIndex,
    phaseShots,
    selectedClub,
    pendingIntent,
    pendingDistanceYds,
    lastDistanceByClub,
    shots,
    notes,
    submitStatus,
    savedSession,
  ];
}
