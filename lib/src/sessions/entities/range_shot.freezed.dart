// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'range_shot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RangeShot {

 GolfClub get club; double get distanceYds; ShotIntent get intent;
/// Create a copy of RangeShot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RangeShotCopyWith<RangeShot> get copyWith => _$RangeShotCopyWithImpl<RangeShot>(this as RangeShot, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RangeShot;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RangeShot&&(identical(other.club, _this.club) || other.club == _this.club)&&(identical(other.distanceYds, _this.distanceYds) || other.distanceYds == _this.distanceYds)&&(identical(other.intent, _this.intent) || other.intent == _this.intent));
}


@override
int get hashCode {
  final _this = this as RangeShot;
  return Object.hash(runtimeType,_this.club,_this.distanceYds,_this.intent);
}

@override
String toString() {
  final _this = this as RangeShot;
  return 'RangeShot(club: ${_this.club}, distanceYds: ${_this.distanceYds}, intent: ${_this.intent})';
}


}

/// @nodoc
abstract mixin class $RangeShotCopyWith<$Res>  {
  factory $RangeShotCopyWith(RangeShot value, $Res Function(RangeShot) _then) = _$RangeShotCopyWithImpl;
@useResult
$Res call({
 GolfClub club, double distanceYds, ShotIntent intent
});




}
/// @nodoc
class _$RangeShotCopyWithImpl<$Res>
    implements $RangeShotCopyWith<$Res> {
  _$RangeShotCopyWithImpl(this._self, this._then);

  final RangeShot _self;
  final $Res Function(RangeShot) _then;

/// Create a copy of RangeShot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? club = null,Object? distanceYds = null,Object? intent = null,}) {
  return _then(RangeShot(
club: null == club ? _self.club : club // ignore: cast_nullable_to_non_nullable
as GolfClub,distanceYds: null == distanceYds ? _self.distanceYds : distanceYds // ignore: cast_nullable_to_non_nullable
as double,intent: null == intent ? _self.intent : intent // ignore: cast_nullable_to_non_nullable
as ShotIntent,
  ));
}

}


/// Adds pattern-matching-related methods to [RangeShot].
extension RangeShotPatterns on RangeShot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RangeShot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RangeShot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RangeShot value)  $default,){
final _that = this;
switch (_that) {
case _RangeShot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RangeShot value)?  $default,){
final _that = this;
switch (_that) {
case _RangeShot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GolfClub club,  double distanceYds,  ShotIntent intent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RangeShot() when $default != null:
return $default(_that.club,_that.distanceYds,_that.intent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GolfClub club,  double distanceYds,  ShotIntent intent)  $default,) {final _that = this;
switch (_that) {
case _RangeShot():
return $default(_that.club,_that.distanceYds,_that.intent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GolfClub club,  double distanceYds,  ShotIntent intent)?  $default,) {final _that = this;
switch (_that) {
case _RangeShot() when $default != null:
return $default(_that.club,_that.distanceYds,_that.intent);case _:
  return null;

}
}

}

/// @nodoc


class _RangeShot extends RangeShot {
  const _RangeShot({this.club = GolfClub.driver, this.distanceYds = 0, this.intent = ShotIntent.full}): super._();
  

@override@JsonKey() final  GolfClub club;
@override@JsonKey() final  double distanceYds;
@override@JsonKey() final  ShotIntent intent;

/// Create a copy of RangeShot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RangeShotCopyWith<_RangeShot> get copyWith => __$RangeShotCopyWithImpl<_RangeShot>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RangeShot&&(identical(other.club, club) || other.club == club)&&(identical(other.distanceYds, distanceYds) || other.distanceYds == distanceYds)&&(identical(other.intent, intent) || other.intent == intent));
}


@override
int get hashCode {
    return Object.hash(runtimeType,club,distanceYds,intent);
}

@override
String toString() {
    return 'RangeShot(club: $club, distanceYds: $distanceYds, intent: $intent)';
}


}

/// @nodoc
abstract mixin class _$RangeShotCopyWith<$Res> implements $RangeShotCopyWith<$Res> {
  factory _$RangeShotCopyWith(_RangeShot value, $Res Function(_RangeShot) _then) = __$RangeShotCopyWithImpl;
@override @useResult
$Res call({
 GolfClub club, double distanceYds, ShotIntent intent
});




}
/// @nodoc
class __$RangeShotCopyWithImpl<$Res>
    implements _$RangeShotCopyWith<$Res> {
  __$RangeShotCopyWithImpl(this._self, this._then);

  final _RangeShot _self;
  final $Res Function(_RangeShot) _then;

/// Create a copy of RangeShot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? club = null,Object? distanceYds = null,Object? intent = null,}) {
  return _then(_RangeShot(
club: null == club ? _self.club : club // ignore: cast_nullable_to_non_nullable
as GolfClub,distanceYds: null == distanceYds ? _self.distanceYds : distanceYds // ignore: cast_nullable_to_non_nullable
as double,intent: null == intent ? _self.intent : intent // ignore: cast_nullable_to_non_nullable
as ShotIntent,
  ));
}


}

// dart format on
