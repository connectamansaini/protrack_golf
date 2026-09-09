part of 'session_detail_bloc.dart';

class SessionDetailState extends Equatable {
  const SessionDetailState({
    this.status = const SessionsStatus.initial(),
    this.session,
  });

  final SessionsStatus status;
  final PracticeSession? session;

  SessionDetailState copyWith({
    SessionsStatus? status,
    PracticeSession? session,
  }) {
    return SessionDetailState(
      status: status ?? this.status,
      session: session ?? this.session,
    );
  }

  @override
  List<Object?> get props => [status, session];
}
