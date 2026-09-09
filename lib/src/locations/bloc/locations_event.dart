part of 'locations_bloc.dart';

sealed class LocationsEvent extends Equatable {
  const LocationsEvent();

  @override
  List<Object?> get props => [];
}

class LocationsRequested extends LocationsEvent {
  const LocationsRequested();
}

class LocationAdded extends LocationsEvent {
  const LocationAdded({required this.name, this.notes = ''});

  final String name;
  final String notes;

  @override
  List<Object?> get props => [name, notes];
}

class LocationDeleted extends LocationsEvent {
  const LocationDeleted(this.id);

  final String id;

  @override
  List<Object?> get props => [id];
}
