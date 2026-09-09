import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protrack_golf/src/locations/locations.dart';
import 'package:protrack_golf/src/sessions/entities/club_entry.dart';
import 'package:protrack_golf/src/sessions/entities/practice_session.dart';
import 'package:protrack_golf/src/sessions/helpers/sessions_status.dart';
import 'package:protrack_golf/src/sessions/usecases/log_session_usecase.dart';

part 'session_form_event.dart';
part 'session_form_state.dart';

/// Drives the "log a practice session" form: picking/creating a location,
/// building up club entries, attaching media, and finally saving.
///
/// Depends on the locations feature's domain layer (its usecases) as a
/// cross-feature dependency, per the architecture spec.
class SessionFormBloc extends Bloc<SessionFormEvent, SessionFormState> {
  SessionFormBloc(this._getLocations, this._addLocation, this._logSession)
    : super(const SessionFormState()) {
    on<SessionFormStarted>(_onStarted);
    on<SessionFormLocationSelected>(_onLocationSelected);
    on<SessionFormLocationAdded>(_onLocationAdded);
    on<SessionFormDateChanged>(_onDateChanged);
    on<SessionFormBucketSizeChanged>(_onBucketSizeChanged);
    on<SessionFormClubEntryAdded>(_onClubEntryAdded);
    on<SessionFormClubEntryRemoved>(_onClubEntryRemoved);
    on<SessionFormNotesChanged>(_onNotesChanged);
    on<SessionFormMediaAdded>(_onMediaAdded);
    on<SessionFormMediaRemoved>(_onMediaRemoved);
    on<SessionFormSubmitted>(_onSubmitted);
    on<SessionFormBlocReset>(_onReset);
  }

  final GetLocationsUsecase _getLocations;
  final AddLocationUsecase _addLocation;
  final LogSessionUsecase _logSession;

  Future<void> _onStarted(
    SessionFormStarted event,
    Emitter<SessionFormState> emit,
  ) async {
    emit(state.copyWith(locationsStatus: const LocationsStatus.loading()));
    final result = await _getLocations();
    emit(
      result.fold(
        (failure) =>
            state.copyWith(locationsStatus: LocationsStatus.failure(failure)),
        (locations) => state.copyWith(
          locationsStatus: locations.isEmpty
              ? const LocationsStatus.empty()
              : const LocationsStatus.success(),
          availableLocations: locations,
        ),
      ),
    );
  }

  Future<void> _onDateChanged(
    SessionFormDateChanged event,
    Emitter<SessionFormState> emit,
  ) async {
    emit(state.copyWith(date: event.date));
  }

  Future<void> _onLocationSelected(
    SessionFormLocationSelected event,
    Emitter<SessionFormState> emit,
  ) async {
    emit(state.copyWith(selectedLocationId: event.locationId));
  }

  Future<void> _onLocationAdded(
    SessionFormLocationAdded event,
    Emitter<SessionFormState> emit,
  ) async {
    final result = await _addLocation(name: event.name, notes: event.notes);
    result.fold(
      (failure) => emit(
        state.copyWith(locationsStatus: LocationsStatus.failure(failure)),
      ),
      (location) => emit(
        state.copyWith(
          availableLocations: [...state.availableLocations, location],
          selectedLocationId: location.id,
          locationsStatus: const LocationsStatus.success(),
        ),
      ),
    );
  }

  Future<void> _onBucketSizeChanged(
    SessionFormBucketSizeChanged event,
    Emitter<SessionFormState> emit,
  ) async {
    emit(state.copyWith(bucketSize: event.bucketSize));
  }

  Future<void> _onClubEntryAdded(
    SessionFormClubEntryAdded event,
    Emitter<SessionFormState> emit,
  ) async {
    emit(
      state.copyWith(clubEntries: [...state.clubEntries, event.entry]),
    );
  }

  Future<void> _onClubEntryRemoved(
    SessionFormClubEntryRemoved event,
    Emitter<SessionFormState> emit,
  ) async {
    final updated = [...state.clubEntries]..removeAt(event.index);
    emit(state.copyWith(clubEntries: updated));
  }

  Future<void> _onNotesChanged(
    SessionFormNotesChanged event,
    Emitter<SessionFormState> emit,
  ) async {
    emit(state.copyWith(notes: event.notes));
  }

  Future<void> _onMediaAdded(
    SessionFormMediaAdded event,
    Emitter<SessionFormState> emit,
  ) async {
    emit(state.copyWith(mediaPaths: [...state.mediaPaths, event.path]));
  }

  Future<void> _onMediaRemoved(
    SessionFormMediaRemoved event,
    Emitter<SessionFormState> emit,
  ) async {
    emit(
      state.copyWith(
        mediaPaths: state.mediaPaths.where((p) => p != event.path).toList(),
      ),
    );
  }

  Future<void> _onSubmitted(
    SessionFormSubmitted event,
    Emitter<SessionFormState> emit,
  ) async {
    if (!state.canSubmit) return;
    emit(state.copyWith(submitStatus: const SessionsStatus.loading()));
    final session = PracticeSession(
      date: state.date ?? DateTime.now(),
      locationId: state.selectedLocationId,
      bucketSize: state.bucketSize,
      clubEntries: state.clubEntries,
      notes: state.notes,
      mediaPaths: state.mediaPaths,
    );
    final result = await _logSession(session);
    emit(
      result.fold(
        (failure) =>
            state.copyWith(submitStatus: SessionsStatus.failure(failure)),
        (saved) => state.copyWith(
          submitStatus: const SessionsStatus.success(),
          savedSession: saved,
        ),
      ),
    );
  }

  Future<void> _onReset(
    SessionFormBlocReset event,
    Emitter<SessionFormState> emit,
  ) async {
    emit(const SessionFormState());
  }
}
