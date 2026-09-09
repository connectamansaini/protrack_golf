// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'club_distance_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClubDistanceRecord {

 GolfClub get club; double get averageYds; double get bestYds; double get latestYds; int get shotCount; int get sessionCount; bool get inBag; double get manualDistanceYds;
/// Create a copy of ClubDistanceRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClubDistanceRecordCopyWith<ClubDistanceRecord> get copyWith => _$ClubDistanceRecordCopyWithImpl<ClubDistanceRecord>(this as ClubDistanceRecord, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ClubDistanceRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClubDistanceRecord&&(identical(other.club, _this.club) || other.club == _this.club)&&(identical(other.averageYds, _this.averageYds) || other.averageYds == _this.averageYds)&&(identical(other.bestYds, _this.bestYds) || other.bestYds == _this.bestYds)&&(identical(other.latestYds, _this.latestYds) || other.latestYds == _this.latestYds)&&(identical(other.shotCount, _this.shotCount) || other.shotCount == _this.shotCount)&&(identical(other.sessionCount, _this.sessionCount) || other.sessionCount == _this.sessionCount)&&(identical(other.inBag, _this.inBag) || other.inBag == _this.inBag)&&(identical(other.manualDistanceYds, _this.manualDistanceYds) || other.manualDistanceYds == _this.manualDistanceYds));
}


@override
int get hashCode {
  final _this = this as ClubDistanceRecord;
  return Object.hash(runtimeType,_this.club,_this.averageYds,_this.bestYds,_this.latestYds,_this.shotCount,_this.sessionCount,_this.inBag,_this.manualDistanceYds);
}

@override
String toString() {
  final _this = this as ClubDistanceRecord;
  return 'ClubDistanceRecord(club: ${_this.club}, averageYds: ${_this.averageYds}, bestYds: ${_this.bestYds}, latestYds: ${_this.latestYds}, shotCount: ${_this.shotCount}, sessionCount: ${_this.sessionCount}, inBag: ${_this.inBag}, manualDistanceYds: ${_this.manualDistanceYds})';
}


}

/// @nodoc
abstract mixin class $ClubDistanceRecordCopyWith<$Res>  {
  factory $ClubDistanceRecordCopyWith(ClubDistanceRecord value, $Res Function(ClubDistanceRecord) _then) = _$ClubDistanceRecordCopyWithImpl;
@useResult
$Res call({
 GolfClub club, double averageYds, double bestYds, double latestYds, int shotCount, int sessionCount, bool inBag, double manualDistanceYds
});




}
/// @nodoc
class _$ClubDistanceRecordCopyWithImpl<$Res>
    implements $ClubDistanceRecordCopyWith<$Res> {
  _$ClubDistanceRecordCopyWithImpl(this._self, this._then);

  final ClubDistanceRecord _self;
  final $Res Function(ClubDistanceRecord) _then;

/// Create a copy of ClubDistanceRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? club = null,Object? averageYds = null,Object? bestYds = null,Object? latestYds = null,Object? shotCount = null,Object? sessionCount = null,Object? inBag = null,Object? manualDistanceYds = null,}) {
  return _then(ClubDistanceRecord(
club: null == club ? _self.club : club // ignore: cast_nullable_to_non_nullable
as GolfClub,averageYds: null == averageYds ? _self.averageYds : averageYds // ignore: cast_nullable_to_non_nullable
as double,bestYds: null == bestYds ? _self.bestYds : bestYds // ignore: cast_nullable_to_non_nullable
as double,latestYds: null == latestYds ? _self.latestYds : latestYds // ignore: cast_nullable_to_non_nullable
as double,shotCount: null == shotCount ? _self.shotCount : shotCount // ignore: cast_nullable_to_non_nullable
as int,sessionCount: null == sessionCount ? _self.sessionCount : sessionCount // ignore: cast_nullable_to_non_nullable
as int,inBag: null == inBag ? _self.inBag : inBag // ignore: cast_nullable_to_non_nullable
as bool,manualDistanceYds: null == manualDistanceYds ? _self.manualDistanceYds : manualDistanceYds // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ClubDistanceRecord].
extension ClubDistanceRecordPatterns on ClubDistanceRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClubDistanceRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClubDistanceRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClubDistanceRecord value)  $default,){
final _that = this;
switch (_that) {
case _ClubDistanceRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClubDistanceRecord value)?  $default,){
final _that = this;
switch (_that) {
case _ClubDistanceRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GolfClub club,  double averageYds,  double bestYds,  double latestYds,  int shotCount,  int sessionCount,  bool inBag,  double manualDistanceYds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClubDistanceRecord() when $default != null:
return $default(_that.club,_that.averageYds,_that.bestYds,_that.latestYds,_that.shotCount,_that.sessionCount,_that.inBag,_that.manualDistanceYds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GolfClub club,  double averageYds,  double bestYds,  double latestYds,  int shotCount,  int sessionCount,  bool inBag,  double manualDistanceYds)  $default,) {final _that = this;
switch (_that) {
case _ClubDistanceRecord():
return $default(_that.club,_that.averageYds,_that.bestYds,_that.latestYds,_that.shotCount,_that.sessionCount,_that.inBag,_that.manualDistanceYds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GolfClub club,  double averageYds,  double bestYds,  double latestYds,  int shotCount,  int sessionCount,  bool inBag,  double manualDistanceYds)?  $default,) {final _that = this;
switch (_that) {
case _ClubDistanceRecord() when $default != null:
return $default(_that.club,_that.averageYds,_that.bestYds,_that.latestYds,_that.shotCount,_that.sessionCount,_that.inBag,_that.manualDistanceYds);case _:
  return null;

}
}

}

/// @nodoc


class _ClubDistanceRecord extends ClubDistanceRecord {
  const _ClubDistanceRecord({this.club = GolfClub.driver, this.averageYds = 0, this.bestYds = 0, this.latestYds = 0, this.shotCount = 0, this.sessionCount = 0, this.inBag = false, this.manualDistanceYds = 0}): super._();
  

@override@JsonKey() final  GolfClub club;
@override@JsonKey() final  double averageYds;
@override@JsonKey() final  double bestYds;
@override@JsonKey() final  double latestYds;
@override@JsonKey() final  int shotCount;
@override@JsonKey() final  int sessionCount;
@override@JsonKey() final  bool inBag;
@override@JsonKey() final  double manualDistanceYds;

/// Create a copy of ClubDistanceRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClubDistanceRecordCopyWith<_ClubDistanceRecord> get copyWith => __$ClubDistanceRecordCopyWithImpl<_ClubDistanceRecord>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClubDistanceRecord&&(identical(other.club, club) || other.club == club)&&(identical(other.averageYds, averageYds) || other.averageYds == averageYds)&&(identical(other.bestYds, bestYds) || other.bestYds == bestYds)&&(identical(other.latestYds, latestYds) || other.latestYds == latestYds)&&(identical(other.shotCount, shotCount) || other.shotCount == shotCount)&&(identical(other.sessionCount, sessionCount) || other.sessionCount == sessionCount)&&(identical(other.inBag, inBag) || other.inBag == inBag)&&(identical(other.manualDistanceYds, manualDistanceYds) || other.manualDistanceYds == manualDistanceYds));
}


@override
int get hashCode {
    return Object.hash(runtimeType,club,averageYds,bestYds,latestYds,shotCount,sessionCount,inBag,manualDistanceYds);
}

@override
String toString() {
    return 'ClubDistanceRecord(club: $club, averageYds: $averageYds, bestYds: $bestYds, latestYds: $latestYds, shotCount: $shotCount, sessionCount: $sessionCount, inBag: $inBag, manualDistanceYds: $manualDistanceYds)';
}


}

/// @nodoc
abstract mixin class _$ClubDistanceRecordCopyWith<$Res> implements $ClubDistanceRecordCopyWith<$Res> {
  factory _$ClubDistanceRecordCopyWith(_ClubDistanceRecord value, $Res Function(_ClubDistanceRecord) _then) = __$ClubDistanceRecordCopyWithImpl;
@override @useResult
$Res call({
 GolfClub club, double averageYds, double bestYds, double latestYds, int shotCount, int sessionCount, bool inBag, double manualDistanceYds
});




}
/// @nodoc
class __$ClubDistanceRecordCopyWithImpl<$Res>
    implements _$ClubDistanceRecordCopyWith<$Res> {
  __$ClubDistanceRecordCopyWithImpl(this._self, this._then);

  final _ClubDistanceRecord _self;
  final $Res Function(_ClubDistanceRecord) _then;

/// Create a copy of ClubDistanceRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? club = null,Object? averageYds = null,Object? bestYds = null,Object? latestYds = null,Object? shotCount = null,Object? sessionCount = null,Object? inBag = null,Object? manualDistanceYds = null,}) {
  return _then(_ClubDistanceRecord(
club: null == club ? _self.club : club // ignore: cast_nullable_to_non_nullable
as GolfClub,averageYds: null == averageYds ? _self.averageYds : averageYds // ignore: cast_nullable_to_non_nullable
as double,bestYds: null == bestYds ? _self.bestYds : bestYds // ignore: cast_nullable_to_non_nullable
as double,latestYds: null == latestYds ? _self.latestYds : latestYds // ignore: cast_nullable_to_non_nullable
as double,shotCount: null == shotCount ? _self.shotCount : shotCount // ignore: cast_nullable_to_non_nullable
as int,sessionCount: null == sessionCount ? _self.sessionCount : sessionCount // ignore: cast_nullable_to_non_nullable
as int,inBag: null == inBag ? _self.inBag : inBag // ignore: cast_nullable_to_non_nullable
as bool,manualDistanceYds: null == manualDistanceYds ? _self.manualDistanceYds : manualDistanceYds // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
