part of 'my_bag_bloc.dart';

sealed class MyBagEvent extends Equatable {
  const MyBagEvent();

  @override
  List<Object?> get props => [];
}

class MyBagRequested extends MyBagEvent {
  const MyBagRequested();
}

/// A club was added to the bag, or its manual distance was edited.
class BagClubSaved extends MyBagEvent {
  const BagClubSaved({required this.club, required this.distanceYds});

  final GolfClub club;
  final double distanceYds;

  @override
  List<Object?> get props => [club, distanceYds];
}

class BagClubRemoved extends MyBagEvent {
  const BagClubRemoved(this.club);

  final GolfClub club;

  @override
  List<Object?> get props => [club];
}
