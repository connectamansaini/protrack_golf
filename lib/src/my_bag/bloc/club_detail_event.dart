part of 'club_detail_bloc.dart';

sealed class ClubDetailEvent extends Equatable {
  const ClubDetailEvent();

  @override
  List<Object?> get props => [];
}

class ClubDetailRequested extends ClubDetailEvent {
  const ClubDetailRequested(this.club);

  final GolfClub club;

  @override
  List<Object?> get props => [club];
}

/// The golfer set (or changed) their own distance for this club, which also
/// puts it in the bag if it wasn't already.
class ClubDetailDistanceSaved extends ClubDetailEvent {
  const ClubDetailDistanceSaved(this.distanceYds);

  final double distanceYds;

  @override
  List<Object?> get props => [distanceYds];
}
