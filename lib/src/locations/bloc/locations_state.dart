part of 'locations_bloc.dart';

class LocationsState extends Equatable {
  const LocationsState({
    this.status = const LocationsStatus.initial(),
    this.locations = const [],
  });

  final LocationsStatus status;
  final List<Location> locations;

  LocationsState copyWith({
    LocationsStatus? status,
    List<Location>? locations,
  }) {
    return LocationsState(
      status: status ?? this.status,
      locations: locations ?? this.locations,
    );
  }

  @override
  List<Object?> get props => [status, locations];
}
