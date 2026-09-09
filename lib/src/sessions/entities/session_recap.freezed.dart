// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_recap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SessionRecap {

 PracticeSession get session; List<ClubRecap> get clubRecaps; List<NoteTheme> get recurringThemes;/// How many recent sessions (including this one) the themes were
/// counted over.
 int get themeWindowSessions;
/// Create a copy of SessionRecap
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionRecapCopyWith<SessionRecap> get copyWith => _$SessionRecapCopyWithImpl<SessionRecap>(this as SessionRecap, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SessionRecap;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionRecap&&(identical(other.session, _this.session) || other.session == _this.session)&&const DeepCollectionEquality().equals(other.clubRecaps, _this.clubRecaps)&&const DeepCollectionEquality().equals(other.recurringThemes, _this.recurringThemes)&&(identical(other.themeWindowSessions, _this.themeWindowSessions) || other.themeWindowSessions == _this.themeWindowSessions));
}


@override
int get hashCode {
  final _this = this as SessionRecap;
  return Object.hash(runtimeType,_this.session,const DeepCollectionEquality().hash(_this.clubRecaps),const DeepCollectionEquality().hash(_this.recurringThemes),_this.themeWindowSessions);
}

@override
String toString() {
  final _this = this as SessionRecap;
  return 'SessionRecap(session: ${_this.session}, clubRecaps: ${_this.clubRecaps}, recurringThemes: ${_this.recurringThemes}, themeWindowSessions: ${_this.themeWindowSessions})';
}


}

/// @nodoc
abstract mixin class $SessionRecapCopyWith<$Res>  {
  factory $SessionRecapCopyWith(SessionRecap value, $Res Function(SessionRecap) _then) = _$SessionRecapCopyWithImpl;
@useResult
$Res call({
 PracticeSession session, List<ClubRecap> clubRecaps, List<NoteTheme> recurringThemes, int themeWindowSessions
});


$PracticeSessionCopyWith<$Res> get session;

}
/// @nodoc
class _$SessionRecapCopyWithImpl<$Res>
    implements $SessionRecapCopyWith<$Res> {
  _$SessionRecapCopyWithImpl(this._self, this._then);

  final SessionRecap _self;
  final $Res Function(SessionRecap) _then;

/// Create a copy of SessionRecap
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? session = null,Object? clubRecaps = null,Object? recurringThemes = null,Object? themeWindowSessions = null,}) {
  return _then(SessionRecap(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as PracticeSession,clubRecaps: null == clubRecaps ? _self.clubRecaps : clubRecaps // ignore: cast_nullable_to_non_nullable
as List<ClubRecap>,recurringThemes: null == recurringThemes ? _self.recurringThemes : recurringThemes // ignore: cast_nullable_to_non_nullable
as List<NoteTheme>,themeWindowSessions: null == themeWindowSessions ? _self.themeWindowSessions : themeWindowSessions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of SessionRecap
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PracticeSessionCopyWith<$Res> get session {
  
  return $PracticeSessionCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}


/// Adds pattern-matching-related methods to [SessionRecap].
extension SessionRecapPatterns on SessionRecap {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionRecap value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionRecap() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionRecap value)  $default,){
final _that = this;
switch (_that) {
case _SessionRecap():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionRecap value)?  $default,){
final _that = this;
switch (_that) {
case _SessionRecap() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PracticeSession session,  List<ClubRecap> clubRecaps,  List<NoteTheme> recurringThemes,  int themeWindowSessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionRecap() when $default != null:
return $default(_that.session,_that.clubRecaps,_that.recurringThemes,_that.themeWindowSessions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PracticeSession session,  List<ClubRecap> clubRecaps,  List<NoteTheme> recurringThemes,  int themeWindowSessions)  $default,) {final _that = this;
switch (_that) {
case _SessionRecap():
return $default(_that.session,_that.clubRecaps,_that.recurringThemes,_that.themeWindowSessions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PracticeSession session,  List<ClubRecap> clubRecaps,  List<NoteTheme> recurringThemes,  int themeWindowSessions)?  $default,) {final _that = this;
switch (_that) {
case _SessionRecap() when $default != null:
return $default(_that.session,_that.clubRecaps,_that.recurringThemes,_that.themeWindowSessions);case _:
  return null;

}
}

}

/// @nodoc


class _SessionRecap extends SessionRecap {
  const _SessionRecap({required this.session,  List<ClubRecap> clubRecaps = const <ClubRecap>[],  List<NoteTheme> recurringThemes = const <NoteTheme>[], this.themeWindowSessions = 0}): _clubRecaps = clubRecaps,_recurringThemes = recurringThemes,super._();
  

@override final  PracticeSession session;
 final  List<ClubRecap> _clubRecaps;
@override@JsonKey() List<ClubRecap> get clubRecaps {
  if (_clubRecaps is EqualUnmodifiableListView) return _clubRecaps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_clubRecaps);
}

 final  List<NoteTheme> _recurringThemes;
@override@JsonKey() List<NoteTheme> get recurringThemes {
  if (_recurringThemes is EqualUnmodifiableListView) return _recurringThemes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recurringThemes);
}

/// How many recent sessions (including this one) the themes were
/// counted over.
@override@JsonKey() final  int themeWindowSessions;

/// Create a copy of SessionRecap
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionRecapCopyWith<_SessionRecap> get copyWith => __$SessionRecapCopyWithImpl<_SessionRecap>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionRecap&&(identical(other.session, session) || other.session == session)&&const DeepCollectionEquality().equals(other.clubRecaps, _clubRecaps)&&const DeepCollectionEquality().equals(other.recurringThemes, _recurringThemes)&&(identical(other.themeWindowSessions, themeWindowSessions) || other.themeWindowSessions == themeWindowSessions));
}


@override
int get hashCode {
    return Object.hash(runtimeType,session,const DeepCollectionEquality().hash(_clubRecaps),const DeepCollectionEquality().hash(_recurringThemes),themeWindowSessions);
}

@override
String toString() {
    return 'SessionRecap(session: $session, clubRecaps: $clubRecaps, recurringThemes: $recurringThemes, themeWindowSessions: $themeWindowSessions)';
}


}

/// @nodoc
abstract mixin class _$SessionRecapCopyWith<$Res> implements $SessionRecapCopyWith<$Res> {
  factory _$SessionRecapCopyWith(_SessionRecap value, $Res Function(_SessionRecap) _then) = __$SessionRecapCopyWithImpl;
@override @useResult
$Res call({
 PracticeSession session, List<ClubRecap> clubRecaps, List<NoteTheme> recurringThemes, int themeWindowSessions
});


@override $PracticeSessionCopyWith<$Res> get session;

}
/// @nodoc
class __$SessionRecapCopyWithImpl<$Res>
    implements _$SessionRecapCopyWith<$Res> {
  __$SessionRecapCopyWithImpl(this._self, this._then);

  final _SessionRecap _self;
  final $Res Function(_SessionRecap) _then;

/// Create a copy of SessionRecap
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? session = null,Object? clubRecaps = null,Object? recurringThemes = null,Object? themeWindowSessions = null,}) {
  return _then(_SessionRecap(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as PracticeSession,clubRecaps: null == clubRecaps ? _self._clubRecaps : clubRecaps // ignore: cast_nullable_to_non_nullable
as List<ClubRecap>,recurringThemes: null == recurringThemes ? _self._recurringThemes : recurringThemes // ignore: cast_nullable_to_non_nullable
as List<NoteTheme>,themeWindowSessions: null == themeWindowSessions ? _self.themeWindowSessions : themeWindowSessions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of SessionRecap
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PracticeSessionCopyWith<$Res> get session {
  
  return $PracticeSessionCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

// dart format on
