import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/my_bag/entities/club_distance_record.dart';
import 'package:protrack_golf/src/my_bag/helpers/my_bag_status.dart';
import 'package:protrack_golf/src/my_bag/usecases/get_club_distance_records_usecase.dart';
import 'package:protrack_golf/src/my_bag/usecases/remove_bag_club_usecase.dart';
import 'package:protrack_golf/src/my_bag/usecases/save_bag_club_usecase.dart';

part 'my_bag_event.dart';
part 'my_bag_state.dart';

/// Drives the My Bag tab: one distance record per club, merged from the
/// clubs the golfer added by hand and the shots they logged at the range.
class MyBagBloc extends Bloc<MyBagEvent, MyBagState> {
  MyBagBloc(
    this._getClubDistanceRecords,
    this._saveBagClub,
    this._removeBagClub,
  ) : super(const MyBagState()) {
    on<MyBagRequested>(_onRequested);
    on<BagClubSaved>(_onBagClubSaved);
    on<BagClubRemoved>(_onBagClubRemoved);
  }

  final GetClubDistanceRecordsUsecase _getClubDistanceRecords;
  final SaveBagClubUsecase _saveBagClub;
  final RemoveBagClubUsecase _removeBagClub;

  Future<void> _onRequested(
    MyBagRequested event,
    Emitter<MyBagState> emit,
  ) async {
    emit(state.copyWith(status: const MyBagStatus.loading()));
    final result = await _getClubDistanceRecords();
    emit(
      result.fold(
        (failure) => state.copyWith(status: MyBagStatus.failure(failure)),
        (records) => state.copyWith(
          status: records.isEmpty
              ? const MyBagStatus.empty()
              : const MyBagStatus.success(),
          records: records,
        ),
      ),
    );
  }

  Future<void> _onBagClubSaved(
    BagClubSaved event,
    Emitter<MyBagState> emit,
  ) async {
    final result = await _saveBagClub(
      club: event.club,
      distanceYds: event.distanceYds,
    );
    await result.fold(
      (failure) async =>
          emit(state.copyWith(status: MyBagStatus.failure(failure))),
      (_) => _onRequested(const MyBagRequested(), emit),
    );
  }

  Future<void> _onBagClubRemoved(
    BagClubRemoved event,
    Emitter<MyBagState> emit,
  ) async {
    final result = await _removeBagClub(event.club);
    await result.fold(
      (failure) async =>
          emit(state.copyWith(status: MyBagStatus.failure(failure))),
      (_) => _onRequested(const MyBagRequested(), emit),
    );
  }
}
