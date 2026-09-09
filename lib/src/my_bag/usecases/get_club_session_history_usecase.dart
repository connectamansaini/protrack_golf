import 'dart:math' as math;

import 'package:dartz/dartz.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/my_bag/entities/club_session_summary.dart';
import 'package:protrack_golf/src/my_bag/helpers/my_bag_failure.dart';
import 'package:protrack_golf/src/sessions/sessions.dart';

/// Lists every practice session in which a given club was hit, oldest to
/// newest, with that session's shot count and average/best distance for the
/// club. The progress feature's `ClubTrend` already carries per-session
/// averages for the chart; this adds the per-session best the detail list
/// needs.
class GetClubSessionHistoryUsecase {
  GetClubSessionHistoryUsecase(this._sessionsRepository);

  final ISessionsRepository _sessionsRepository;

  Future<Either<MyBagFailure, List<ClubSessionSummary>>> call(
    GolfClub club,
  ) async {
    final result = await _sessionsRepository.getSessions();
    return result.fold(
      (failure) => Left(MyBagFailure(failure.message)),
      (sessions) => Right(_computeHistory(club, sessions)),
    );
  }

  List<ClubSessionSummary> _computeHistory(
    GolfClub club,
    List<PracticeSession> sessions,
  ) {
    final oldestFirst = [...sessions]..sort((a, b) => a.date.compareTo(b.date));
    return [
      for (final session in oldestFirst)
        for (final entry in session.clubEntries)
          if (entry.club == club && entry.distances.isNotEmpty)
            ClubSessionSummary(
              date: session.date,
              sessionId: session.id,
              shots: entry.distances.length,
              averageYds: entry.averageDistance,
              bestYds: entry.distances.reduce(math.max),
            ),
    ];
  }
}
