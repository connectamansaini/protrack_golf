import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protrack_golf/src/sessions/entities/practice_session.dart';
import 'package:protrack_golf/src/sessions/helpers/sessions_status.dart';
import 'package:protrack_golf/src/sessions/usecases/get_session_by_id_usecase.dart';

part 'session_detail_event.dart';
part 'session_detail_state.dart';

/// Drives a single practice session's read-only detail screen.
class SessionDetailBloc extends Bloc<SessionDetailEvent, SessionDetailState> {
  SessionDetailBloc(this._getSessionById) : super(const SessionDetailState()) {
    on<SessionDetailRequested>(_onRequested);
  }

  final GetSessionByIdUsecase _getSessionById;

  Future<void> _onRequested(
    SessionDetailRequested event,
    Emitter<SessionDetailState> emit,
  ) async {
    emit(state.copyWith(status: const SessionsStatus.loading()));
    final result = await _getSessionById(event.id);
    emit(
      result.fold(
        (failure) => state.copyWith(status: SessionsStatus.failure(failure)),
        (session) => state.copyWith(
          status: const SessionsStatus.success(),
          session: session,
        ),
      ),
    );
  }
}
