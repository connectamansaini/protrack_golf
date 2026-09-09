import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';

/// A reusable practice location (e.g. a driving range), referenced by id
/// from practice sessions.
@freezed
abstract class Location with _$Location {
  const factory Location({
    @Default('') String id,
    @Default('') String name,
    @Default('') String notes,
  }) = _Location;

  const Location._();

  static const empty = Location();
}
