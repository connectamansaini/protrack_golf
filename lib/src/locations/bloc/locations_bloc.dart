import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protrack_golf/src/locations/entities/location.dart';
import 'package:protrack_golf/src/locations/helpers/locations_status.dart';
import 'package:protrack_golf/src/locations/usecases/add_location_usecase.dart';
import 'package:protrack_golf/src/locations/usecases/delete_location_usecase.dart';
import 'package:protrack_golf/src/locations/usecases/get_locations_usecase.dart';

part 'locations_event.dart';
part 'locations_state.dart';

class LocationsBloc extends Bloc<LocationsEvent, LocationsState> {
  LocationsBloc(this._getLocations, this._addLocation, this._deleteLocation)
    : super(const LocationsState()) {
    on<LocationsRequested>(_onRequested);
    on<LocationAdded>(_onAdded);
    on<LocationDeleted>(_onDeleted);
  }

  final GetLocationsUsecase _getLocations;
  final AddLocationUsecase _addLocation;
  final DeleteLocationUsecase _deleteLocation;

  Future<void> _onRequested(
    LocationsRequested event,
    Emitter<LocationsState> emit,
  ) async {
    emit(state.copyWith(status: const LocationsStatus.loading()));
    final result = await _getLocations();
    emit(
      result.fold(
        (failure) => state.copyWith(status: LocationsStatus.failure(failure)),
        (items) => state.copyWith(
          status: items.isEmpty
              ? const LocationsStatus.empty()
              : const LocationsStatus.success(),
          locations: items,
        ),
      ),
    );
  }

  Future<void> _onAdded(
    LocationAdded event,
    Emitter<LocationsState> emit,
  ) async {
    final result = await _addLocation(name: event.name, notes: event.notes);
    await result.fold(
      (failure) async =>
          emit(state.copyWith(status: LocationsStatus.failure(failure))),
      (_) => _onRequested(const LocationsRequested(), emit),
    );
  }

  Future<void> _onDeleted(
    LocationDeleted event,
    Emitter<LocationsState> emit,
  ) async {
    final result = await _deleteLocation(event.id);
    await result.fold(
      (failure) async =>
          emit(state.copyWith(status: LocationsStatus.failure(failure))),
      (_) => _onRequested(const LocationsRequested(), emit),
    );
  }
}
