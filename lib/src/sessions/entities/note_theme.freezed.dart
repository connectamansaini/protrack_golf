// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NoteTheme {

 String get keyword; int get sessionCount; bool get inThisSession;
/// Create a copy of NoteTheme
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoteThemeCopyWith<NoteTheme> get copyWith => _$NoteThemeCopyWithImpl<NoteTheme>(this as NoteTheme, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as NoteTheme;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoteTheme&&(identical(other.keyword, _this.keyword) || other.keyword == _this.keyword)&&(identical(other.sessionCount, _this.sessionCount) || other.sessionCount == _this.sessionCount)&&(identical(other.inThisSession, _this.inThisSession) || other.inThisSession == _this.inThisSession));
}


@override
int get hashCode {
  final _this = this as NoteTheme;
  return Object.hash(runtimeType,_this.keyword,_this.sessionCount,_this.inThisSession);
}

@override
String toString() {
  final _this = this as NoteTheme;
  return 'NoteTheme(keyword: ${_this.keyword}, sessionCount: ${_this.sessionCount}, inThisSession: ${_this.inThisSession})';
}


}

/// @nodoc
abstract mixin class $NoteThemeCopyWith<$Res>  {
  factory $NoteThemeCopyWith(NoteTheme value, $Res Function(NoteTheme) _then) = _$NoteThemeCopyWithImpl;
@useResult
$Res call({
 String keyword, int sessionCount, bool inThisSession
});




}
/// @nodoc
class _$NoteThemeCopyWithImpl<$Res>
    implements $NoteThemeCopyWith<$Res> {
  _$NoteThemeCopyWithImpl(this._self, this._then);

  final NoteTheme _self;
  final $Res Function(NoteTheme) _then;

/// Create a copy of NoteTheme
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? keyword = null,Object? sessionCount = null,Object? inThisSession = null,}) {
  return _then(NoteTheme(
keyword: null == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String,sessionCount: null == sessionCount ? _self.sessionCount : sessionCount // ignore: cast_nullable_to_non_nullable
as int,inThisSession: null == inThisSession ? _self.inThisSession : inThisSession // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NoteTheme].
extension NoteThemePatterns on NoteTheme {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NoteTheme value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NoteTheme() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NoteTheme value)  $default,){
final _that = this;
switch (_that) {
case _NoteTheme():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NoteTheme value)?  $default,){
final _that = this;
switch (_that) {
case _NoteTheme() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String keyword,  int sessionCount,  bool inThisSession)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NoteTheme() when $default != null:
return $default(_that.keyword,_that.sessionCount,_that.inThisSession);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String keyword,  int sessionCount,  bool inThisSession)  $default,) {final _that = this;
switch (_that) {
case _NoteTheme():
return $default(_that.keyword,_that.sessionCount,_that.inThisSession);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String keyword,  int sessionCount,  bool inThisSession)?  $default,) {final _that = this;
switch (_that) {
case _NoteTheme() when $default != null:
return $default(_that.keyword,_that.sessionCount,_that.inThisSession);case _:
  return null;

}
}

}

/// @nodoc


class _NoteTheme extends NoteTheme {
  const _NoteTheme({this.keyword = '', this.sessionCount = 0, this.inThisSession = false}): super._();
  

@override@JsonKey() final  String keyword;
@override@JsonKey() final  int sessionCount;
@override@JsonKey() final  bool inThisSession;

/// Create a copy of NoteTheme
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoteThemeCopyWith<_NoteTheme> get copyWith => __$NoteThemeCopyWithImpl<_NoteTheme>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoteTheme&&(identical(other.keyword, keyword) || other.keyword == keyword)&&(identical(other.sessionCount, sessionCount) || other.sessionCount == sessionCount)&&(identical(other.inThisSession, inThisSession) || other.inThisSession == inThisSession));
}


@override
int get hashCode {
    return Object.hash(runtimeType,keyword,sessionCount,inThisSession);
}

@override
String toString() {
    return 'NoteTheme(keyword: $keyword, sessionCount: $sessionCount, inThisSession: $inThisSession)';
}


}

/// @nodoc
abstract mixin class _$NoteThemeCopyWith<$Res> implements $NoteThemeCopyWith<$Res> {
  factory _$NoteThemeCopyWith(_NoteTheme value, $Res Function(_NoteTheme) _then) = __$NoteThemeCopyWithImpl;
@override @useResult
$Res call({
 String keyword, int sessionCount, bool inThisSession
});




}
/// @nodoc
class __$NoteThemeCopyWithImpl<$Res>
    implements _$NoteThemeCopyWith<$Res> {
  __$NoteThemeCopyWithImpl(this._self, this._then);

  final _NoteTheme _self;
  final $Res Function(_NoteTheme) _then;

/// Create a copy of NoteTheme
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? keyword = null,Object? sessionCount = null,Object? inThisSession = null,}) {
  return _then(_NoteTheme(
keyword: null == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String,sessionCount: null == sessionCount ? _self.sessionCount : sessionCount // ignore: cast_nullable_to_non_nullable
as int,inThisSession: null == inThisSession ? _self.inThisSession : inThisSession // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
