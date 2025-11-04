// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'soldier_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SoldierResponse {

 String get name; String get img;
/// Create a copy of SoldierResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SoldierResponseCopyWith<SoldierResponse> get copyWith => _$SoldierResponseCopyWithImpl<SoldierResponse>(this as SoldierResponse, _$identity);

  /// Serializes this SoldierResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SoldierResponse&&(identical(other.name, name) || other.name == name)&&(identical(other.img, img) || other.img == img));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,img);

@override
String toString() {
  return 'SoldierResponse(name: $name, img: $img)';
}


}

/// @nodoc
abstract mixin class $SoldierResponseCopyWith<$Res>  {
  factory $SoldierResponseCopyWith(SoldierResponse value, $Res Function(SoldierResponse) _then) = _$SoldierResponseCopyWithImpl;
@useResult
$Res call({
 String name, String img
});




}
/// @nodoc
class _$SoldierResponseCopyWithImpl<$Res>
    implements $SoldierResponseCopyWith<$Res> {
  _$SoldierResponseCopyWithImpl(this._self, this._then);

  final SoldierResponse _self;
  final $Res Function(SoldierResponse) _then;

/// Create a copy of SoldierResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? img = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,img: null == img ? _self.img : img // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SoldierResponse].
extension SoldierResponsePatterns on SoldierResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SoldierResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SoldierResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SoldierResponse value)  $default,){
final _that = this;
switch (_that) {
case _SoldierResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SoldierResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SoldierResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String img)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SoldierResponse() when $default != null:
return $default(_that.name,_that.img);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String img)  $default,) {final _that = this;
switch (_that) {
case _SoldierResponse():
return $default(_that.name,_that.img);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String img)?  $default,) {final _that = this;
switch (_that) {
case _SoldierResponse() when $default != null:
return $default(_that.name,_that.img);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SoldierResponse extends SoldierResponse {
  const _SoldierResponse({this.name = '', this.img = ''}): super._();
  factory _SoldierResponse.fromJson(Map<String, dynamic> json) => _$SoldierResponseFromJson(json);

@override@JsonKey() final  String name;
@override@JsonKey() final  String img;

/// Create a copy of SoldierResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SoldierResponseCopyWith<_SoldierResponse> get copyWith => __$SoldierResponseCopyWithImpl<_SoldierResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SoldierResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SoldierResponse&&(identical(other.name, name) || other.name == name)&&(identical(other.img, img) || other.img == img));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,img);

@override
String toString() {
  return 'SoldierResponse(name: $name, img: $img)';
}


}

/// @nodoc
abstract mixin class _$SoldierResponseCopyWith<$Res> implements $SoldierResponseCopyWith<$Res> {
  factory _$SoldierResponseCopyWith(_SoldierResponse value, $Res Function(_SoldierResponse) _then) = __$SoldierResponseCopyWithImpl;
@override @useResult
$Res call({
 String name, String img
});




}
/// @nodoc
class __$SoldierResponseCopyWithImpl<$Res>
    implements _$SoldierResponseCopyWith<$Res> {
  __$SoldierResponseCopyWithImpl(this._self, this._then);

  final _SoldierResponse _self;
  final $Res Function(_SoldierResponse) _then;

/// Create a copy of SoldierResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? img = null,}) {
  return _then(_SoldierResponse(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,img: null == img ? _self.img : img // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
