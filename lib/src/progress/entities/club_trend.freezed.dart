// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'club_trend.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClubTrend {

 GolfClub get club; List<TrendPoint> get dataPoints;
/// Create a copy of ClubTrend
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClubTrendCopyWith<ClubTrend> get copyWith => _$ClubTrendCopyWithImpl<ClubTrend>(this as ClubTrend, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ClubTrend;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClubTrend&&(identical(other.club, _this.club) || other.club == _this.club)&&const DeepCollectionEquality().equals(other.dataPoints, _this.dataPoints));
}


@override
int get hashCode {
  final _this = this as ClubTrend;
  return Object.hash(runtimeType,_this.club,const DeepCollectionEquality().hash(_this.dataPoints));
}

@override
String toString() {
  final _this = this as ClubTrend;
  return 'ClubTrend(club: ${_this.club}, dataPoints: ${_this.dataPoints})';
}


}

/// @nodoc
abstract mixin class $ClubTrendCopyWith<$Res>  {
  factory $ClubTrendCopyWith(ClubTrend value, $Res Function(ClubTrend) _then) = _$ClubTrendCopyWithImpl;
@useResult
$Res call({
 GolfClub club, List<TrendPoint> dataPoints
});




}
/// @nodoc
class _$ClubTrendCopyWithImpl<$Res>
    implements $ClubTrendCopyWith<$Res> {
  _$ClubTrendCopyWithImpl(this._self, this._then);

  final ClubTrend _self;
  final $Res Function(ClubTrend) _then;

/// Create a copy of ClubTrend
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? club = null,Object? dataPoints = null,}) {
  return _then(ClubTrend(
club: null == club ? _self.club : club // ignore: cast_nullable_to_non_nullable
as GolfClub,dataPoints: null == dataPoints ? _self.dataPoints : dataPoints // ignore: cast_nullable_to_non_nullable
as List<TrendPoint>,
  ));
}

}


/// Adds pattern-matching-related methods to [ClubTrend].
extension ClubTrendPatterns on ClubTrend {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClubTrend value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClubTrend() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClubTrend value)  $default,){
final _that = this;
switch (_that) {
case _ClubTrend():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClubTrend value)?  $default,){
final _that = this;
switch (_that) {
case _ClubTrend() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GolfClub club,  List<TrendPoint> dataPoints)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClubTrend() when $default != null:
return $default(_that.club,_that.dataPoints);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GolfClub club,  List<TrendPoint> dataPoints)  $default,) {final _that = this;
switch (_that) {
case _ClubTrend():
return $default(_that.club,_that.dataPoints);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GolfClub club,  List<TrendPoint> dataPoints)?  $default,) {final _that = this;
switch (_that) {
case _ClubTrend() when $default != null:
return $default(_that.club,_that.dataPoints);case _:
  return null;

}
}

}

/// @nodoc


class _ClubTrend extends ClubTrend {
  const _ClubTrend({this.club = GolfClub.driver,  List<TrendPoint> dataPoints = const <TrendPoint>[]}): _dataPoints = dataPoints,super._();
  

@override@JsonKey() final  GolfClub club;
 final  List<TrendPoint> _dataPoints;
@override@JsonKey() List<TrendPoint> get dataPoints {
  if (_dataPoints is EqualUnmodifiableListView) return _dataPoints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dataPoints);
}


/// Create a copy of ClubTrend
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClubTrendCopyWith<_ClubTrend> get copyWith => __$ClubTrendCopyWithImpl<_ClubTrend>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClubTrend&&(identical(other.club, club) || other.club == club)&&const DeepCollectionEquality().equals(other.dataPoints, _dataPoints));
}


@override
int get hashCode {
    return Object.hash(runtimeType,club,const DeepCollectionEquality().hash(_dataPoints));
}

@override
String toString() {
    return 'ClubTrend(club: $club, dataPoints: $dataPoints)';
}


}

/// @nodoc
abstract mixin class _$ClubTrendCopyWith<$Res> implements $ClubTrendCopyWith<$Res> {
  factory _$ClubTrendCopyWith(_ClubTrend value, $Res Function(_ClubTrend) _then) = __$ClubTrendCopyWithImpl;
@override @useResult
$Res call({
 GolfClub club, List<TrendPoint> dataPoints
});




}
/// @nodoc
class __$ClubTrendCopyWithImpl<$Res>
    implements _$ClubTrendCopyWith<$Res> {
  __$ClubTrendCopyWithImpl(this._self, this._then);

  final _ClubTrend _self;
  final $Res Function(_ClubTrend) _then;

/// Create a copy of ClubTrend
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? club = null,Object? dataPoints = null,}) {
  return _then(_ClubTrend(
club: null == club ? _self.club : club // ignore: cast_nullable_to_non_nullable
as GolfClub,dataPoints: null == dataPoints ? _self._dataPoints : dataPoints // ignore: cast_nullable_to_non_nullable
as List<TrendPoint>,
  ));
}


}

// dart format on
