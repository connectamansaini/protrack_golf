import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protrack_golf/src/sessions/entities/session_recap.dart';
import 'package:protrack_golf/src/sessions/helpers/sessions_status.dart';
import 'package:protrack_golf/src/sessions/usecases/get_session_recap_usecase.dart';

part 'session_recap_event.dart';
part 'session_recap_state.dart';

/// Drives the post-session recap screen for a single saved session.
class SessionRecapBloc extends Bloc<SessionRecapEvent, SessionRecapState> {
  SessionRecapBloc(this._getSessionRecap) : super(const SessionRecapState()) {
    on<SessionRecapRequested>(_onRequested);
  }

  final GetSessionRecapUsecase _getSessionRecap;

  Future<void> _onRequested(
    SessionRecapRequested event,
    Emitter<SessionRecapState> emit,
  ) async {
    emit(state.copyWith(status: const SessionsStatus.loading()));
    final result = await _getSessionRecap(event.id);
    emit(
      result.fold(
        (failure) => state.copyWith(status: SessionsStatus.failure(failure)),
        (recap) => state.copyWith(
          status: recap.clubRecaps.isEmpty
              ? const SessionsStatus.empty()
              : const SessionsStatus.success(),
          recap: recap,
        ),
      ),
    );
  }
}
