// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'club_session_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClubSessionSummary {

 DateTime get date; String get sessionId; int get shots; double get averageYds; double get bestYds;
/// Create a copy of ClubSessionSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClubSessionSummaryCopyWith<ClubSessionSummary> get copyWith => _$ClubSessionSummaryCopyWithImpl<ClubSessionSummary>(this as ClubSessionSummary, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ClubSessionSummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClubSessionSummary&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.sessionId, _this.sessionId) || other.sessionId == _this.sessionId)&&(identical(other.shots, _this.shots) || other.shots == _this.shots)&&(identical(other.averageYds, _this.averageYds) || other.averageYds == _this.averageYds)&&(identical(other.bestYds, _this.bestYds) || other.bestYds == _this.bestYds));
}


@override
int get hashCode {
  final _this = this as ClubSessionSummary;
  return Object.hash(runtimeType,_this.date,_this.sessionId,_this.shots,_this.averageYds,_this.bestYds);
}

@override
String toString() {
  final _this = this as ClubSessionSummary;
  return 'ClubSessionSummary(date: ${_this.date}, sessionId: ${_this.sessionId}, shots: ${_this.shots}, averageYds: ${_this.averageYds}, bestYds: ${_this.bestYds})';
}


}

/// @nodoc
abstract mixin class $ClubSessionSummaryCopyWith<$Res>  {
  factory $ClubSessionSummaryCopyWith(ClubSessionSummary value, $Res Function(ClubSessionSummary) _then) = _$ClubSessionSummaryCopyWithImpl;
@useResult
$Res call({
 DateTime date, String sessionId, int shots, double averageYds, double bestYds
});




}
/// @nodoc
class _$ClubSessionSummaryCopyWithImpl<$Res>
    implements $ClubSessionSummaryCopyWith<$Res> {
  _$ClubSessionSummaryCopyWithImpl(this._self, this._then);

  final ClubSessionSummary _self;
  final $Res Function(ClubSessionSummary) _then;

/// Create a copy of ClubSessionSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? sessionId = null,Object? shots = null,Object? averageYds = null,Object? bestYds = null,}) {
  return _then(ClubSessionSummary(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,shots: null == shots ? _self.shots : shots // ignore: cast_nullable_to_non_nullable
as int,averageYds: null == averageYds ? _self.averageYds : averageYds // ignore: cast_nullable_to_non_nullable
as double,bestYds: null == bestYds ? _self.bestYds : bestYds // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ClubSessionSummary].
extension ClubSessionSummaryPatterns on ClubSessionSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClubSessionSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClubSessionSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClubSessionSummary value)  $default,){
final _that = this;
switch (_that) {
case _ClubSessionSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClubSessionSummary value)?  $default,){
final _that = this;
switch (_that) {
case _ClubSessionSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  String sessionId,  int shots,  double averageYds,  double bestYds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClubSessionSummary() when $default != null:
return $default(_that.date,_that.sessionId,_that.shots,_that.averageYds,_that.bestYds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  String sessionId,  int shots,  double averageYds,  double bestYds)  $default,) {final _that = this;
switch (_that) {
case _ClubSessionSummary():
return $default(_that.date,_that.sessionId,_that.shots,_that.averageYds,_that.bestYds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  String sessionId,  int shots,  double averageYds,  double bestYds)?  $default,) {final _that = this;
switch (_that) {
case _ClubSessionSummary() when $default != null:
return $default(_that.date,_that.sessionId,_that.shots,_that.averageYds,_that.bestYds);case _:
  return null;

}
}

}

/// @nodoc


class _ClubSessionSummary extends ClubSessionSummary {
  const _ClubSessionSummary({required this.date, this.sessionId = '', this.shots = 0, this.averageYds = 0, this.bestYds = 0}): super._();
  

@override final  DateTime date;
@override@JsonKey() final  String sessionId;
@override@JsonKey() final  int shots;
@override@JsonKey() final  double averageYds;
@override@JsonKey() final  double bestYds;

/// Create a copy of ClubSessionSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClubSessionSummaryCopyWith<_ClubSessionSummary> get copyWith => __$ClubSessionSummaryCopyWithImpl<_ClubSessionSummary>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClubSessionSummary&&(identical(other.date, date) || other.date == date)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.shots, shots) || other.shots == shots)&&(identical(other.averageYds, averageYds) || other.averageYds == averageYds)&&(identical(other.bestYds, bestYds) || other.bestYds == bestYds));
}


@override
int get hashCode {
    return Object.hash(runtimeType,date,sessionId,shots,averageYds,bestYds);
}

@override
String toString() {
    return 'ClubSessionSummary(date: $date, sessionId: $sessionId, shots: $shots, averageYds: $averageYds, bestYds: $bestYds)';
}


}

/// @nodoc
abstract mixin class _$ClubSessionSummaryCopyWith<$Res> implements $ClubSessionSummaryCopyWith<$Res> {
  factory _$ClubSessionSummaryCopyWith(_ClubSessionSummary value, $Res Function(_ClubSessionSummary) _then) = __$ClubSessionSummaryCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, String sessionId, int shots, double averageYds, double bestYds
});




}
/// @nodoc
class __$ClubSessionSummaryCopyWithImpl<$Res>
    implements _$ClubSessionSummaryCopyWith<$Res> {
  __$ClubSessionSummaryCopyWithImpl(this._self, this._then);

  final _ClubSessionSummary _self;
  final $Res Function(_ClubSessionSummary) _then;

/// Create a copy of ClubSessionSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? sessionId = null,Object? shots = null,Object? averageYds = null,Object? bestYds = null,}) {
  return _then(_ClubSessionSummary(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,shots: null == shots ? _self.shots : shots // ignore: cast_nullable_to_non_nullable
as int,averageYds: null == averageYds ? _self.averageYds : averageYds // ignore: cast_nullable_to_non_nullable
as double,bestYds: null == bestYds ? _self.bestYds : bestYds // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
