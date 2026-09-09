import 'dart:math' as math;

import 'package:dartz/dartz.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/my_bag/entities/bag_club.dart';
import 'package:protrack_golf/src/my_bag/entities/club_distance_record.dart';
import 'package:protrack_golf/src/my_bag/helpers/my_bag_failure.dart';
import 'package:protrack_golf/src/my_bag/my_bag_repository.dart';
import 'package:protrack_golf/src/sessions/sessions.dart';

/// Builds a golfer's personal yardage chart by flattening every `ClubEntry`
/// across all logged practice sessions and grouping by club, then merging in
/// the clubs the golfer has added to their bag by hand. Depends directly on
/// the sessions feature's repository interface, per the architecture's
/// cross-feature rule - all aggregation happens here in the domain layer,
/// never in a widget.
///
/// The result is the union of clubs in the bag and clubs with at least one
/// logged distance, sorted in bag order (Driver -> woods -> irons -> wedges
/// -> putter, i.e. `GolfClub.values` order). A club in the bag with no
/// session data still appears, with zeros for the computed stats.
class GetClubDistanceRecordsUsecase {
  GetClubDistanceRecordsUsecase(
    this._sessionsRepository,
    this._myBagRepository,
  );

  final ISessionsRepository _sessionsRepository;
  final IMyBagRepository _myBagRepository;

  Future<Either<MyBagFailure, List<ClubDistanceRecord>>> call() async {
    final sessionsResult = await _sessionsRepository.getSessions();
    return sessionsResult.fold(
      (failure) => Left(MyBagFailure(failure.message)),
      (sessions) async {
        final bagResult = await _myBagRepository.getBagClubs();
        return bagResult.fold(
          Left.new,
          (bagClubs) => Right(_computeRecords(sessions, bagClubs)),
        );
      },
    );
  }

  List<ClubDistanceRecord> _computeRecords(
    List<PracticeSession> sessions,
    List<BagClub> bagClubs,
  ) {
    // The repository returns sessions newest-first; make that explicit so
    // "latest" is well-defined even if that ordering ever changes.
    final newestFirst = [...sessions]..sort((a, b) => b.date.compareTo(a.date));

    final records = <GolfClub, ClubDistanceRecord>{};
    final totals = <GolfClub, double>{};
    for (final session in newestFirst) {
      for (final entry in session.clubEntries) {
        if (entry.distances.isEmpty) continue;
        final existing = records[entry.club];
        final entryBest = entry.distances.reduce(math.max);
        final entryTotal = entry.distances.reduce((a, b) => a + b);
        totals[entry.club] = (totals[entry.club] ?? 0) + entryTotal;
        records[entry.club] = existing == null
            ? ClubDistanceRecord(
                club: entry.club,
                bestYds: entryBest,
                latestYds: entry.averageDistance,
                shotCount: entry.distances.length,
                sessionCount: 1,
              )
            : existing.copyWith(
                bestYds: math.max(existing.bestYds, entryBest),
                shotCount: existing.shotCount + entry.distances.length,
                sessionCount: existing.sessionCount + 1,
              );
      }
    }

    final bagByClub = {for (final bagClub in bagClubs) bagClub.club: bagClub};

    return [
      for (final club in GolfClub.values)
        if (records[club] case final record?)
          record.copyWith(
            averageYds: totals[club]! / record.shotCount,
            inBag: bagByClub.containsKey(club),
            manualDistanceYds: bagByClub[club]?.distanceYds ?? 0,
          )
        else if (bagByClub[club] case final bagClub?)
          ClubDistanceRecord(
            club: club,
            inBag: true,
            manualDistanceYds: bagClub.distanceYds,
          ),
    ];
  }
}
