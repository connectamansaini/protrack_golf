import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protrack_golf/src/sessions/entities/practice_session.dart';
import 'package:protrack_golf/src/sessions/helpers/sessions_status.dart';
import 'package:protrack_golf/src/sessions/usecases/delete_session_usecase.dart';
import 'package:protrack_golf/src/sessions/usecases/get_sessions_usecase.dart';

part 'sessions_event.dart';
part 'sessions_state.dart';

/// Drives the practice-session history/log screen.
class SessionsBloc extends Bloc<SessionsEvent, SessionsState> {
  SessionsBloc(this._getSessions, this._deleteSession)
    : super(const SessionsState()) {
    on<SessionsRequested>(_onRequested);
    on<SessionDeleted>(_onDeleted);
  }

  final GetSessionsUsecase _getSessions;
  final DeleteSessionUsecase _deleteSession;

  Future<void> _onRequested(
    SessionsRequested event,
    Emitter<SessionsState> emit,
  ) async {
    emit(state.copyWith(status: const SessionsStatus.loading()));
    final result = await _getSessions();
    emit(
      result.fold(
        (failure) => state.copyWith(status: SessionsStatus.failure(failure)),
        (items) => state.copyWith(
          status: items.isEmpty
              ? const SessionsStatus.empty()
              : const SessionsStatus.success(),
          sessions: items,
        ),
      ),
    );
  }

  Future<void> _onDeleted(
    SessionDeleted event,
    Emitter<SessionsState> emit,
  ) async {
    final result = await _deleteSession(event.id);
    await result.fold(
      (failure) async =>
          emit(state.copyWith(status: SessionsStatus.failure(failure))),
      (_) => _onRequested(const SessionsRequested(), emit),
    );
  }
}
