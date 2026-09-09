part of 'session_recap_bloc.dart';

class SessionRecapState extends Equatable {
  const SessionRecapState({
    this.status = const SessionsStatus.initial(),
    this.recap,
  });

  final SessionsStatus status;
  final SessionRecap? recap;

  SessionRecapState copyWith({SessionsStatus? status, SessionRecap? recap}) {
    return SessionRecapState(
      status: status ?? this.status,
      recap: recap ?? this.recap,
    );
  }

  @override
  List<Object?> get props => [status, recap];
}
