import 'package:dartz/dartz.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/progress/entities/club_trend.dart';
import 'package:protrack_golf/src/progress/entities/trend_point.dart';
import 'package:protrack_golf/src/progress/helpers/progress_failure.dart';
import 'package:protrack_golf/src/sessions/sessions.dart';

/// Computes each club's average-distance trend across a golfer's logged
/// practice sessions. Depends directly on the sessions feature's
/// repository interface, per the architecture's cross-feature rule - all
/// aggregation happens here in the domain layer, never in a widget.
class GetClubTrendsUsecase {
  GetClubTrendsUsecase(this._sessionsRepository);

  final ISessionsRepository _sessionsRepository;

  Future<Either<ProgressFailure, List<ClubTrend>>> call() async {
    final result = await _sessionsRepository.getSessions();
    return result.fold(
      (failure) => Left(ProgressFailure(failure.message)),
      (sessions) => Right(_computeTrends(sessions)),
    );
  }

  List<ClubTrend> _computeTrends(List<PracticeSession> sessions) {
    final sorted = [...sessions]..sort((a, b) => a.date.compareTo(b.date));
    final byClub = <GolfClub, List<TrendPoint>>{};
    for (final session in sorted) {
      for (final entry in session.clubEntries) {
        if (entry.distances.isEmpty) continue;
        byClub
            .putIfAbsent(entry.club, () => [])
            .add(
              TrendPoint(
                date: session.date,
                averageDistance: entry.averageDistance,
              ),
            );
      }
    }
    final trends =
        byClub.entries
            .map((entry) => ClubTrend(club: entry.key, dataPoints: entry.value))
            .toList()
          ..sort((a, b) => a.club.index.compareTo(b.club.index));
    return trends;
  }
}
