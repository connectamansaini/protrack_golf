part of 'range_logger_bloc.dart';

sealed class RangeLoggerEvent extends Equatable {
  const RangeLoggerEvent();

  @override
  List<Object?> get props => [];
}

class RangeLoggerStarted extends RangeLoggerEvent {
  const RangeLoggerStarted();
}

class RangeLoggerLocationSelected extends RangeLoggerEvent {
  const RangeLoggerLocationSelected(this.locationId);

  final String locationId;

  @override
  List<Object?> get props => [locationId];
}

class RangeLoggerLocationAdded extends RangeLoggerEvent {
  const RangeLoggerLocationAdded({required this.name, this.notes = ''});

  final String name;
  final String notes;

  @override
  List<Object?> get props => [name, notes];
}

class RangeLoggerBucketSizeChanged extends RangeLoggerEvent {
  const RangeLoggerBucketSizeChanged(this.bucketSize);

  final int bucketSize;

  @override
  List<Object?> get props => [bucketSize];
}

class RangeLoggerSetupCompleted extends RangeLoggerEvent {
  const RangeLoggerSetupCompleted();
}

/// Reuse the clubs from the most recent saved session.
class RangeLoggerLastClubsApplied extends RangeLoggerEvent {
  const RangeLoggerLastClubsApplied();
}

/// Deselect every club for this session.
class RangeLoggerClubsCleared extends RangeLoggerEvent {
  const RangeLoggerClubsCleared();
}

/// Adds or removes a club from the set being used this session.
class RangeLoggerClubToggled extends RangeLoggerEvent {
  const RangeLoggerClubToggled(this.club);

  final GolfClub club;

  @override
  List<Object?> get props => [club];
}

class RangeLoggerClubSelected extends RangeLoggerEvent {
  const RangeLoggerClubSelected(this.club);

  final GolfClub club;

  @override
  List<Object?> get props => [club];
}

/// The slider moved: the distance the next shot will be recorded with.
class RangeLoggerDistanceChanged extends RangeLoggerEvent {
  const RangeLoggerDistanceChanged(this.distanceYds);

  final int distanceYds;

  @override
  List<Object?> get props => [distanceYds];
}

class RangeLoggerShotLogged extends RangeLoggerEvent {
  const RangeLoggerShotLogged(this.distanceYds);

  final double distanceYds;

  @override
  List<Object?> get props => [distanceYds];
}

class RangeLoggerLastShotUndone extends RangeLoggerEvent {
  const RangeLoggerLastShotUndone();
}

class RangeLoggerNotesChanged extends RangeLoggerEvent {
  const RangeLoggerNotesChanged(this.notes);

  final String notes;

  @override
  List<Object?> get props => [notes];
}

class RangeLoggerFinished extends RangeLoggerEvent {
  const RangeLoggerFinished();
}
