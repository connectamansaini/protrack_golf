import 'package:dartz/dartz.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/my_bag/my_bag.dart';

/// In-memory `IMyBagRepository` for usecase tests. Mirrors the real
/// repository's contract: one entry per club, returned in bag order, and
/// saving an existing club replaces it.
class FakeMyBagRepository implements IMyBagRepository {
  FakeMyBagRepository([List<BagClub> bagClubs = const []])
    : _byClub = {for (final bagClub in bagClubs) bagClub.club: bagClub};

  final Map<GolfClub, BagClub> _byClub;

  @override
  Future<Either<MyBagFailure, List<BagClub>>> getBagClubs() async {
    final sorted = [..._byClub.values]
      ..sort((a, b) => a.club.index.compareTo(b.club.index));
    return Right(sorted);
  }

  @override
  Future<Either<MyBagFailure, BagClub>> saveBagClub(BagClub bagClub) async {
    _byClub[bagClub.club] = bagClub;
    return Right(bagClub);
  }

  @override
  Future<Either<MyBagFailure, Unit>> removeBagClub(GolfClub club) async {
    _byClub.remove(club);
    return const Right(unit);
  }
}
