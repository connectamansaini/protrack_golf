// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'practice_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PracticeSession {

 DateTime get date; String get id; String get locationId; int get bucketSize; List<ClubEntry> get clubEntries; String get notes; List<String> get mediaPaths;
/// Create a copy of PracticeSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PracticeSessionCopyWith<PracticeSession> get copyWith => _$PracticeSessionCopyWithImpl<PracticeSession>(this as PracticeSession, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PracticeSession;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PracticeSession&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.locationId, _this.locationId) || other.locationId == _this.locationId)&&(identical(other.bucketSize, _this.bucketSize) || other.bucketSize == _this.bucketSize)&&const DeepCollectionEquality().equals(other.clubEntries, _this.clubEntries)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&const DeepCollectionEquality().equals(other.mediaPaths, _this.mediaPaths));
}


@override
int get hashCode {
  final _this = this as PracticeSession;
  return Object.hash(runtimeType,_this.date,_this.id,_this.locationId,_this.bucketSize,const DeepCollectionEquality().hash(_this.clubEntries),_this.notes,const DeepCollectionEquality().hash(_this.mediaPaths));
}

@override
String toString() {
  final _this = this as PracticeSession;
  return 'PracticeSession(date: ${_this.date}, id: ${_this.id}, locationId: ${_this.locationId}, bucketSize: ${_this.bucketSize}, clubEntries: ${_this.clubEntries}, notes: ${_this.notes}, mediaPaths: ${_this.mediaPaths})';
}


}

/// @nodoc
abstract mixin class $PracticeSessionCopyWith<$Res>  {
  factory $PracticeSessionCopyWith(PracticeSession value, $Res Function(PracticeSession) _then) = _$PracticeSessionCopyWithImpl;
@useResult
$Res call({
 DateTime date, String id, String locationId, int bucketSize, List<ClubEntry> clubEntries, String notes, List<String> mediaPaths
});




}
/// @nodoc
class _$PracticeSessionCopyWithImpl<$Res>
    implements $PracticeSessionCopyWith<$Res> {
  _$PracticeSessionCopyWithImpl(this._self, this._then);

  final PracticeSession _self;
  final $Res Function(PracticeSession) _then;

/// Create a copy of PracticeSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? id = null,Object? locationId = null,Object? bucketSize = null,Object? clubEntries = null,Object? notes = null,Object? mediaPaths = null,}) {
  return _then(PracticeSession(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,locationId: null == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as String,bucketSize: null == bucketSize ? _self.bucketSize : bucketSize // ignore: cast_nullable_to_non_nullable
as int,clubEntries: null == clubEntries ? _self.clubEntries : clubEntries // ignore: cast_nullable_to_non_nullable
as List<ClubEntry>,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,mediaPaths: null == mediaPaths ? _self.mediaPaths : mediaPaths // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [PracticeSession].
extension PracticeSessionPatterns on PracticeSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PracticeSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PracticeSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PracticeSession value)  $default,){
final _that = this;
switch (_that) {
case _PracticeSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PracticeSession value)?  $default,){
final _that = this;
switch (_that) {
case _PracticeSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  String id,  String locationId,  int bucketSize,  List<ClubEntry> clubEntries,  String notes,  List<String> mediaPaths)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PracticeSession() when $default != null:
return $default(_that.date,_that.id,_that.locationId,_that.bucketSize,_that.clubEntries,_that.notes,_that.mediaPaths);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  String id,  String locationId,  int bucketSize,  List<ClubEntry> clubEntries,  String notes,  List<String> mediaPaths)  $default,) {final _that = this;
switch (_that) {
case _PracticeSession():
return $default(_that.date,_that.id,_that.locationId,_that.bucketSize,_that.clubEntries,_that.notes,_that.mediaPaths);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  String id,  String locationId,  int bucketSize,  List<ClubEntry> clubEntries,  String notes,  List<String> mediaPaths)?  $default,) {final _that = this;
switch (_that) {
case _PracticeSession() when $default != null:
return $default(_that.date,_that.id,_that.locationId,_that.bucketSize,_that.clubEntries,_that.notes,_that.mediaPaths);case _:
  return null;

}
}

}

/// @nodoc


class _PracticeSession extends PracticeSession {
  const _PracticeSession({required this.date, this.id = '', this.locationId = '', this.bucketSize = 0,  List<ClubEntry> clubEntries = const <ClubEntry>[], this.notes = '',  List<String> mediaPaths = const <String>[]}): _clubEntries = clubEntries,_mediaPaths = mediaPaths,super._();
  

@override final  DateTime date;
@override@JsonKey() final  String id;
@override@JsonKey() final  String locationId;
@override@JsonKey() final  int bucketSize;
 final  List<ClubEntry> _clubEntries;
@override@JsonKey() List<ClubEntry> get clubEntries {
  if (_clubEntries is EqualUnmodifiableListView) return _clubEntries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_clubEntries);
}

@override@JsonKey() final  String notes;
 final  List<String> _mediaPaths;
@override@JsonKey() List<String> get mediaPaths {
  if (_mediaPaths is EqualUnmodifiableListView) return _mediaPaths;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mediaPaths);
}


/// Create a copy of PracticeSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PracticeSessionCopyWith<_PracticeSession> get copyWith => __$PracticeSessionCopyWithImpl<_PracticeSession>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PracticeSession&&(identical(other.date, date) || other.date == date)&&(identical(other.id, id) || other.id == id)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.bucketSize, bucketSize) || other.bucketSize == bucketSize)&&const DeepCollectionEquality().equals(other.clubEntries, _clubEntries)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.mediaPaths, _mediaPaths));
}


@override
int get hashCode {
    return Object.hash(runtimeType,date,id,locationId,bucketSize,const DeepCollectionEquality().hash(_clubEntries),notes,const DeepCollectionEquality().hash(_mediaPaths));
}

@override
String toString() {
    return 'PracticeSession(date: $date, id: $id, locationId: $locationId, bucketSize: $bucketSize, clubEntries: $clubEntries, notes: $notes, mediaPaths: $mediaPaths)';
}


}

/// @nodoc
abstract mixin class _$PracticeSessionCopyWith<$Res> implements $PracticeSessionCopyWith<$Res> {
  factory _$PracticeSessionCopyWith(_PracticeSession value, $Res Function(_PracticeSession) _then) = __$PracticeSessionCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, String id, String locationId, int bucketSize, List<ClubEntry> clubEntries, String notes, List<String> mediaPaths
});




}
/// @nodoc
class __$PracticeSessionCopyWithImpl<$Res>
    implements _$PracticeSessionCopyWith<$Res> {
  __$PracticeSessionCopyWithImpl(this._self, this._then);

  final _PracticeSession _self;
  final $Res Function(_PracticeSession) _then;

/// Create a copy of PracticeSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? id = null,Object? locationId = null,Object? bucketSize = null,Object? clubEntries = null,Object? notes = null,Object? mediaPaths = null,}) {
  return _then(_PracticeSession(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,locationId: null == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as String,bucketSize: null == bucketSize ? _self.bucketSize : bucketSize // ignore: cast_nullable_to_non_nullable
as int,clubEntries: null == clubEntries ? _self._clubEntries : clubEntries // ignore: cast_nullable_to_non_nullable
as List<ClubEntry>,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,mediaPaths: null == mediaPaths ? _self._mediaPaths : mediaPaths // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
