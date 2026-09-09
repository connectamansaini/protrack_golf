part of 'my_bag_bloc.dart';

class MyBagState extends Equatable {
  const MyBagState({
    this.status = const MyBagStatus.initial(),
    this.records = const [],
  });

  final MyBagStatus status;
  final List<ClubDistanceRecord> records;

  /// Clubs the golfer has added to their bag by hand.
  Set<GolfClub> get clubsInBag => {
    for (final record in records)
      if (record.inBag) record.club,
  };

  /// Categories with at least one club in the bag, for the bag illustration.
  /// The hybrid is reported separately via [hasHybrid] (it gets its own
  /// head) so it doesn't light up the Woods group by itself.
  Set<ClubCategory> get ownedCategories => {
    for (final club in clubsInBag)
      if (club != GolfClub.hybrid) club.category,
  };

  bool get hasHybrid => clubsInBag.contains(GolfClub.hybrid);

  /// Clubs with at least one range shot behind their numbers.
  int get clubsWithRangeData =>
      records.where((record) => record.hasSessionData).length;

  /// Records grouped by club category, in bag order, skipping empty groups.
  Map<ClubCategory, List<ClubDistanceRecord>> get recordsByCategory => {
    for (final category in ClubCategory.values)
      if (records.where((r) => r.club.category == category).toList()
          case final group when group.isNotEmpty)
        category: group,
  };

  MyBagState copyWith({
    MyBagStatus? status,
    List<ClubDistanceRecord>? records,
  }) {
    return MyBagState(
      status: status ?? this.status,
      records: records ?? this.records,
    );
  }

  @override
  List<Object?> get props => [status, records];
}
