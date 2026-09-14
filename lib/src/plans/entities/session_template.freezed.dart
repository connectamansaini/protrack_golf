// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SessionTemplate {

 String get id; String get name; String get tagline; String get description; int get minBalls; int get idealBalls; int get durationMinutes; List<PracticePhaseKind> get phaseKinds;
/// Create a copy of SessionTemplate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionTemplateCopyWith<SessionTemplate> get copyWith => _$SessionTemplateCopyWithImpl<SessionTemplate>(this as SessionTemplate, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SessionTemplate;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionTemplate&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.tagline, _this.tagline) || other.tagline == _this.tagline)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.minBalls, _this.minBalls) || other.minBalls == _this.minBalls)&&(identical(other.idealBalls, _this.idealBalls) || other.idealBalls == _this.idealBalls)&&(identical(other.durationMinutes, _this.durationMinutes) || other.durationMinutes == _this.durationMinutes)&&const DeepCollectionEquality().equals(other.phaseKinds, _this.phaseKinds));
}


@override
int get hashCode {
  final _this = this as SessionTemplate;
  return Object.hash(runtimeType,_this.id,_this.name,_this.tagline,_this.description,_this.minBalls,_this.idealBalls,_this.durationMinutes,const DeepCollectionEquality().hash(_this.phaseKinds));
}

@override
String toString() {
  final _this = this as SessionTemplate;
  return 'SessionTemplate(id: ${_this.id}, name: ${_this.name}, tagline: ${_this.tagline}, description: ${_this.description}, minBalls: ${_this.minBalls}, idealBalls: ${_this.idealBalls}, durationMinutes: ${_this.durationMinutes}, phaseKinds: ${_this.phaseKinds})';
}


}

/// @nodoc
abstract mixin class $SessionTemplateCopyWith<$Res>  {
  factory $SessionTemplateCopyWith(SessionTemplate value, $Res Function(SessionTemplate) _then) = _$SessionTemplateCopyWithImpl;
@useResult
$Res call({
 String id, String name, String tagline, String description, int minBalls, int idealBalls, int durationMinutes, List<PracticePhaseKind> phaseKinds
});




}
/// @nodoc
class _$SessionTemplateCopyWithImpl<$Res>
    implements $SessionTemplateCopyWith<$Res> {
  _$SessionTemplateCopyWithImpl(this._self, this._then);

  final SessionTemplate _self;
  final $Res Function(SessionTemplate) _then;

/// Create a copy of SessionTemplate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? tagline = null,Object? description = null,Object? minBalls = null,Object? idealBalls = null,Object? durationMinutes = null,Object? phaseKinds = null,}) {
  return _then(SessionTemplate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tagline: null == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,minBalls: null == minBalls ? _self.minBalls : minBalls // ignore: cast_nullable_to_non_nullable
as int,idealBalls: null == idealBalls ? _self.idealBalls : idealBalls // ignore: cast_nullable_to_non_nullable
as int,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,phaseKinds: null == phaseKinds ? _self.phaseKinds : phaseKinds // ignore: cast_nullable_to_non_nullable
as List<PracticePhaseKind>,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionTemplate].
extension SessionTemplatePatterns on SessionTemplate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionTemplate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionTemplate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionTemplate value)  $default,){
final _that = this;
switch (_that) {
case _SessionTemplate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionTemplate value)?  $default,){
final _that = this;
switch (_that) {
case _SessionTemplate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String tagline,  String description,  int minBalls,  int idealBalls,  int durationMinutes,  List<PracticePhaseKind> phaseKinds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionTemplate() when $default != null:
return $default(_that.id,_that.name,_that.tagline,_that.description,_that.minBalls,_that.idealBalls,_that.durationMinutes,_that.phaseKinds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String tagline,  String description,  int minBalls,  int idealBalls,  int durationMinutes,  List<PracticePhaseKind> phaseKinds)  $default,) {final _that = this;
switch (_that) {
case _SessionTemplate():
return $default(_that.id,_that.name,_that.tagline,_that.description,_that.minBalls,_that.idealBalls,_that.durationMinutes,_that.phaseKinds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String tagline,  String description,  int minBalls,  int idealBalls,  int durationMinutes,  List<PracticePhaseKind> phaseKinds)?  $default,) {final _that = this;
switch (_that) {
case _SessionTemplate() when $default != null:
return $default(_that.id,_that.name,_that.tagline,_that.description,_that.minBalls,_that.idealBalls,_that.durationMinutes,_that.phaseKinds);case _:
  return null;

}
}

}

/// @nodoc


class _SessionTemplate extends SessionTemplate {
  const _SessionTemplate({this.id = '', this.name = '', this.tagline = '', this.description = '', this.minBalls = 0, this.idealBalls = 0, this.durationMinutes = 0,  List<PracticePhaseKind> phaseKinds = const <PracticePhaseKind>[]}): _phaseKinds = phaseKinds,super._();
  

@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String tagline;
@override@JsonKey() final  String description;
@override@JsonKey() final  int minBalls;
@override@JsonKey() final  int idealBalls;
@override@JsonKey() final  int durationMinutes;
 final  List<PracticePhaseKind> _phaseKinds;
@override@JsonKey() List<PracticePhaseKind> get phaseKinds {
  if (_phaseKinds is EqualUnmodifiableListView) return _phaseKinds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_phaseKinds);
}


/// Create a copy of SessionTemplate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionTemplateCopyWith<_SessionTemplate> get copyWith => __$SessionTemplateCopyWithImpl<_SessionTemplate>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionTemplate&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.description, description) || other.description == description)&&(identical(other.minBalls, minBalls) || other.minBalls == minBalls)&&(identical(other.idealBalls, idealBalls) || other.idealBalls == idealBalls)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&const DeepCollectionEquality().equals(other.phaseKinds, _phaseKinds));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,tagline,description,minBalls,idealBalls,durationMinutes,const DeepCollectionEquality().hash(_phaseKinds));
}

@override
String toString() {
    return 'SessionTemplate(id: $id, name: $name, tagline: $tagline, description: $description, minBalls: $minBalls, idealBalls: $idealBalls, durationMinutes: $durationMinutes, phaseKinds: $phaseKinds)';
}


}

/// @nodoc
abstract mixin class _$SessionTemplateCopyWith<$Res> implements $SessionTemplateCopyWith<$Res> {
  factory _$SessionTemplateCopyWith(_SessionTemplate value, $Res Function(_SessionTemplate) _then) = __$SessionTemplateCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String tagline, String description, int minBalls, int idealBalls, int durationMinutes, List<PracticePhaseKind> phaseKinds
});




}
/// @nodoc
class __$SessionTemplateCopyWithImpl<$Res>
    implements _$SessionTemplateCopyWith<$Res> {
  __$SessionTemplateCopyWithImpl(this._self, this._then);

  final _SessionTemplate _self;
  final $Res Function(_SessionTemplate) _then;

/// Create a copy of SessionTemplate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? tagline = null,Object? description = null,Object? minBalls = null,Object? idealBalls = null,Object? durationMinutes = null,Object? phaseKinds = null,}) {
  return _then(_SessionTemplate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tagline: null == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,minBalls: null == minBalls ? _self.minBalls : minBalls // ignore: cast_nullable_to_non_nullable
as int,idealBalls: null == idealBalls ? _self.idealBalls : idealBalls // ignore: cast_nullable_to_non_nullable
as int,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,phaseKinds: null == phaseKinds ? _self._phaseKinds : phaseKinds // ignore: cast_nullable_to_non_nullable
as List<PracticePhaseKind>,
  ));
}


}

// dart format on
