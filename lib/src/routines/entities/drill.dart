import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:protrack_golf/core/core.dart';

part 'drill.freezed.dart';

/// A single drill instruction within a `RoutinePhase` - e.g. a gate drill,
/// a target call-out, or a tempo focus cue.
@freezed
abstract class Drill with _$Drill {
  const factory Drill({
    @Default('') String title,
    @Default('') String instructions,
    @Default(0) int shotCount,
    GolfClub? suggestedClub,
  }) = _Drill;

  const Drill._();

  static const empty = Drill();
}
