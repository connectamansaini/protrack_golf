// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'practice_routine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PracticeRoutine {

 DateTime get createdAt; String get id; int get bucketSize; HandicapTier get handicapTier; List<RoutinePhase> get phases;
/// Create a copy of PracticeRoutine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PracticeRoutineCopyWith<PracticeRoutine> get copyWith => _$PracticeRoutineCopyWithImpl<PracticeRoutine>(this as PracticeRoutine, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PracticeRoutine;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PracticeRoutine&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.bucketSize, _this.bucketSize) || other.bucketSize == _this.bucketSize)&&(identical(other.handicapTier, _this.handicapTier) || other.handicapTier == _this.handicapTier)&&const DeepCollectionEquality().equals(other.phases, _this.phases));
}


@override
int get hashCode {
  final _this = this as PracticeRoutine;
  return Object.hash(runtimeType,_this.createdAt,_this.id,_this.bucketSize,_this.handicapTier,const DeepCollectionEquality().hash(_this.phases));
}

@override
String toString() {
  final _this = this as PracticeRoutine;
  return 'PracticeRoutine(createdAt: ${_this.createdAt}, id: ${_this.id}, bucketSize: ${_this.bucketSize}, handicapTier: ${_this.handicapTier}, phases: ${_this.phases})';
}


}

/// @nodoc
abstract mixin class $PracticeRoutineCopyWith<$Res>  {
  factory $PracticeRoutineCopyWith(PracticeRoutine value, $Res Function(PracticeRoutine) _then) = _$PracticeRoutineCopyWithImpl;
@useResult
$Res call({
 DateTime createdAt, String id, int bucketSize, HandicapTier handicapTier, List<RoutinePhase> phases
});




}
/// @nodoc
class _$PracticeRoutineCopyWithImpl<$Res>
    implements $PracticeRoutineCopyWith<$Res> {
  _$PracticeRoutineCopyWithImpl(this._self, this._then);

  final PracticeRoutine _self;
  final $Res Function(PracticeRoutine) _then;

/// Create a copy of PracticeRoutine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdAt = null,Object? id = null,Object? bucketSize = null,Object? handicapTier = null,Object? phases = null,}) {
  return _then(PracticeRoutine(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bucketSize: null == bucketSize ? _self.bucketSize : bucketSize // ignore: cast_nullable_to_non_nullable
as int,handicapTier: null == handicapTier ? _self.handicapTier : handicapTier // ignore: cast_nullable_to_non_nullable
as HandicapTier,phases: null == phases ? _self.phases : phases // ignore: cast_nullable_to_non_nullable
as List<RoutinePhase>,
  ));
}

}


/// Adds pattern-matching-related methods to [PracticeRoutine].
extension PracticeRoutinePatterns on PracticeRoutine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PracticeRoutine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PracticeRoutine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PracticeRoutine value)  $default,){
final _that = this;
switch (_that) {
case _PracticeRoutine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PracticeRoutine value)?  $default,){
final _that = this;
switch (_that) {
case _PracticeRoutine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime createdAt,  String id,  int bucketSize,  HandicapTier handicapTier,  List<RoutinePhase> phases)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PracticeRoutine() when $default != null:
return $default(_that.createdAt,_that.id,_that.bucketSize,_that.handicapTier,_that.phases);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime createdAt,  String id,  int bucketSize,  HandicapTier handicapTier,  List<RoutinePhase> phases)  $default,) {final _that = this;
switch (_that) {
case _PracticeRoutine():
return $default(_that.createdAt,_that.id,_that.bucketSize,_that.handicapTier,_that.phases);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime createdAt,  String id,  int bucketSize,  HandicapTier handicapTier,  List<RoutinePhase> phases)?  $default,) {final _that = this;
switch (_that) {
case _PracticeRoutine() when $default != null:
return $default(_that.createdAt,_that.id,_that.bucketSize,_that.handicapTier,_that.phases);case _:
  return null;

}
}

}

/// @nodoc


class _PracticeRoutine extends PracticeRoutine {
  const _PracticeRoutine({required this.createdAt, this.id = '', this.bucketSize = 0, this.handicapTier = HandicapTier.beginner,  List<RoutinePhase> phases = const <RoutinePhase>[]}): _phases = phases,super._();
  

@override final  DateTime createdAt;
@override@JsonKey() final  String id;
@override@JsonKey() final  int bucketSize;
@override@JsonKey() final  HandicapTier handicapTier;
 final  List<RoutinePhase> _phases;
@override@JsonKey() List<RoutinePhase> get phases {
  if (_phases is EqualUnmodifiableListView) return _phases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_phases);
}


/// Create a copy of PracticeRoutine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PracticeRoutineCopyWith<_PracticeRoutine> get copyWith => __$PracticeRoutineCopyWithImpl<_PracticeRoutine>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PracticeRoutine&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.id, id) || other.id == id)&&(identical(other.bucketSize, bucketSize) || other.bucketSize == bucketSize)&&(identical(other.handicapTier, handicapTier) || other.handicapTier == handicapTier)&&const DeepCollectionEquality().equals(other.phases, _phases));
}


@override
int get hashCode {
    return Object.hash(runtimeType,createdAt,id,bucketSize,handicapTier,const DeepCollectionEquality().hash(_phases));
}

@override
String toString() {
    return 'PracticeRoutine(createdAt: $createdAt, id: $id, bucketSize: $bucketSize, handicapTier: $handicapTier, phases: $phases)';
}


}

/// @nodoc
abstract mixin class _$PracticeRoutineCopyWith<$Res> implements $PracticeRoutineCopyWith<$Res> {
  factory _$PracticeRoutineCopyWith(_PracticeRoutine value, $Res Function(_PracticeRoutine) _then) = __$PracticeRoutineCopyWithImpl;
@override @useResult
$Res call({
 DateTime createdAt, String id, int bucketSize, HandicapTier handicapTier, List<RoutinePhase> phases
});




}
/// @nodoc
class __$PracticeRoutineCopyWithImpl<$Res>
    implements _$PracticeRoutineCopyWith<$Res> {
  __$PracticeRoutineCopyWithImpl(this._self, this._then);

  final _PracticeRoutine _self;
  final $Res Function(_PracticeRoutine) _then;

/// Create a copy of PracticeRoutine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = null,Object? id = null,Object? bucketSize = null,Object? handicapTier = null,Object? phases = null,}) {
  return _then(_PracticeRoutine(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bucketSize: null == bucketSize ? _self.bucketSize : bucketSize // ignore: cast_nullable_to_non_nullable
as int,handicapTier: null == handicapTier ? _self.handicapTier : handicapTier // ignore: cast_nullable_to_non_nullable
as HandicapTier,phases: null == phases ? _self._phases : phases // ignore: cast_nullable_to_non_nullable
as List<RoutinePhase>,
  ));
}


}

// dart format on
