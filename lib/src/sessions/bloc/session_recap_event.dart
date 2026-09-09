part of 'session_recap_bloc.dart';

sealed class SessionRecapEvent extends Equatable {
  const SessionRecapEvent();

  @override
  List<Object?> get props => [];
}

class SessionRecapRequested extends SessionRecapEvent {
  const SessionRecapRequested(this.id);

  final String id;

  @override
  List<Object?> get props => [id];
}
