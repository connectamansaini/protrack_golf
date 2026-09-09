part of 'club_detail_bloc.dart';

class ClubDetailState extends Equatable {
  const ClubDetailState({
    this.status = const MyBagStatus.initial(),
    this.club = GolfClub.driver,
    this.record = ClubDistanceRecord.empty,
    this.trend = ClubTrend.empty,
    this.history = const [],
  });

  final MyBagStatus status;
  final GolfClub club;
  final ClubDistanceRecord record;
  final ClubTrend trend;
  final List<ClubSessionSummary> history;

  ClubDetailState copyWith({
    MyBagStatus? status,
    GolfClub? club,
    ClubDistanceRecord? record,
    ClubTrend? trend,
    List<ClubSessionSummary>? history,
  }) {
    return ClubDetailState(
      status: status ?? this.status,
      club: club ?? this.club,
      record: record ?? this.record,
      trend: trend ?? this.trend,
      history: history ?? this.history,
    );
  }

  @override
  List<Object?> get props => [status, club, record, trend, history];
}
