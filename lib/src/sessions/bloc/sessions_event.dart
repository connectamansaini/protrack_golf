part of 'sessions_bloc.dart';

sealed class SessionsEvent extends Equatable {
  const SessionsEvent();

  @override
  List<Object?> get props => [];
}

class SessionsRequested extends SessionsEvent {
  const SessionsRequested();
}

class SessionDeleted extends SessionsEvent {
  const SessionDeleted(this.id);

  final String id;

  @override
  List<Object?> get props => [id];
}
