// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SessionPlan {

 String get templateId; String get templateName; int get totalBalls; List<PlanPhase> get phases;
/// Create a copy of SessionPlan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionPlanCopyWith<SessionPlan> get copyWith => _$SessionPlanCopyWithImpl<SessionPlan>(this as SessionPlan, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SessionPlan;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionPlan&&(identical(other.templateId, _this.templateId) || other.templateId == _this.templateId)&&(identical(other.templateName, _this.templateName) || other.templateName == _this.templateName)&&(identical(other.totalBalls, _this.totalBalls) || other.totalBalls == _this.totalBalls)&&const DeepCollectionEquality().equals(other.phases, _this.phases));
}


@override
int get hashCode {
  final _this = this as SessionPlan;
  return Object.hash(runtimeType,_this.templateId,_this.templateName,_this.totalBalls,const DeepCollectionEquality().hash(_this.phases));
}

@override
String toString() {
  final _this = this as SessionPlan;
  return 'SessionPlan(templateId: ${_this.templateId}, templateName: ${_this.templateName}, totalBalls: ${_this.totalBalls}, phases: ${_this.phases})';
}


}

/// @nodoc
abstract mixin class $SessionPlanCopyWith<$Res>  {
  factory $SessionPlanCopyWith(SessionPlan value, $Res Function(SessionPlan) _then) = _$SessionPlanCopyWithImpl;
@useResult
$Res call({
 String templateId, String templateName, int totalBalls, List<PlanPhase> phases
});




}
/// @nodoc
class _$SessionPlanCopyWithImpl<$Res>
    implements $SessionPlanCopyWith<$Res> {
  _$SessionPlanCopyWithImpl(this._self, this._then);

  final SessionPlan _self;
  final $Res Function(SessionPlan) _then;

/// Create a copy of SessionPlan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? templateId = null,Object? templateName = null,Object? totalBalls = null,Object? phases = null,}) {
  return _then(SessionPlan(
templateId: null == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String,templateName: null == templateName ? _self.templateName : templateName // ignore: cast_nullable_to_non_nullable
as String,totalBalls: null == totalBalls ? _self.totalBalls : totalBalls // ignore: cast_nullable_to_non_nullable
as int,phases: null == phases ? _self.phases : phases // ignore: cast_nullable_to_non_nullable
as List<PlanPhase>,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionPlan].
extension SessionPlanPatterns on SessionPlan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionPlan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionPlan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionPlan value)  $default,){
final _that = this;
switch (_that) {
case _SessionPlan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionPlan value)?  $default,){
final _that = this;
switch (_that) {
case _SessionPlan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String templateId,  String templateName,  int totalBalls,  List<PlanPhase> phases)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionPlan() when $default != null:
return $default(_that.templateId,_that.templateName,_that.totalBalls,_that.phases);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String templateId,  String templateName,  int totalBalls,  List<PlanPhase> phases)  $default,) {final _that = this;
switch (_that) {
case _SessionPlan():
return $default(_that.templateId,_that.templateName,_that.totalBalls,_that.phases);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String templateId,  String templateName,  int totalBalls,  List<PlanPhase> phases)?  $default,) {final _that = this;
switch (_that) {
case _SessionPlan() when $default != null:
return $default(_that.templateId,_that.templateName,_that.totalBalls,_that.phases);case _:
  return null;

}
}

}

/// @nodoc


class _SessionPlan extends SessionPlan {
  const _SessionPlan({this.templateId = '', this.templateName = '', this.totalBalls = 0,  List<PlanPhase> phases = const <PlanPhase>[]}): _phases = phases,super._();
  

@override@JsonKey() final  String templateId;
@override@JsonKey() final  String templateName;
@override@JsonKey() final  int totalBalls;
 final  List<PlanPhase> _phases;
@override@JsonKey() List<PlanPhase> get phases {
  if (_phases is EqualUnmodifiableListView) return _phases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_phases);
}


/// Create a copy of SessionPlan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionPlanCopyWith<_SessionPlan> get copyWith => __$SessionPlanCopyWithImpl<_SessionPlan>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionPlan&&(identical(other.templateId, templateId) || other.templateId == templateId)&&(identical(other.templateName, templateName) || other.templateName == templateName)&&(identical(other.totalBalls, totalBalls) || other.totalBalls == totalBalls)&&const DeepCollectionEquality().equals(other.phases, _phases));
}


@override
int get hashCode {
    return Object.hash(runtimeType,templateId,templateName,totalBalls,const DeepCollectionEquality().hash(_phases));
}

@override
String toString() {
    return 'SessionPlan(templateId: $templateId, templateName: $templateName, totalBalls: $totalBalls, phases: $phases)';
}


}

/// @nodoc
abstract mixin class _$SessionPlanCopyWith<$Res> implements $SessionPlanCopyWith<$Res> {
  factory _$SessionPlanCopyWith(_SessionPlan value, $Res Function(_SessionPlan) _then) = __$SessionPlanCopyWithImpl;
@override @useResult
$Res call({
 String templateId, String templateName, int totalBalls, List<PlanPhase> phases
});




}
/// @nodoc
class __$SessionPlanCopyWithImpl<$Res>
    implements _$SessionPlanCopyWith<$Res> {
  __$SessionPlanCopyWithImpl(this._self, this._then);

  final _SessionPlan _self;
  final $Res Function(_SessionPlan) _then;

/// Create a copy of SessionPlan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? templateId = null,Object? templateName = null,Object? totalBalls = null,Object? phases = null,}) {
  return _then(_SessionPlan(
templateId: null == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String,templateName: null == templateName ? _self.templateName : templateName // ignore: cast_nullable_to_non_nullable
as String,totalBalls: null == totalBalls ? _self.totalBalls : totalBalls // ignore: cast_nullable_to_non_nullable
as int,phases: null == phases ? _self._phases : phases // ignore: cast_nullable_to_non_nullable
as List<PlanPhase>,
  ));
}


}

// dart format on
