part of 'sessions_bloc.dart';

class SessionsState extends Equatable {
  const SessionsState({
    this.status = const SessionsStatus.initial(),
    this.sessions = const [],
  });

  final SessionsStatus status;

  /// Newest first (the repository sorts them).
  final List<PracticeSession> sessions;

  /// Sessions dated in the same calendar month as [now].
  List<PracticeSession> sessionsInMonth(DateTime now) => [
    for (final session in sessions)
      if (session.date.year == now.year && session.date.month == now.month)
        session,
  ];

  /// Balls hit across the sessions dated in the same calendar month as [now].
  int shotsInMonth(DateTime now) => sessionsInMonth(
    now,
  ).fold(0, (sum, session) => sum + session.totalShots);

  PracticeSession? get latestSession =>
      sessions.isEmpty ? null : sessions.first;

  SessionsState copyWith({
    SessionsStatus? status,
    List<PracticeSession>? sessions,
  }) {
    return SessionsState(
      status: status ?? this.status,
      sessions: sessions ?? this.sessions,
    );
  }

  @override
  List<Object?> get props => [status, sessions];
}
