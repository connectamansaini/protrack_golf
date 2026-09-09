part of 'session_form_bloc.dart';

sealed class SessionFormEvent extends Equatable {
  const SessionFormEvent();

  @override
  List<Object?> get props => [];
}

class SessionFormStarted extends SessionFormEvent {
  const SessionFormStarted();
}

class SessionFormLocationSelected extends SessionFormEvent {
  const SessionFormLocationSelected(this.locationId);

  final String locationId;

  @override
  List<Object?> get props => [locationId];
}

class SessionFormLocationAdded extends SessionFormEvent {
  const SessionFormLocationAdded({required this.name, this.notes = ''});

  final String name;
  final String notes;

  @override
  List<Object?> get props => [name, notes];
}

/// The day the session happened (a past session may be added later).
class SessionFormDateChanged extends SessionFormEvent {
  const SessionFormDateChanged(this.date);

  final DateTime date;

  @override
  List<Object?> get props => [date];
}

class SessionFormBucketSizeChanged extends SessionFormEvent {
  const SessionFormBucketSizeChanged(this.bucketSize);

  final int bucketSize;

  @override
  List<Object?> get props => [bucketSize];
}

class SessionFormClubEntryAdded extends SessionFormEvent {
  const SessionFormClubEntryAdded(this.entry);

  final ClubEntry entry;

  @override
  List<Object?> get props => [entry];
}

class SessionFormClubEntryRemoved extends SessionFormEvent {
  const SessionFormClubEntryRemoved(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}

class SessionFormNotesChanged extends SessionFormEvent {
  const SessionFormNotesChanged(this.notes);

  final String notes;

  @override
  List<Object?> get props => [notes];
}

class SessionFormMediaAdded extends SessionFormEvent {
  const SessionFormMediaAdded(this.path);

  final String path;

  @override
  List<Object?> get props => [path];
}

class SessionFormMediaRemoved extends SessionFormEvent {
  const SessionFormMediaRemoved(this.path);

  final String path;

  @override
  List<Object?> get props => [path];
}

class SessionFormSubmitted extends SessionFormEvent {
  const SessionFormSubmitted();
}

class SessionFormBlocReset extends SessionFormEvent {
  const SessionFormBlocReset();
}
