// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shot_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShotLog {

 DateTime get timestamp; int get shotIndex; GolfClub get club; ContactQuality get contact; ShotDirection get direction; TargetOutcome get outcome; double get carryDistanceYds; double get dispersionXYds; double get dispersionYYds;
/// Create a copy of ShotLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShotLogCopyWith<ShotLog> get copyWith => _$ShotLogCopyWithImpl<ShotLog>(this as ShotLog, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ShotLog;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShotLog&&(identical(other.timestamp, _this.timestamp) || other.timestamp == _this.timestamp)&&(identical(other.shotIndex, _this.shotIndex) || other.shotIndex == _this.shotIndex)&&(identical(other.club, _this.club) || other.club == _this.club)&&(identical(other.contact, _this.contact) || other.contact == _this.contact)&&(identical(other.direction, _this.direction) || other.direction == _this.direction)&&(identical(other.outcome, _this.outcome) || other.outcome == _this.outcome)&&(identical(other.carryDistanceYds, _this.carryDistanceYds) || other.carryDistanceYds == _this.carryDistanceYds)&&(identical(other.dispersionXYds, _this.dispersionXYds) || other.dispersionXYds == _this.dispersionXYds)&&(identical(other.dispersionYYds, _this.dispersionYYds) || other.dispersionYYds == _this.dispersionYYds));
}


@override
int get hashCode {
  final _this = this as ShotLog;
  return Object.hash(runtimeType,_this.timestamp,_this.shotIndex,_this.club,_this.contact,_this.direction,_this.outcome,_this.carryDistanceYds,_this.dispersionXYds,_this.dispersionYYds);
}

@override
String toString() {
  final _this = this as ShotLog;
  return 'ShotLog(timestamp: ${_this.timestamp}, shotIndex: ${_this.shotIndex}, club: ${_this.club}, contact: ${_this.contact}, direction: ${_this.direction}, outcome: ${_this.outcome}, carryDistanceYds: ${_this.carryDistanceYds}, dispersionXYds: ${_this.dispersionXYds}, dispersionYYds: ${_this.dispersionYYds})';
}


}

/// @nodoc
abstract mixin class $ShotLogCopyWith<$Res>  {
  factory $ShotLogCopyWith(ShotLog value, $Res Function(ShotLog) _then) = _$ShotLogCopyWithImpl;
@useResult
$Res call({
 DateTime timestamp, int shotIndex, GolfClub club, ContactQuality contact, ShotDirection direction, TargetOutcome outcome, double carryDistanceYds, double dispersionXYds, double dispersionYYds
});




}
/// @nodoc
class _$ShotLogCopyWithImpl<$Res>
    implements $ShotLogCopyWith<$Res> {
  _$ShotLogCopyWithImpl(this._self, this._then);

  final ShotLog _self;
  final $Res Function(ShotLog) _then;

/// Create a copy of ShotLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timestamp = null,Object? shotIndex = null,Object? club = null,Object? contact = null,Object? direction = null,Object? outcome = null,Object? carryDistanceYds = null,Object? dispersionXYds = null,Object? dispersionYYds = null,}) {
  return _then(ShotLog(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,shotIndex: null == shotIndex ? _self.shotIndex : shotIndex // ignore: cast_nullable_to_non_nullable
as int,club: null == club ? _self.club : club // ignore: cast_nullable_to_non_nullable
as GolfClub,contact: null == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as ContactQuality,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as ShotDirection,outcome: null == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as TargetOutcome,carryDistanceYds: null == carryDistanceYds ? _self.carryDistanceYds : carryDistanceYds // ignore: cast_nullable_to_non_nullable
as double,dispersionXYds: null == dispersionXYds ? _self.dispersionXYds : dispersionXYds // ignore: cast_nullable_to_non_nullable
as double,dispersionYYds: null == dispersionYYds ? _self.dispersionYYds : dispersionYYds // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ShotLog].
extension ShotLogPatterns on ShotLog {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShotLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShotLog() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShotLog value)  $default,){
final _that = this;
switch (_that) {
case _ShotLog():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShotLog value)?  $default,){
final _that = this;
switch (_that) {
case _ShotLog() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime timestamp,  int shotIndex,  GolfClub club,  ContactQuality contact,  ShotDirection direction,  TargetOutcome outcome,  double carryDistanceYds,  double dispersionXYds,  double dispersionYYds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShotLog() when $default != null:
return $default(_that.timestamp,_that.shotIndex,_that.club,_that.contact,_that.direction,_that.outcome,_that.carryDistanceYds,_that.dispersionXYds,_that.dispersionYYds);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime timestamp,  int shotIndex,  GolfClub club,  ContactQuality contact,  ShotDirection direction,  TargetOutcome outcome,  double carryDistanceYds,  double dispersionXYds,  double dispersionYYds)  $default,) {final _that = this;
switch (_that) {
case _ShotLog():
return $default(_that.timestamp,_that.shotIndex,_that.club,_that.contact,_that.direction,_that.outcome,_that.carryDistanceYds,_that.dispersionXYds,_that.dispersionYYds);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime timestamp,  int shotIndex,  GolfClub club,  ContactQuality contact,  ShotDirection direction,  TargetOutcome outcome,  double carryDistanceYds,  double dispersionXYds,  double dispersionYYds)?  $default,) {final _that = this;
switch (_that) {
case _ShotLog() when $default != null:
return $default(_that.timestamp,_that.shotIndex,_that.club,_that.contact,_that.direction,_that.outcome,_that.carryDistanceYds,_that.dispersionXYds,_that.dispersionYYds);case _:
  return null;

}
}

}

/// @nodoc


class _ShotLog extends ShotLog {
  const _ShotLog({required this.timestamp, this.shotIndex = 0, this.club = GolfClub.driver, this.contact = ContactQuality.crisp, this.direction = ShotDirection.straight, this.outcome = TargetOutcome.hitTarget, this.carryDistanceYds = 0, this.dispersionXYds = 0, this.dispersionYYds = 0}): super._();
  

@override final  DateTime timestamp;
@override@JsonKey() final  int shotIndex;
@override@JsonKey() final  GolfClub club;
@override@JsonKey() final  ContactQuality contact;
@override@JsonKey() final  ShotDirection direction;
@override@JsonKey() final  TargetOutcome outcome;
@override@JsonKey() final  double carryDistanceYds;
@override@JsonKey() final  double dispersionXYds;
@override@JsonKey() final  double dispersionYYds;

/// Create a copy of ShotLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShotLogCopyWith<_ShotLog> get copyWith => __$ShotLogCopyWithImpl<_ShotLog>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShotLog&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.shotIndex, shotIndex) || other.shotIndex == shotIndex)&&(identical(other.club, club) || other.club == club)&&(identical(other.contact, contact) || other.contact == contact)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.outcome, outcome) || other.outcome == outcome)&&(identical(other.carryDistanceYds, carryDistanceYds) || other.carryDistanceYds == carryDistanceYds)&&(identical(other.dispersionXYds, dispersionXYds) || other.dispersionXYds == dispersionXYds)&&(identical(other.dispersionYYds, dispersionYYds) || other.dispersionYYds == dispersionYYds));
}


@override
int get hashCode {
    return Object.hash(runtimeType,timestamp,shotIndex,club,contact,direction,outcome,carryDistanceYds,dispersionXYds,dispersionYYds);
}

@override
String toString() {
    return 'ShotLog(timestamp: $timestamp, shotIndex: $shotIndex, club: $club, contact: $contact, direction: $direction, outcome: $outcome, carryDistanceYds: $carryDistanceYds, dispersionXYds: $dispersionXYds, dispersionYYds: $dispersionYYds)';
}


}

/// @nodoc
abstract mixin class _$ShotLogCopyWith<$Res> implements $ShotLogCopyWith<$Res> {
  factory _$ShotLogCopyWith(_ShotLog value, $Res Function(_ShotLog) _then) = __$ShotLogCopyWithImpl;
@override @useResult
$Res call({
 DateTime timestamp, int shotIndex, GolfClub club, ContactQuality contact, ShotDirection direction, TargetOutcome outcome, double carryDistanceYds, double dispersionXYds, double dispersionYYds
});




}
/// @nodoc
class __$ShotLogCopyWithImpl<$Res>
    implements _$ShotLogCopyWith<$Res> {
  __$ShotLogCopyWithImpl(this._self, this._then);

  final _ShotLog _self;
  final $Res Function(_ShotLog) _then;

/// Create a copy of ShotLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timestamp = null,Object? shotIndex = null,Object? club = null,Object? contact = null,Object? direction = null,Object? outcome = null,Object? carryDistanceYds = null,Object? dispersionXYds = null,Object? dispersionYYds = null,}) {
  return _then(_ShotLog(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,shotIndex: null == shotIndex ? _self.shotIndex : shotIndex // ignore: cast_nullable_to_non_nullable
as int,club: null == club ? _self.club : club // ignore: cast_nullable_to_non_nullable
as GolfClub,contact: null == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as ContactQuality,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as ShotDirection,outcome: null == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as TargetOutcome,carryDistanceYds: null == carryDistanceYds ? _self.carryDistanceYds : carryDistanceYds // ignore: cast_nullable_to_non_nullable
as double,dispersionXYds: null == dispersionXYds ? _self.dispersionXYds : dispersionXYds // ignore: cast_nullable_to_non_nullable
as double,dispersionYYds: null == dispersionYYds ? _self.dispersionYYds : dispersionYYds // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
