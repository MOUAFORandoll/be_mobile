// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_user_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SendUserResponse _$SendUserResponseFromJson(Map<String, dynamic> json) {
  return _SendUserResponse.fromJson(json);
}

/// @nodoc
mixin _$SendUserResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  dynamic get content => throw _privateConstructorUsedError;

  /// Serializes this SendUserResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendUserResponseCopyWith<SendUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendUserResponseCopyWith<$Res> {
  factory $SendUserResponseCopyWith(
          SendUserResponse value, $Res Function(SendUserResponse) then) =
      _$SendUserResponseCopyWithImpl<$Res, SendUserResponse>;
  @useResult
  $Res call({bool success, String message, dynamic content});
}

/// @nodoc
class _$SendUserResponseCopyWithImpl<$Res, $Val extends SendUserResponse>
    implements $SendUserResponseCopyWith<$Res> {
  _$SendUserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? content = null,
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
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendUserResponseImplCopyWith<$Res>
    implements $SendUserResponseCopyWith<$Res> {
  factory _$$SendUserResponseImplCopyWith(_$SendUserResponseImpl value,
          $Res Function(_$SendUserResponseImpl) then) =
      __$$SendUserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, dynamic content});
}

/// @nodoc
class __$$SendUserResponseImplCopyWithImpl<$Res>
    extends _$SendUserResponseCopyWithImpl<$Res, _$SendUserResponseImpl>
    implements _$$SendUserResponseImplCopyWith<$Res> {
  __$$SendUserResponseImplCopyWithImpl(_$SendUserResponseImpl _value,
      $Res Function(_$SendUserResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? content = null,
  }) {
    return _then(_$SendUserResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendUserResponseImpl implements _SendUserResponse {
  const _$SendUserResponseImpl(
      {required this.success,
      required this.message,
      required final dynamic content})
      : _content = content;

  factory _$SendUserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendUserResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final dynamic _content;
  @override
  dynamic get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  String toString() {
    return 'SendUserResponse(success: $success, message: $message, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendUserResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._content, _content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message,
      const DeepCollectionEquality().hash(_content));

  /// Create a copy of SendUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendUserResponseImplCopyWith<_$SendUserResponseImpl> get copyWith =>
      __$$SendUserResponseImplCopyWithImpl<_$SendUserResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendUserResponseImplToJson(
      this,
    );
  }
}

abstract class _SendUserResponse implements SendUserResponse {
  const factory _SendUserResponse(
      {required final bool success,
      required final String message,
      required final dynamic content}) = _$SendUserResponseImpl;

  factory _SendUserResponse.fromJson(Map<String, dynamic> json) =
      _$SendUserResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  dynamic get content;

  /// Create a copy of SendUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendUserResponseImplCopyWith<_$SendUserResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
