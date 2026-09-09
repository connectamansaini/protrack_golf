part of 'session_form_bloc.dart';

class SessionFormState extends Equatable {
  const SessionFormState({
    this.locationsStatus = const LocationsStatus.initial(),
    this.availableLocations = const [],
    this.selectedLocationId = '',
    this.date,
    this.bucketSize = 50,
    this.clubEntries = const [],
    this.notes = '',
    this.mediaPaths = const [],
    this.submitStatus = const SessionsStatus.initial(),
    this.savedSession,
  });

  final LocationsStatus locationsStatus;
  final List<Location> availableLocations;
  final String selectedLocationId;

  /// When the session happened; null means "today" at save time.
  final DateTime? date;
  final int bucketSize;
  final List<ClubEntry> clubEntries;
  final String notes;
  final List<String> mediaPaths;
  final SessionsStatus submitStatus;
  final PracticeSession? savedSession;

  bool get canSubmit => selectedLocationId.isNotEmpty && clubEntries.isNotEmpty;

  SessionFormState copyWith({
    LocationsStatus? locationsStatus,
    List<Location>? availableLocations,
    String? selectedLocationId,
    DateTime? date,
    int? bucketSize,
    List<ClubEntry>? clubEntries,
    String? notes,
    List<String>? mediaPaths,
    SessionsStatus? submitStatus,
    PracticeSession? savedSession,
  }) {
    return SessionFormState(
      locationsStatus: locationsStatus ?? this.locationsStatus,
      availableLocations: availableLocations ?? this.availableLocations,
      selectedLocationId: selectedLocationId ?? this.selectedLocationId,
      date: date ?? this.date,
      bucketSize: bucketSize ?? this.bucketSize,
      clubEntries: clubEntries ?? this.clubEntries,
      notes: notes ?? this.notes,
      mediaPaths: mediaPaths ?? this.mediaPaths,
      submitStatus: submitStatus ?? this.submitStatus,
      savedSession: savedSession ?? this.savedSession,
    );
  }

  @override
  List<Object?> get props => [
    locationsStatus,
    availableLocations,
    selectedLocationId,
    date,
    bucketSize,
    clubEntries,
    notes,
    mediaPaths,
    submitStatus,
    savedSession,
  ];
}
