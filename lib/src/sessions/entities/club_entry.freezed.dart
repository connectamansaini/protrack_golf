// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'club_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClubEntry {

 GolfClub get club; List<double> get distances; String get notes;
/// Create a copy of ClubEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClubEntryCopyWith<ClubEntry> get copyWith => _$ClubEntryCopyWithImpl<ClubEntry>(this as ClubEntry, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ClubEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClubEntry&&(identical(other.club, _this.club) || other.club == _this.club)&&const DeepCollectionEquality().equals(other.distances, _this.distances)&&(identical(other.notes, _this.notes) || other.notes == _this.notes));
}


@override
int get hashCode {
  final _this = this as ClubEntry;
  return Object.hash(runtimeType,_this.club,const DeepCollectionEquality().hash(_this.distances),_this.notes);
}

@override
String toString() {
  final _this = this as ClubEntry;
  return 'ClubEntry(club: ${_this.club}, distances: ${_this.distances}, notes: ${_this.notes})';
}


}

/// @nodoc
abstract mixin class $ClubEntryCopyWith<$Res>  {
  factory $ClubEntryCopyWith(ClubEntry value, $Res Function(ClubEntry) _then) = _$ClubEntryCopyWithImpl;
@useResult
$Res call({
 GolfClub club, List<double> distances, String notes
});




}
/// @nodoc
class _$ClubEntryCopyWithImpl<$Res>
    implements $ClubEntryCopyWith<$Res> {
  _$ClubEntryCopyWithImpl(this._self, this._then);

  final ClubEntry _self;
  final $Res Function(ClubEntry) _then;

/// Create a copy of ClubEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? club = null,Object? distances = null,Object? notes = null,}) {
  return _then(ClubEntry(
club: null == club ? _self.club : club // ignore: cast_nullable_to_non_nullable
as GolfClub,distances: null == distances ? _self.distances : distances // ignore: cast_nullable_to_non_nullable
as List<double>,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ClubEntry].
extension ClubEntryPatterns on ClubEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClubEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClubEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClubEntry value)  $default,){
final _that = this;
switch (_that) {
case _ClubEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClubEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ClubEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GolfClub club,  List<double> distances,  String notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClubEntry() when $default != null:
return $default(_that.club,_that.distances,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GolfClub club,  List<double> distances,  String notes)  $default,) {final _that = this;
switch (_that) {
case _ClubEntry():
return $default(_that.club,_that.distances,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GolfClub club,  List<double> distances,  String notes)?  $default,) {final _that = this;
switch (_that) {
case _ClubEntry() when $default != null:
return $default(_that.club,_that.distances,_that.notes);case _:
  return null;

}
}

}

/// @nodoc


class _ClubEntry extends ClubEntry {
  const _ClubEntry({this.club = GolfClub.driver,  List<double> distances = const <double>[], this.notes = ''}): _distances = distances,super._();
  

@override@JsonKey() final  GolfClub club;
 final  List<double> _distances;
@override@JsonKey() List<double> get distances {
  if (_distances is EqualUnmodifiableListView) return _distances;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_distances);
}

@override@JsonKey() final  String notes;

/// Create a copy of ClubEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClubEntryCopyWith<_ClubEntry> get copyWith => __$ClubEntryCopyWithImpl<_ClubEntry>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClubEntry&&(identical(other.club, club) || other.club == club)&&const DeepCollectionEquality().equals(other.distances, _distances)&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,club,const DeepCollectionEquality().hash(_distances),notes);
}

@override
String toString() {
    return 'ClubEntry(club: $club, distances: $distances, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$ClubEntryCopyWith<$Res> implements $ClubEntryCopyWith<$Res> {
  factory _$ClubEntryCopyWith(_ClubEntry value, $Res Function(_ClubEntry) _then) = __$ClubEntryCopyWithImpl;
@override @useResult
$Res call({
 GolfClub club, List<double> distances, String notes
});




}
/// @nodoc
class __$ClubEntryCopyWithImpl<$Res>
    implements _$ClubEntryCopyWith<$Res> {
  __$ClubEntryCopyWithImpl(this._self, this._then);

  final _ClubEntry _self;
  final $Res Function(_ClubEntry) _then;

/// Create a copy of ClubEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? club = null,Object? distances = null,Object? notes = null,}) {
  return _then(_ClubEntry(
club: null == club ? _self.club : club // ignore: cast_nullable_to_non_nullable
as GolfClub,distances: null == distances ? _self._distances : distances // ignore: cast_nullable_to_non_nullable
as List<double>,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
