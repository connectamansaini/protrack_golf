// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_phase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlanPhase {

 PracticePhaseKind get kind; String get title; ShotIntent get intent; int get ballCount; List<GolfClub> get clubs; String get goal; List<String> get drills;
/// Create a copy of PlanPhase
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanPhaseCopyWith<PlanPhase> get copyWith => _$PlanPhaseCopyWithImpl<PlanPhase>(this as PlanPhase, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PlanPhase;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanPhase&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.intent, _this.intent) || other.intent == _this.intent)&&(identical(other.ballCount, _this.ballCount) || other.ballCount == _this.ballCount)&&const DeepCollectionEquality().equals(other.clubs, _this.clubs)&&(identical(other.goal, _this.goal) || other.goal == _this.goal)&&const DeepCollectionEquality().equals(other.drills, _this.drills));
}


@override
int get hashCode {
  final _this = this as PlanPhase;
  return Object.hash(runtimeType,_this.kind,_this.title,_this.intent,_this.ballCount,const DeepCollectionEquality().hash(_this.clubs),_this.goal,const DeepCollectionEquality().hash(_this.drills));
}

@override
String toString() {
  final _this = this as PlanPhase;
  return 'PlanPhase(kind: ${_this.kind}, title: ${_this.title}, intent: ${_this.intent}, ballCount: ${_this.ballCount}, clubs: ${_this.clubs}, goal: ${_this.goal}, drills: ${_this.drills})';
}


}

/// @nodoc
abstract mixin class $PlanPhaseCopyWith<$Res>  {
  factory $PlanPhaseCopyWith(PlanPhase value, $Res Function(PlanPhase) _then) = _$PlanPhaseCopyWithImpl;
@useResult
$Res call({
 PracticePhaseKind kind, String title, ShotIntent intent, int ballCount, List<GolfClub> clubs, String goal, List<String> drills
});




}
/// @nodoc
class _$PlanPhaseCopyWithImpl<$Res>
    implements $PlanPhaseCopyWith<$Res> {
  _$PlanPhaseCopyWithImpl(this._self, this._then);

  final PlanPhase _self;
  final $Res Function(PlanPhase) _then;

/// Create a copy of PlanPhase
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? title = null,Object? intent = null,Object? ballCount = null,Object? clubs = null,Object? goal = null,Object? drills = null,}) {
  return _then(PlanPhase(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PracticePhaseKind,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,intent: null == intent ? _self.intent : intent // ignore: cast_nullable_to_non_nullable
as ShotIntent,ballCount: null == ballCount ? _self.ballCount : ballCount // ignore: cast_nullable_to_non_nullable
as int,clubs: null == clubs ? _self.clubs : clubs // ignore: cast_nullable_to_non_nullable
as List<GolfClub>,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as String,drills: null == drills ? _self.drills : drills // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [PlanPhase].
extension PlanPhasePatterns on PlanPhase {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanPhase value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanPhase() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanPhase value)  $default,){
final _that = this;
switch (_that) {
case _PlanPhase():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanPhase value)?  $default,){
final _that = this;
switch (_that) {
case _PlanPhase() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PracticePhaseKind kind,  String title,  ShotIntent intent,  int ballCount,  List<GolfClub> clubs,  String goal,  List<String> drills)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanPhase() when $default != null:
return $default(_that.kind,_that.title,_that.intent,_that.ballCount,_that.clubs,_that.goal,_that.drills);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PracticePhaseKind kind,  String title,  ShotIntent intent,  int ballCount,  List<GolfClub> clubs,  String goal,  List<String> drills)  $default,) {final _that = this;
switch (_that) {
case _PlanPhase():
return $default(_that.kind,_that.title,_that.intent,_that.ballCount,_that.clubs,_that.goal,_that.drills);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PracticePhaseKind kind,  String title,  ShotIntent intent,  int ballCount,  List<GolfClub> clubs,  String goal,  List<String> drills)?  $default,) {final _that = this;
switch (_that) {
case _PlanPhase() when $default != null:
return $default(_that.kind,_that.title,_that.intent,_that.ballCount,_that.clubs,_that.goal,_that.drills);case _:
  return null;

}
}

}

/// @nodoc


class _PlanPhase extends PlanPhase {
  const _PlanPhase({this.kind = PracticePhaseKind.warmUp, this.title = '', this.intent = ShotIntent.full, this.ballCount = 0,  List<GolfClub> clubs = const <GolfClub>[], this.goal = '',  List<String> drills = const <String>[]}): _clubs = clubs,_drills = drills,super._();
  

@override@JsonKey() final  PracticePhaseKind kind;
@override@JsonKey() final  String title;
@override@JsonKey() final  ShotIntent intent;
@override@JsonKey() final  int ballCount;
 final  List<GolfClub> _clubs;
@override@JsonKey() List<GolfClub> get clubs {
  if (_clubs is EqualUnmodifiableListView) return _clubs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_clubs);
}

@override@JsonKey() final  String goal;
 final  List<String> _drills;
@override@JsonKey() List<String> get drills {
  if (_drills is EqualUnmodifiableListView) return _drills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_drills);
}


/// Create a copy of PlanPhase
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanPhaseCopyWith<_PlanPhase> get copyWith => __$PlanPhaseCopyWithImpl<_PlanPhase>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanPhase&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.title, title) || other.title == title)&&(identical(other.intent, intent) || other.intent == intent)&&(identical(other.ballCount, ballCount) || other.ballCount == ballCount)&&const DeepCollectionEquality().equals(other.clubs, _clubs)&&(identical(other.goal, goal) || other.goal == goal)&&const DeepCollectionEquality().equals(other.drills, _drills));
}


@override
int get hashCode {
    return Object.hash(runtimeType,kind,title,intent,ballCount,const DeepCollectionEquality().hash(_clubs),goal,const DeepCollectionEquality().hash(_drills));
}

@override
String toString() {
    return 'PlanPhase(kind: $kind, title: $title, intent: $intent, ballCount: $ballCount, clubs: $clubs, goal: $goal, drills: $drills)';
}


}

/// @nodoc
abstract mixin class _$PlanPhaseCopyWith<$Res> implements $PlanPhaseCopyWith<$Res> {
  factory _$PlanPhaseCopyWith(_PlanPhase value, $Res Function(_PlanPhase) _then) = __$PlanPhaseCopyWithImpl;
@override @useResult
$Res call({
 PracticePhaseKind kind, String title, ShotIntent intent, int ballCount, List<GolfClub> clubs, String goal, List<String> drills
});




}
/// @nodoc
class __$PlanPhaseCopyWithImpl<$Res>
    implements _$PlanPhaseCopyWith<$Res> {
  __$PlanPhaseCopyWithImpl(this._self, this._then);

  final _PlanPhase _self;
  final $Res Function(_PlanPhase) _then;

/// Create a copy of PlanPhase
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? title = null,Object? intent = null,Object? ballCount = null,Object? clubs = null,Object? goal = null,Object? drills = null,}) {
  return _then(_PlanPhase(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PracticePhaseKind,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,intent: null == intent ? _self.intent : intent // ignore: cast_nullable_to_non_nullable
as ShotIntent,ballCount: null == ballCount ? _self.ballCount : ballCount // ignore: cast_nullable_to_non_nullable
as int,clubs: null == clubs ? _self._clubs : clubs // ignore: cast_nullable_to_non_nullable
as List<GolfClub>,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as String,drills: null == drills ? _self._drills : drills // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
