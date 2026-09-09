// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drill.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Drill {

 String get title; String get instructions; int get shotCount; GolfClub? get suggestedClub;
/// Create a copy of Drill
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DrillCopyWith<Drill> get copyWith => _$DrillCopyWithImpl<Drill>(this as Drill, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Drill;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Drill&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.instructions, _this.instructions) || other.instructions == _this.instructions)&&(identical(other.shotCount, _this.shotCount) || other.shotCount == _this.shotCount)&&(identical(other.suggestedClub, _this.suggestedClub) || other.suggestedClub == _this.suggestedClub));
}


@override
int get hashCode {
  final _this = this as Drill;
  return Object.hash(runtimeType,_this.title,_this.instructions,_this.shotCount,_this.suggestedClub);
}

@override
String toString() {
  final _this = this as Drill;
  return 'Drill(title: ${_this.title}, instructions: ${_this.instructions}, shotCount: ${_this.shotCount}, suggestedClub: ${_this.suggestedClub})';
}


}

/// @nodoc
abstract mixin class $DrillCopyWith<$Res>  {
  factory $DrillCopyWith(Drill value, $Res Function(Drill) _then) = _$DrillCopyWithImpl;
@useResult
$Res call({
 String title, String instructions, int shotCount, GolfClub? suggestedClub
});




}
/// @nodoc
class _$DrillCopyWithImpl<$Res>
    implements $DrillCopyWith<$Res> {
  _$DrillCopyWithImpl(this._self, this._then);

  final Drill _self;
  final $Res Function(Drill) _then;

/// Create a copy of Drill
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? instructions = null,Object? shotCount = null,Object? suggestedClub = freezed,}) {
  return _then(Drill(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String,shotCount: null == shotCount ? _self.shotCount : shotCount // ignore: cast_nullable_to_non_nullable
as int,suggestedClub: freezed == suggestedClub ? _self.suggestedClub : suggestedClub // ignore: cast_nullable_to_non_nullable
as GolfClub?,
  ));
}

}


/// Adds pattern-matching-related methods to [Drill].
extension DrillPatterns on Drill {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Drill value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Drill() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Drill value)  $default,){
final _that = this;
switch (_that) {
case _Drill():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Drill value)?  $default,){
final _that = this;
switch (_that) {
case _Drill() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String instructions,  int shotCount,  GolfClub? suggestedClub)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Drill() when $default != null:
return $default(_that.title,_that.instructions,_that.shotCount,_that.suggestedClub);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String instructions,  int shotCount,  GolfClub? suggestedClub)  $default,) {final _that = this;
switch (_that) {
case _Drill():
return $default(_that.title,_that.instructions,_that.shotCount,_that.suggestedClub);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String instructions,  int shotCount,  GolfClub? suggestedClub)?  $default,) {final _that = this;
switch (_that) {
case _Drill() when $default != null:
return $default(_that.title,_that.instructions,_that.shotCount,_that.suggestedClub);case _:
  return null;

}
}

}

/// @nodoc


class _Drill extends Drill {
  const _Drill({this.title = '', this.instructions = '', this.shotCount = 0, this.suggestedClub}): super._();
  

@override@JsonKey() final  String title;
@override@JsonKey() final  String instructions;
@override@JsonKey() final  int shotCount;
@override final  GolfClub? suggestedClub;

/// Create a copy of Drill
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DrillCopyWith<_Drill> get copyWith => __$DrillCopyWithImpl<_Drill>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Drill&&(identical(other.title, title) || other.title == title)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.shotCount, shotCount) || other.shotCount == shotCount)&&(identical(other.suggestedClub, suggestedClub) || other.suggestedClub == suggestedClub));
}


@override
int get hashCode {
    return Object.hash(runtimeType,title,instructions,shotCount,suggestedClub);
}

@override
String toString() {
    return 'Drill(title: $title, instructions: $instructions, shotCount: $shotCount, suggestedClub: $suggestedClub)';
}


}

/// @nodoc
abstract mixin class _$DrillCopyWith<$Res> implements $DrillCopyWith<$Res> {
  factory _$DrillCopyWith(_Drill value, $Res Function(_Drill) _then) = __$DrillCopyWithImpl;
@override @useResult
$Res call({
 String title, String instructions, int shotCount, GolfClub? suggestedClub
});




}
/// @nodoc
class __$DrillCopyWithImpl<$Res>
    implements _$DrillCopyWith<$Res> {
  __$DrillCopyWithImpl(this._self, this._then);

  final _Drill _self;
  final $Res Function(_Drill) _then;

/// Create a copy of Drill
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? instructions = null,Object? shotCount = null,Object? suggestedClub = freezed,}) {
  return _then(_Drill(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String,shotCount: null == shotCount ? _self.shotCount : shotCount // ignore: cast_nullable_to_non_nullable
as int,suggestedClub: freezed == suggestedClub ? _self.suggestedClub : suggestedClub // ignore: cast_nullable_to_non_nullable
as GolfClub?,
  ));
}


}

// dart format on
