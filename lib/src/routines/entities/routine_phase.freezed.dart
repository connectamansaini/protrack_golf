// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'routine_phase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RoutinePhase {

 RoutinePhaseType get type; String get title; List<Drill> get drills; int get shotAllocation;
/// Create a copy of RoutinePhase
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoutinePhaseCopyWith<RoutinePhase> get copyWith => _$RoutinePhaseCopyWithImpl<RoutinePhase>(this as RoutinePhase, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RoutinePhase;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoutinePhase&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.title, _this.title) || other.title == _this.title)&&const DeepCollectionEquality().equals(other.drills, _this.drills)&&(identical(other.shotAllocation, _this.shotAllocation) || other.shotAllocation == _this.shotAllocation));
}


@override
int get hashCode {
  final _this = this as RoutinePhase;
  return Object.hash(runtimeType,_this.type,_this.title,const DeepCollectionEquality().hash(_this.drills),_this.shotAllocation);
}

@override
String toString() {
  final _this = this as RoutinePhase;
  return 'RoutinePhase(type: ${_this.type}, title: ${_this.title}, drills: ${_this.drills}, shotAllocation: ${_this.shotAllocation})';
}


}

/// @nodoc
abstract mixin class $RoutinePhaseCopyWith<$Res>  {
  factory $RoutinePhaseCopyWith(RoutinePhase value, $Res Function(RoutinePhase) _then) = _$RoutinePhaseCopyWithImpl;
@useResult
$Res call({
 RoutinePhaseType type, String title, List<Drill> drills, int shotAllocation
});




}
/// @nodoc
class _$RoutinePhaseCopyWithImpl<$Res>
    implements $RoutinePhaseCopyWith<$Res> {
  _$RoutinePhaseCopyWithImpl(this._self, this._then);

  final RoutinePhase _self;
  final $Res Function(RoutinePhase) _then;

/// Create a copy of RoutinePhase
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? title = null,Object? drills = null,Object? shotAllocation = null,}) {
  return _then(RoutinePhase(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as RoutinePhaseType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,drills: null == drills ? _self.drills : drills // ignore: cast_nullable_to_non_nullable
as List<Drill>,shotAllocation: null == shotAllocation ? _self.shotAllocation : shotAllocation // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RoutinePhase].
extension RoutinePhasePatterns on RoutinePhase {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoutinePhase value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoutinePhase() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoutinePhase value)  $default,){
final _that = this;
switch (_that) {
case _RoutinePhase():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoutinePhase value)?  $default,){
final _that = this;
switch (_that) {
case _RoutinePhase() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RoutinePhaseType type,  String title,  List<Drill> drills,  int shotAllocation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoutinePhase() when $default != null:
return $default(_that.type,_that.title,_that.drills,_that.shotAllocation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RoutinePhaseType type,  String title,  List<Drill> drills,  int shotAllocation)  $default,) {final _that = this;
switch (_that) {
case _RoutinePhase():
return $default(_that.type,_that.title,_that.drills,_that.shotAllocation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RoutinePhaseType type,  String title,  List<Drill> drills,  int shotAllocation)?  $default,) {final _that = this;
switch (_that) {
case _RoutinePhase() when $default != null:
return $default(_that.type,_that.title,_that.drills,_that.shotAllocation);case _:
  return null;

}
}

}

/// @nodoc


class _RoutinePhase extends RoutinePhase {
  const _RoutinePhase({this.type = RoutinePhaseType.warmUp, this.title = '',  List<Drill> drills = const <Drill>[], this.shotAllocation = 0}): _drills = drills,super._();
  

@override@JsonKey() final  RoutinePhaseType type;
@override@JsonKey() final  String title;
 final  List<Drill> _drills;
@override@JsonKey() List<Drill> get drills {
  if (_drills is EqualUnmodifiableListView) return _drills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_drills);
}

@override@JsonKey() final  int shotAllocation;

/// Create a copy of RoutinePhase
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoutinePhaseCopyWith<_RoutinePhase> get copyWith => __$RoutinePhaseCopyWithImpl<_RoutinePhase>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoutinePhase&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.drills, _drills)&&(identical(other.shotAllocation, shotAllocation) || other.shotAllocation == shotAllocation));
}


@override
int get hashCode {
    return Object.hash(runtimeType,type,title,const DeepCollectionEquality().hash(_drills),shotAllocation);
}

@override
String toString() {
    return 'RoutinePhase(type: $type, title: $title, drills: $drills, shotAllocation: $shotAllocation)';
}


}

/// @nodoc
abstract mixin class _$RoutinePhaseCopyWith<$Res> implements $RoutinePhaseCopyWith<$Res> {
  factory _$RoutinePhaseCopyWith(_RoutinePhase value, $Res Function(_RoutinePhase) _then) = __$RoutinePhaseCopyWithImpl;
@override @useResult
$Res call({
 RoutinePhaseType type, String title, List<Drill> drills, int shotAllocation
});




}
/// @nodoc
class __$RoutinePhaseCopyWithImpl<$Res>
    implements _$RoutinePhaseCopyWith<$Res> {
  __$RoutinePhaseCopyWithImpl(this._self, this._then);

  final _RoutinePhase _self;
  final $Res Function(_RoutinePhase) _then;

/// Create a copy of RoutinePhase
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? title = null,Object? drills = null,Object? shotAllocation = null,}) {
  return _then(_RoutinePhase(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as RoutinePhaseType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,drills: null == drills ? _self._drills : drills // ignore: cast_nullable_to_non_nullable
as List<Drill>,shotAllocation: null == shotAllocation ? _self.shotAllocation : shotAllocation // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
