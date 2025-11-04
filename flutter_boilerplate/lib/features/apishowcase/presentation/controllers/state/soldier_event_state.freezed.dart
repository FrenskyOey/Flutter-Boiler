// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'soldier_event_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SoldierEventState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SoldierEventState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SoldierEventState()';
}


}

/// @nodoc
class $SoldierEventStateCopyWith<$Res>  {
$SoldierEventStateCopyWith(SoldierEventState _, $Res Function(SoldierEventState) __);
}


/// Adds pattern-matching-related methods to [SoldierEventState].
extension SoldierEventStatePatterns on SoldierEventState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ToastError value)?  toastError,TResult Function( _ToastSuccess value)?  toastSuccess,TResult Function( _OpenUser value)?  openUser,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToastError() when toastError != null:
return toastError(_that);case _ToastSuccess() when toastSuccess != null:
return toastSuccess(_that);case _OpenUser() when openUser != null:
return openUser(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ToastError value)  toastError,required TResult Function( _ToastSuccess value)  toastSuccess,required TResult Function( _OpenUser value)  openUser,}){
final _that = this;
switch (_that) {
case _ToastError():
return toastError(_that);case _ToastSuccess():
return toastSuccess(_that);case _OpenUser():
return openUser(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ToastError value)?  toastError,TResult? Function( _ToastSuccess value)?  toastSuccess,TResult? Function( _OpenUser value)?  openUser,}){
final _that = this;
switch (_that) {
case _ToastError() when toastError != null:
return toastError(_that);case _ToastSuccess() when toastSuccess != null:
return toastSuccess(_that);case _OpenUser() when openUser != null:
return openUser(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String messgae)?  toastError,TResult Function( String messgae)?  toastSuccess,TResult Function( Soldier selectedSoldier)?  openUser,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToastError() when toastError != null:
return toastError(_that.messgae);case _ToastSuccess() when toastSuccess != null:
return toastSuccess(_that.messgae);case _OpenUser() when openUser != null:
return openUser(_that.selectedSoldier);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String messgae)  toastError,required TResult Function( String messgae)  toastSuccess,required TResult Function( Soldier selectedSoldier)  openUser,}) {final _that = this;
switch (_that) {
case _ToastError():
return toastError(_that.messgae);case _ToastSuccess():
return toastSuccess(_that.messgae);case _OpenUser():
return openUser(_that.selectedSoldier);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String messgae)?  toastError,TResult? Function( String messgae)?  toastSuccess,TResult? Function( Soldier selectedSoldier)?  openUser,}) {final _that = this;
switch (_that) {
case _ToastError() when toastError != null:
return toastError(_that.messgae);case _ToastSuccess() when toastSuccess != null:
return toastSuccess(_that.messgae);case _OpenUser() when openUser != null:
return openUser(_that.selectedSoldier);case _:
  return null;

}
}

}

/// @nodoc


class _ToastError implements SoldierEventState {
  const _ToastError(this.messgae);
  

 final  String messgae;

/// Create a copy of SoldierEventState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToastErrorCopyWith<_ToastError> get copyWith => __$ToastErrorCopyWithImpl<_ToastError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToastError&&(identical(other.messgae, messgae) || other.messgae == messgae));
}


@override
int get hashCode => Object.hash(runtimeType,messgae);

@override
String toString() {
  return 'SoldierEventState.toastError(messgae: $messgae)';
}


}

/// @nodoc
abstract mixin class _$ToastErrorCopyWith<$Res> implements $SoldierEventStateCopyWith<$Res> {
  factory _$ToastErrorCopyWith(_ToastError value, $Res Function(_ToastError) _then) = __$ToastErrorCopyWithImpl;
@useResult
$Res call({
 String messgae
});




}
/// @nodoc
class __$ToastErrorCopyWithImpl<$Res>
    implements _$ToastErrorCopyWith<$Res> {
  __$ToastErrorCopyWithImpl(this._self, this._then);

  final _ToastError _self;
  final $Res Function(_ToastError) _then;

/// Create a copy of SoldierEventState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messgae = null,}) {
  return _then(_ToastError(
null == messgae ? _self.messgae : messgae // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ToastSuccess implements SoldierEventState {
  const _ToastSuccess(this.messgae);
  

 final  String messgae;

/// Create a copy of SoldierEventState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToastSuccessCopyWith<_ToastSuccess> get copyWith => __$ToastSuccessCopyWithImpl<_ToastSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToastSuccess&&(identical(other.messgae, messgae) || other.messgae == messgae));
}


@override
int get hashCode => Object.hash(runtimeType,messgae);

@override
String toString() {
  return 'SoldierEventState.toastSuccess(messgae: $messgae)';
}


}

/// @nodoc
abstract mixin class _$ToastSuccessCopyWith<$Res> implements $SoldierEventStateCopyWith<$Res> {
  factory _$ToastSuccessCopyWith(_ToastSuccess value, $Res Function(_ToastSuccess) _then) = __$ToastSuccessCopyWithImpl;
@useResult
$Res call({
 String messgae
});




}
/// @nodoc
class __$ToastSuccessCopyWithImpl<$Res>
    implements _$ToastSuccessCopyWith<$Res> {
  __$ToastSuccessCopyWithImpl(this._self, this._then);

  final _ToastSuccess _self;
  final $Res Function(_ToastSuccess) _then;

/// Create a copy of SoldierEventState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messgae = null,}) {
  return _then(_ToastSuccess(
null == messgae ? _self.messgae : messgae // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _OpenUser implements SoldierEventState {
  const _OpenUser(this.selectedSoldier);
  

 final  Soldier selectedSoldier;

/// Create a copy of SoldierEventState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenUserCopyWith<_OpenUser> get copyWith => __$OpenUserCopyWithImpl<_OpenUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenUser&&(identical(other.selectedSoldier, selectedSoldier) || other.selectedSoldier == selectedSoldier));
}


@override
int get hashCode => Object.hash(runtimeType,selectedSoldier);

@override
String toString() {
  return 'SoldierEventState.openUser(selectedSoldier: $selectedSoldier)';
}


}

/// @nodoc
abstract mixin class _$OpenUserCopyWith<$Res> implements $SoldierEventStateCopyWith<$Res> {
  factory _$OpenUserCopyWith(_OpenUser value, $Res Function(_OpenUser) _then) = __$OpenUserCopyWithImpl;
@useResult
$Res call({
 Soldier selectedSoldier
});


$SoldierCopyWith<$Res> get selectedSoldier;

}
/// @nodoc
class __$OpenUserCopyWithImpl<$Res>
    implements _$OpenUserCopyWith<$Res> {
  __$OpenUserCopyWithImpl(this._self, this._then);

  final _OpenUser _self;
  final $Res Function(_OpenUser) _then;

/// Create a copy of SoldierEventState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedSoldier = null,}) {
  return _then(_OpenUser(
null == selectedSoldier ? _self.selectedSoldier : selectedSoldier // ignore: cast_nullable_to_non_nullable
as Soldier,
  ));
}

/// Create a copy of SoldierEventState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SoldierCopyWith<$Res> get selectedSoldier {
  
  return $SoldierCopyWith<$Res>(_self.selectedSoldier, (value) {
    return _then(_self.copyWith(selectedSoldier: value));
  });
}
}

// dart format on
