part of 'session_detail_bloc.dart';

sealed class SessionDetailEvent extends Equatable {
  const SessionDetailEvent();

  @override
  List<Object?> get props => [];
}

class SessionDetailRequested extends SessionDetailEvent {
  const SessionDetailRequested(this.id);

  final String id;

  @override
  List<Object?> get props => [id];
}
