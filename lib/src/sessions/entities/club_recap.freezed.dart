// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'club_recap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClubRecap {

 GolfClub get club; int get shots; double get averageYds; double get bestYds; double get deltaVsPreviousYds; bool get hasPrevious;
/// Create a copy of ClubRecap
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClubRecapCopyWith<ClubRecap> get copyWith => _$ClubRecapCopyWithImpl<ClubRecap>(this as ClubRecap, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ClubRecap;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClubRecap&&(identical(other.club, _this.club) || other.club == _this.club)&&(identical(other.shots, _this.shots) || other.shots == _this.shots)&&(identical(other.averageYds, _this.averageYds) || other.averageYds == _this.averageYds)&&(identical(other.bestYds, _this.bestYds) || other.bestYds == _this.bestYds)&&(identical(other.deltaVsPreviousYds, _this.deltaVsPreviousYds) || other.deltaVsPreviousYds == _this.deltaVsPreviousYds)&&(identical(other.hasPrevious, _this.hasPrevious) || other.hasPrevious == _this.hasPrevious));
}


@override
int get hashCode {
  final _this = this as ClubRecap;
  return Object.hash(runtimeType,_this.club,_this.shots,_this.averageYds,_this.bestYds,_this.deltaVsPreviousYds,_this.hasPrevious);
}

@override
String toString() {
  final _this = this as ClubRecap;
  return 'ClubRecap(club: ${_this.club}, shots: ${_this.shots}, averageYds: ${_this.averageYds}, bestYds: ${_this.bestYds}, deltaVsPreviousYds: ${_this.deltaVsPreviousYds}, hasPrevious: ${_this.hasPrevious})';
}


}

/// @nodoc
abstract mixin class $ClubRecapCopyWith<$Res>  {
  factory $ClubRecapCopyWith(ClubRecap value, $Res Function(ClubRecap) _then) = _$ClubRecapCopyWithImpl;
@useResult
$Res call({
 GolfClub club, int shots, double averageYds, double bestYds, double deltaVsPreviousYds, bool hasPrevious
});




}
/// @nodoc
class _$ClubRecapCopyWithImpl<$Res>
    implements $ClubRecapCopyWith<$Res> {
  _$ClubRecapCopyWithImpl(this._self, this._then);

  final ClubRecap _self;
  final $Res Function(ClubRecap) _then;

/// Create a copy of ClubRecap
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? club = null,Object? shots = null,Object? averageYds = null,Object? bestYds = null,Object? deltaVsPreviousYds = null,Object? hasPrevious = null,}) {
  return _then(ClubRecap(
club: null == club ? _self.club : club // ignore: cast_nullable_to_non_nullable
as GolfClub,shots: null == shots ? _self.shots : shots // ignore: cast_nullable_to_non_nullable
as int,averageYds: null == averageYds ? _self.averageYds : averageYds // ignore: cast_nullable_to_non_nullable
as double,bestYds: null == bestYds ? _self.bestYds : bestYds // ignore: cast_nullable_to_non_nullable
as double,deltaVsPreviousYds: null == deltaVsPreviousYds ? _self.deltaVsPreviousYds : deltaVsPreviousYds // ignore: cast_nullable_to_non_nullable
as double,hasPrevious: null == hasPrevious ? _self.hasPrevious : hasPrevious // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ClubRecap].
extension ClubRecapPatterns on ClubRecap {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClubRecap value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClubRecap() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClubRecap value)  $default,){
final _that = this;
switch (_that) {
case _ClubRecap():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClubRecap value)?  $default,){
final _that = this;
switch (_that) {
case _ClubRecap() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GolfClub club,  int shots,  double averageYds,  double bestYds,  double deltaVsPreviousYds,  bool hasPrevious)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClubRecap() when $default != null:
return $default(_that.club,_that.shots,_that.averageYds,_that.bestYds,_that.deltaVsPreviousYds,_that.hasPrevious);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GolfClub club,  int shots,  double averageYds,  double bestYds,  double deltaVsPreviousYds,  bool hasPrevious)  $default,) {final _that = this;
switch (_that) {
case _ClubRecap():
return $default(_that.club,_that.shots,_that.averageYds,_that.bestYds,_that.deltaVsPreviousYds,_that.hasPrevious);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GolfClub club,  int shots,  double averageYds,  double bestYds,  double deltaVsPreviousYds,  bool hasPrevious)?  $default,) {final _that = this;
switch (_that) {
case _ClubRecap() when $default != null:
return $default(_that.club,_that.shots,_that.averageYds,_that.bestYds,_that.deltaVsPreviousYds,_that.hasPrevious);case _:
  return null;

}
}

}

/// @nodoc


class _ClubRecap extends ClubRecap {
  const _ClubRecap({this.club = GolfClub.driver, this.shots = 0, this.averageYds = 0, this.bestYds = 0, this.deltaVsPreviousYds = 0, this.hasPrevious = false}): super._();
  

@override@JsonKey() final  GolfClub club;
@override@JsonKey() final  int shots;
@override@JsonKey() final  double averageYds;
@override@JsonKey() final  double bestYds;
@override@JsonKey() final  double deltaVsPreviousYds;
@override@JsonKey() final  bool hasPrevious;

/// Create a copy of ClubRecap
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClubRecapCopyWith<_ClubRecap> get copyWith => __$ClubRecapCopyWithImpl<_ClubRecap>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClubRecap&&(identical(other.club, club) || other.club == club)&&(identical(other.shots, shots) || other.shots == shots)&&(identical(other.averageYds, averageYds) || other.averageYds == averageYds)&&(identical(other.bestYds, bestYds) || other.bestYds == bestYds)&&(identical(other.deltaVsPreviousYds, deltaVsPreviousYds) || other.deltaVsPreviousYds == deltaVsPreviousYds)&&(identical(other.hasPrevious, hasPrevious) || other.hasPrevious == hasPrevious));
}


@override
int get hashCode {
    return Object.hash(runtimeType,club,shots,averageYds,bestYds,deltaVsPreviousYds,hasPrevious);
}

@override
String toString() {
    return 'ClubRecap(club: $club, shots: $shots, averageYds: $averageYds, bestYds: $bestYds, deltaVsPreviousYds: $deltaVsPreviousYds, hasPrevious: $hasPrevious)';
}


}

/// @nodoc
abstract mixin class _$ClubRecapCopyWith<$Res> implements $ClubRecapCopyWith<$Res> {
  factory _$ClubRecapCopyWith(_ClubRecap value, $Res Function(_ClubRecap) _then) = __$ClubRecapCopyWithImpl;
@override @useResult
$Res call({
 GolfClub club, int shots, double averageYds, double bestYds, double deltaVsPreviousYds, bool hasPrevious
});




}
/// @nodoc
class __$ClubRecapCopyWithImpl<$Res>
    implements _$ClubRecapCopyWith<$Res> {
  __$ClubRecapCopyWithImpl(this._self, this._then);

  final _ClubRecap _self;
  final $Res Function(_ClubRecap) _then;

/// Create a copy of ClubRecap
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? club = null,Object? shots = null,Object? averageYds = null,Object? bestYds = null,Object? deltaVsPreviousYds = null,Object? hasPrevious = null,}) {
  return _then(_ClubRecap(
club: null == club ? _self.club : club // ignore: cast_nullable_to_non_nullable
as GolfClub,shots: null == shots ? _self.shots : shots // ignore: cast_nullable_to_non_nullable
as int,averageYds: null == averageYds ? _self.averageYds : averageYds // ignore: cast_nullable_to_non_nullable
as double,bestYds: null == bestYds ? _self.bestYds : bestYds // ignore: cast_nullable_to_non_nullable
as double,deltaVsPreviousYds: null == deltaVsPreviousYds ? _self.deltaVsPreviousYds : deltaVsPreviousYds // ignore: cast_nullable_to_non_nullable
as double,hasPrevious: null == hasPrevious ? _self.hasPrevious : hasPrevious // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
