import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/my_bag/entities/club_distance_record.dart';
import 'package:protrack_golf/src/my_bag/entities/club_session_summary.dart';
import 'package:protrack_golf/src/my_bag/helpers/my_bag_failure.dart';
import 'package:protrack_golf/src/my_bag/helpers/my_bag_status.dart';
import 'package:protrack_golf/src/my_bag/usecases/get_club_distance_records_usecase.dart';
import 'package:protrack_golf/src/my_bag/usecases/get_club_session_history_usecase.dart';
import 'package:protrack_golf/src/my_bag/usecases/save_bag_club_usecase.dart';
import 'package:protrack_golf/src/progress/progress.dart';

part 'club_detail_event.dart';
part 'club_detail_state.dart';

/// Drives a single club's detail screen: its yardage record, its
/// average-distance trend (reusing the progress feature's `ClubTrend`), and
/// the list of sessions it was hit in.
class ClubDetailBloc extends Bloc<ClubDetailEvent, ClubDetailState> {
  ClubDetailBloc(
    this._getClubDistanceRecords,
    this._getClubTrends,
    this._getClubSessionHistory,
    this._saveBagClub,
  ) : super(const ClubDetailState()) {
    on<ClubDetailRequested>(_onRequested);
    on<ClubDetailDistanceSaved>(_onDistanceSaved);
  }

  final GetClubDistanceRecordsUsecase _getClubDistanceRecords;
  final GetClubTrendsUsecase _getClubTrends;
  final GetClubSessionHistoryUsecase _getClubSessionHistory;
  final SaveBagClubUsecase _saveBagClub;

  Future<void> _onDistanceSaved(
    ClubDetailDistanceSaved event,
    Emitter<ClubDetailState> emit,
  ) async {
    final result = await _saveBagClub(
      club: state.club,
      distanceYds: event.distanceYds,
    );
    result.fold(
      (failure) => emit(state.copyWith(status: MyBagStatus.failure(failure))),
      (_) => add(ClubDetailRequested(state.club)),
    );
  }

  Future<void> _onRequested(
    ClubDetailRequested event,
    Emitter<ClubDetailState> emit,
  ) async {
    emit(state.copyWith(status: const MyBagStatus.loading(), club: event.club));
    final recordsResult = await _getClubDistanceRecords();
    final trendsResult = await _getClubTrends();
    final historyResult = await _getClubSessionHistory(event.club);

    await recordsResult.fold(
      (failure) async =>
          emit(state.copyWith(status: MyBagStatus.failure(failure))),
      (records) async {
        await trendsResult.fold(
          (failure) async => emit(
            state.copyWith(
              status: MyBagStatus.failure(MyBagFailure(failure.message)),
            ),
          ),
          (trends) async {
            await historyResult.fold(
              (failure) async =>
                  emit(state.copyWith(status: MyBagStatus.failure(failure))),
              (history) async {
                final record = records
                    .where((r) => r.club == event.club)
                    .firstOrNull;
                final trend = trends
                    .where((t) => t.club == event.club)
                    .firstOrNull;
                emit(
                  state.copyWith(
                    status: record == null
                        ? const MyBagStatus.empty()
                        : const MyBagStatus.success(),
                    record: record ?? ClubDistanceRecord(club: event.club),
                    trend: trend ?? ClubTrend(club: event.club),
                    history: history,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
