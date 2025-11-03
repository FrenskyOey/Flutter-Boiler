// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'soldier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Soldier {

 String get name; String get avatar;
/// Create a copy of Soldier
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SoldierCopyWith<Soldier> get copyWith => _$SoldierCopyWithImpl<Soldier>(this as Soldier, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Soldier&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}


@override
int get hashCode => Object.hash(runtimeType,name,avatar);

@override
String toString() {
  return 'Soldier(name: $name, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class $SoldierCopyWith<$Res>  {
  factory $SoldierCopyWith(Soldier value, $Res Function(Soldier) _then) = _$SoldierCopyWithImpl;
@useResult
$Res call({
 String name, String avatar
});




}
/// @nodoc
class _$SoldierCopyWithImpl<$Res>
    implements $SoldierCopyWith<$Res> {
  _$SoldierCopyWithImpl(this._self, this._then);

  final Soldier _self;
  final $Res Function(Soldier) _then;

/// Create a copy of Soldier
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? avatar = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Soldier].
extension SoldierPatterns on Soldier {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Soldier value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Soldier() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Soldier value)  $default,){
final _that = this;
switch (_that) {
case _Soldier():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Soldier value)?  $default,){
final _that = this;
switch (_that) {
case _Soldier() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String avatar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Soldier() when $default != null:
return $default(_that.name,_that.avatar);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String avatar)  $default,) {final _that = this;
switch (_that) {
case _Soldier():
return $default(_that.name,_that.avatar);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String avatar)?  $default,) {final _that = this;
switch (_that) {
case _Soldier() when $default != null:
return $default(_that.name,_that.avatar);case _:
  return null;

}
}

}

/// @nodoc


class _Soldier implements Soldier {
  const _Soldier({this.name = "", this.avatar = ""});
  

@override@JsonKey() final  String name;
@override@JsonKey() final  String avatar;

/// Create a copy of Soldier
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SoldierCopyWith<_Soldier> get copyWith => __$SoldierCopyWithImpl<_Soldier>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Soldier&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}


@override
int get hashCode => Object.hash(runtimeType,name,avatar);

@override
String toString() {
  return 'Soldier(name: $name, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class _$SoldierCopyWith<$Res> implements $SoldierCopyWith<$Res> {
  factory _$SoldierCopyWith(_Soldier value, $Res Function(_Soldier) _then) = __$SoldierCopyWithImpl;
@override @useResult
$Res call({
 String name, String avatar
});




}
/// @nodoc
class __$SoldierCopyWithImpl<$Res>
    implements _$SoldierCopyWith<$Res> {
  __$SoldierCopyWithImpl(this._self, this._then);

  final _Soldier _self;
  final $Res Function(_Soldier) _then;

/// Create a copy of Soldier
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? avatar = null,}) {
  return _then(_Soldier(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
