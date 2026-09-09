// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppStatus<F> {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AppStatus<F>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AppStatus<$F>()';
}


}

/// @nodoc
class $AppStatusCopyWith<F,$Res>  {
$AppStatusCopyWith(AppStatus<F> _, $Res Function(AppStatus<F>) __);
}


/// Adds pattern-matching-related methods to [AppStatus].
extension AppStatusPatterns<F> on AppStatus<F> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AppStatusInitial<F> value)?  initial,TResult Function( AppStatusLoading<F> value)?  loading,TResult Function( AppStatusSuccess<F> value)?  success,TResult Function( AppStatusEmpty<F> value)?  empty,TResult Function( AppStatusFailure<F> value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AppStatusInitial() when initial != null:
return initial(_that);case AppStatusLoading() when loading != null:
return loading(_that);case AppStatusSuccess() when success != null:
return success(_that);case AppStatusEmpty() when empty != null:
return empty(_that);case AppStatusFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AppStatusInitial<F> value)  initial,required TResult Function( AppStatusLoading<F> value)  loading,required TResult Function( AppStatusSuccess<F> value)  success,required TResult Function( AppStatusEmpty<F> value)  empty,required TResult Function( AppStatusFailure<F> value)  failure,}){
final _that = this;
switch (_that) {
case AppStatusInitial():
return initial(_that);case AppStatusLoading():
return loading(_that);case AppStatusSuccess():
return success(_that);case AppStatusEmpty():
return empty(_that);case AppStatusFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AppStatusInitial<F> value)?  initial,TResult? Function( AppStatusLoading<F> value)?  loading,TResult? Function( AppStatusSuccess<F> value)?  success,TResult? Function( AppStatusEmpty<F> value)?  empty,TResult? Function( AppStatusFailure<F> value)?  failure,}){
final _that = this;
switch (_that) {
case AppStatusInitial() when initial != null:
return initial(_that);case AppStatusLoading() when loading != null:
return loading(_that);case AppStatusSuccess() when success != null:
return success(_that);case AppStatusEmpty() when empty != null:
return empty(_that);case AppStatusFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function()?  empty,TResult Function( F failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AppStatusInitial() when initial != null:
return initial();case AppStatusLoading() when loading != null:
return loading();case AppStatusSuccess() when success != null:
return success();case AppStatusEmpty() when empty != null:
return empty();case AppStatusFailure() when failure != null:
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function()  empty,required TResult Function( F failure)  failure,}) {final _that = this;
switch (_that) {
case AppStatusInitial():
return initial();case AppStatusLoading():
return loading();case AppStatusSuccess():
return success();case AppStatusEmpty():
return empty();case AppStatusFailure():
return failure(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function()?  empty,TResult? Function( F failure)?  failure,}) {final _that = this;
switch (_that) {
case AppStatusInitial() when initial != null:
return initial();case AppStatusLoading() when loading != null:
return loading();case AppStatusSuccess() when success != null:
return success();case AppStatusEmpty() when empty != null:
return empty();case AppStatusFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class AppStatusInitial<F> implements AppStatus<F> {
  const AppStatusInitial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AppStatusInitial<F>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AppStatus<$F>.initial()';
}


}




/// @nodoc


class AppStatusLoading<F> implements AppStatus<F> {
  const AppStatusLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AppStatusLoading<F>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AppStatus<$F>.loading()';
}


}




/// @nodoc


class AppStatusSuccess<F> implements AppStatus<F> {
  const AppStatusSuccess();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AppStatusSuccess<F>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AppStatus<$F>.success()';
}


}




/// @nodoc


class AppStatusEmpty<F> implements AppStatus<F> {
  const AppStatusEmpty();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AppStatusEmpty<F>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AppStatus<$F>.empty()';
}


}




/// @nodoc


class AppStatusFailure<F> implements AppStatus<F> {
  const AppStatusFailure(this.failure);
  

 final  F failure;

/// Create a copy of AppStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppStatusFailureCopyWith<F, AppStatusFailure<F>> get copyWith => _$AppStatusFailureCopyWithImpl<F, AppStatusFailure<F>>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AppStatusFailure<F>&&const DeepCollectionEquality().equals(other.failure, failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(failure));
}

@override
String toString() {
    return 'AppStatus<$F>.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $AppStatusFailureCopyWith<F,$Res> implements $AppStatusCopyWith<F, $Res> {
  factory $AppStatusFailureCopyWith(AppStatusFailure<F> value, $Res Function(AppStatusFailure<F>) _then) = _$AppStatusFailureCopyWithImpl;
@useResult
$Res call({
 F failure
});




}
/// @nodoc
class _$AppStatusFailureCopyWithImpl<F,$Res>
    implements $AppStatusFailureCopyWith<F, $Res> {
  _$AppStatusFailureCopyWithImpl(this._self, this._then);

  final AppStatusFailure<F> _self;
  final $Res Function(AppStatusFailure<F>) _then;

/// Create a copy of AppStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = freezed,}) {
  return _then(AppStatusFailure<F>(
freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as F,
  ));
}


}

// dart format on
