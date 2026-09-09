// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bucket_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BucketSession {

 DateTime get date; String get id; String get locationId; String get routineId; int get bucketSize; HandicapTier get handicapTier; List<ShotLog> get shots; String get notes;
/// Create a copy of BucketSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BucketSessionCopyWith<BucketSession> get copyWith => _$BucketSessionCopyWithImpl<BucketSession>(this as BucketSession, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BucketSession;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BucketSession&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.locationId, _this.locationId) || other.locationId == _this.locationId)&&(identical(other.routineId, _this.routineId) || other.routineId == _this.routineId)&&(identical(other.bucketSize, _this.bucketSize) || other.bucketSize == _this.bucketSize)&&(identical(other.handicapTier, _this.handicapTier) || other.handicapTier == _this.handicapTier)&&const DeepCollectionEquality().equals(other.shots, _this.shots)&&(identical(other.notes, _this.notes) || other.notes == _this.notes));
}


@override
int get hashCode {
  final _this = this as BucketSession;
  return Object.hash(runtimeType,_this.date,_this.id,_this.locationId,_this.routineId,_this.bucketSize,_this.handicapTier,const DeepCollectionEquality().hash(_this.shots),_this.notes);
}

@override
String toString() {
  final _this = this as BucketSession;
  return 'BucketSession(date: ${_this.date}, id: ${_this.id}, locationId: ${_this.locationId}, routineId: ${_this.routineId}, bucketSize: ${_this.bucketSize}, handicapTier: ${_this.handicapTier}, shots: ${_this.shots}, notes: ${_this.notes})';
}


}

/// @nodoc
abstract mixin class $BucketSessionCopyWith<$Res>  {
  factory $BucketSessionCopyWith(BucketSession value, $Res Function(BucketSession) _then) = _$BucketSessionCopyWithImpl;
@useResult
$Res call({
 DateTime date, String id, String locationId, String routineId, int bucketSize, HandicapTier handicapTier, List<ShotLog> shots, String notes
});




}
/// @nodoc
class _$BucketSessionCopyWithImpl<$Res>
    implements $BucketSessionCopyWith<$Res> {
  _$BucketSessionCopyWithImpl(this._self, this._then);

  final BucketSession _self;
  final $Res Function(BucketSession) _then;

/// Create a copy of BucketSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? id = null,Object? locationId = null,Object? routineId = null,Object? bucketSize = null,Object? handicapTier = null,Object? shots = null,Object? notes = null,}) {
  return _then(BucketSession(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,locationId: null == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as String,routineId: null == routineId ? _self.routineId : routineId // ignore: cast_nullable_to_non_nullable
as String,bucketSize: null == bucketSize ? _self.bucketSize : bucketSize // ignore: cast_nullable_to_non_nullable
as int,handicapTier: null == handicapTier ? _self.handicapTier : handicapTier // ignore: cast_nullable_to_non_nullable
as HandicapTier,shots: null == shots ? _self.shots : shots // ignore: cast_nullable_to_non_nullable
as List<ShotLog>,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BucketSession].
extension BucketSessionPatterns on BucketSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BucketSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BucketSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BucketSession value)  $default,){
final _that = this;
switch (_that) {
case _BucketSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BucketSession value)?  $default,){
final _that = this;
switch (_that) {
case _BucketSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  String id,  String locationId,  String routineId,  int bucketSize,  HandicapTier handicapTier,  List<ShotLog> shots,  String notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BucketSession() when $default != null:
return $default(_that.date,_that.id,_that.locationId,_that.routineId,_that.bucketSize,_that.handicapTier,_that.shots,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  String id,  String locationId,  String routineId,  int bucketSize,  HandicapTier handicapTier,  List<ShotLog> shots,  String notes)  $default,) {final _that = this;
switch (_that) {
case _BucketSession():
return $default(_that.date,_that.id,_that.locationId,_that.routineId,_that.bucketSize,_that.handicapTier,_that.shots,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  String id,  String locationId,  String routineId,  int bucketSize,  HandicapTier handicapTier,  List<ShotLog> shots,  String notes)?  $default,) {final _that = this;
switch (_that) {
case _BucketSession() when $default != null:
return $default(_that.date,_that.id,_that.locationId,_that.routineId,_that.bucketSize,_that.handicapTier,_that.shots,_that.notes);case _:
  return null;

}
}

}

/// @nodoc


class _BucketSession extends BucketSession {
  const _BucketSession({required this.date, this.id = '', this.locationId = '', this.routineId = '', this.bucketSize = 0, this.handicapTier = HandicapTier.beginner,  List<ShotLog> shots = const <ShotLog>[], this.notes = ''}): _shots = shots,super._();
  

@override final  DateTime date;
@override@JsonKey() final  String id;
@override@JsonKey() final  String locationId;
@override@JsonKey() final  String routineId;
@override@JsonKey() final  int bucketSize;
@override@JsonKey() final  HandicapTier handicapTier;
 final  List<ShotLog> _shots;
@override@JsonKey() List<ShotLog> get shots {
  if (_shots is EqualUnmodifiableListView) return _shots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_shots);
}

@override@JsonKey() final  String notes;

/// Create a copy of BucketSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BucketSessionCopyWith<_BucketSession> get copyWith => __$BucketSessionCopyWithImpl<_BucketSession>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BucketSession&&(identical(other.date, date) || other.date == date)&&(identical(other.id, id) || other.id == id)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.routineId, routineId) || other.routineId == routineId)&&(identical(other.bucketSize, bucketSize) || other.bucketSize == bucketSize)&&(identical(other.handicapTier, handicapTier) || other.handicapTier == handicapTier)&&const DeepCollectionEquality().equals(other.shots, _shots)&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,date,id,locationId,routineId,bucketSize,handicapTier,const DeepCollectionEquality().hash(_shots),notes);
}

@override
String toString() {
    return 'BucketSession(date: $date, id: $id, locationId: $locationId, routineId: $routineId, bucketSize: $bucketSize, handicapTier: $handicapTier, shots: $shots, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$BucketSessionCopyWith<$Res> implements $BucketSessionCopyWith<$Res> {
  factory _$BucketSessionCopyWith(_BucketSession value, $Res Function(_BucketSession) _then) = __$BucketSessionCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, String id, String locationId, String routineId, int bucketSize, HandicapTier handicapTier, List<ShotLog> shots, String notes
});




}
/// @nodoc
class __$BucketSessionCopyWithImpl<$Res>
    implements _$BucketSessionCopyWith<$Res> {
  __$BucketSessionCopyWithImpl(this._self, this._then);

  final _BucketSession _self;
  final $Res Function(_BucketSession) _then;

/// Create a copy of BucketSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? id = null,Object? locationId = null,Object? routineId = null,Object? bucketSize = null,Object? handicapTier = null,Object? shots = null,Object? notes = null,}) {
  return _then(_BucketSession(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,locationId: null == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as String,routineId: null == routineId ? _self.routineId : routineId // ignore: cast_nullable_to_non_nullable
as String,bucketSize: null == bucketSize ? _self.bucketSize : bucketSize // ignore: cast_nullable_to_non_nullable
as int,handicapTier: null == handicapTier ? _self.handicapTier : handicapTier // ignore: cast_nullable_to_non_nullable
as HandicapTier,shots: null == shots ? _self._shots : shots // ignore: cast_nullable_to_non_nullable
as List<ShotLog>,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
