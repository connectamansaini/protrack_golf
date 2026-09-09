// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bag_club.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BagClub {

 DateTime get addedAt; GolfClub get club; double get distanceYds;
/// Create a copy of BagClub
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BagClubCopyWith<BagClub> get copyWith => _$BagClubCopyWithImpl<BagClub>(this as BagClub, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BagClub;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BagClub&&(identical(other.addedAt, _this.addedAt) || other.addedAt == _this.addedAt)&&(identical(other.club, _this.club) || other.club == _this.club)&&(identical(other.distanceYds, _this.distanceYds) || other.distanceYds == _this.distanceYds));
}


@override
int get hashCode {
  final _this = this as BagClub;
  return Object.hash(runtimeType,_this.addedAt,_this.club,_this.distanceYds);
}

@override
String toString() {
  final _this = this as BagClub;
  return 'BagClub(addedAt: ${_this.addedAt}, club: ${_this.club}, distanceYds: ${_this.distanceYds})';
}


}

/// @nodoc
abstract mixin class $BagClubCopyWith<$Res>  {
  factory $BagClubCopyWith(BagClub value, $Res Function(BagClub) _then) = _$BagClubCopyWithImpl;
@useResult
$Res call({
 DateTime addedAt, GolfClub club, double distanceYds
});




}
/// @nodoc
class _$BagClubCopyWithImpl<$Res>
    implements $BagClubCopyWith<$Res> {
  _$BagClubCopyWithImpl(this._self, this._then);

  final BagClub _self;
  final $Res Function(BagClub) _then;

/// Create a copy of BagClub
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? addedAt = null,Object? club = null,Object? distanceYds = null,}) {
  return _then(BagClub(
addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,club: null == club ? _self.club : club // ignore: cast_nullable_to_non_nullable
as GolfClub,distanceYds: null == distanceYds ? _self.distanceYds : distanceYds // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [BagClub].
extension BagClubPatterns on BagClub {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BagClub value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BagClub() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BagClub value)  $default,){
final _that = this;
switch (_that) {
case _BagClub():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BagClub value)?  $default,){
final _that = this;
switch (_that) {
case _BagClub() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime addedAt,  GolfClub club,  double distanceYds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BagClub() when $default != null:
return $default(_that.addedAt,_that.club,_that.distanceYds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime addedAt,  GolfClub club,  double distanceYds)  $default,) {final _that = this;
switch (_that) {
case _BagClub():
return $default(_that.addedAt,_that.club,_that.distanceYds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime addedAt,  GolfClub club,  double distanceYds)?  $default,) {final _that = this;
switch (_that) {
case _BagClub() when $default != null:
return $default(_that.addedAt,_that.club,_that.distanceYds);case _:
  return null;

}
}

}

/// @nodoc


class _BagClub extends BagClub {
  const _BagClub({required this.addedAt, this.club = GolfClub.driver, this.distanceYds = 0}): super._();
  

@override final  DateTime addedAt;
@override@JsonKey() final  GolfClub club;
@override@JsonKey() final  double distanceYds;

/// Create a copy of BagClub
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BagClubCopyWith<_BagClub> get copyWith => __$BagClubCopyWithImpl<_BagClub>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BagClub&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.club, club) || other.club == club)&&(identical(other.distanceYds, distanceYds) || other.distanceYds == distanceYds));
}


@override
int get hashCode {
    return Object.hash(runtimeType,addedAt,club,distanceYds);
}

@override
String toString() {
    return 'BagClub(addedAt: $addedAt, club: $club, distanceYds: $distanceYds)';
}


}

/// @nodoc
abstract mixin class _$BagClubCopyWith<$Res> implements $BagClubCopyWith<$Res> {
  factory _$BagClubCopyWith(_BagClub value, $Res Function(_BagClub) _then) = __$BagClubCopyWithImpl;
@override @useResult
$Res call({
 DateTime addedAt, GolfClub club, double distanceYds
});




}
/// @nodoc
class __$BagClubCopyWithImpl<$Res>
    implements _$BagClubCopyWith<$Res> {
  __$BagClubCopyWithImpl(this._self, this._then);

  final _BagClub _self;
  final $Res Function(_BagClub) _then;

/// Create a copy of BagClub
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? addedAt = null,Object? club = null,Object? distanceYds = null,}) {
  return _then(_BagClub(
addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,club: null == club ? _self.club : club // ignore: cast_nullable_to_non_nullable
as GolfClub,distanceYds: null == distanceYds ? _self.distanceYds : distanceYds // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
