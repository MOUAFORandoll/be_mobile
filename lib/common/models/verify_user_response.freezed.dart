// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_user_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerifyUserResponse _$VerifyUserResponseFromJson(Map<String, dynamic> json) {
  return _VerifyUserResponse.fromJson(json);
}

/// @nodoc
mixin _$VerifyUserResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  dynamic get content => throw _privateConstructorUsedError;

  /// Serializes this VerifyUserResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifyUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyUserResponseCopyWith<VerifyUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyUserResponseCopyWith<$Res> {
  factory $VerifyUserResponseCopyWith(
          VerifyUserResponse value, $Res Function(VerifyUserResponse) then) =
      _$VerifyUserResponseCopyWithImpl<$Res, VerifyUserResponse>;
  @useResult
  $Res call({bool success, String message, dynamic content});
}

/// @nodoc
class _$VerifyUserResponseCopyWithImpl<$Res, $Val extends VerifyUserResponse>
    implements $VerifyUserResponseCopyWith<$Res> {
  _$VerifyUserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyUserResponseImplCopyWith<$Res>
    implements $VerifyUserResponseCopyWith<$Res> {
  factory _$$VerifyUserResponseImplCopyWith(_$VerifyUserResponseImpl value,
          $Res Function(_$VerifyUserResponseImpl) then) =
      __$$VerifyUserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, dynamic content});
}

/// @nodoc
class __$$VerifyUserResponseImplCopyWithImpl<$Res>
    extends _$VerifyUserResponseCopyWithImpl<$Res, _$VerifyUserResponseImpl>
    implements _$$VerifyUserResponseImplCopyWith<$Res> {
  __$$VerifyUserResponseImplCopyWithImpl(_$VerifyUserResponseImpl _value,
      $Res Function(_$VerifyUserResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerifyUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? content = freezed,
  }) {
    return _then(_$VerifyUserResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyUserResponseImpl implements _VerifyUserResponse {
  const _$VerifyUserResponseImpl(
      {required this.success, required this.message, required this.content});

  factory _$VerifyUserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyUserResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final dynamic content;

  @override
  String toString() {
    return 'VerifyUserResponse(success: $success, message: $message, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyUserResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message,
      const DeepCollectionEquality().hash(content));

  /// Create a copy of VerifyUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyUserResponseImplCopyWith<_$VerifyUserResponseImpl> get copyWith =>
      __$$VerifyUserResponseImplCopyWithImpl<_$VerifyUserResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyUserResponseImplToJson(
      this,
    );
  }
}

abstract class _VerifyUserResponse implements VerifyUserResponse {
  const factory _VerifyUserResponse(
      {required final bool success,
      required final String message,
      required final dynamic content}) = _$VerifyUserResponseImpl;

  factory _VerifyUserResponse.fromJson(Map<String, dynamic> json) =
      _$VerifyUserResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  dynamic get content;

  /// Create a copy of VerifyUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyUserResponseImplCopyWith<_$VerifyUserResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}