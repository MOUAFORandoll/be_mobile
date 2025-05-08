// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exist_user_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExistUserResponse _$ExistUserResponseFromJson(Map<String, dynamic> json) {
  return _ExistUserResponse.fromJson(json);
}

/// @nodoc
mixin _$ExistUserResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  ExistUserContent? get content => throw _privateConstructorUsedError;

  /// Serializes this ExistUserResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExistUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExistUserResponseCopyWith<ExistUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExistUserResponseCopyWith<$Res> {
  factory $ExistUserResponseCopyWith(
          ExistUserResponse value, $Res Function(ExistUserResponse) then) =
      _$ExistUserResponseCopyWithImpl<$Res, ExistUserResponse>;
  @useResult
  $Res call({bool success, String message, ExistUserContent? content});

  $ExistUserContentCopyWith<$Res>? get content;
}

/// @nodoc
class _$ExistUserResponseCopyWithImpl<$Res, $Val extends ExistUserResponse>
    implements $ExistUserResponseCopyWith<$Res> {
  _$ExistUserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExistUserResponse
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
              as ExistUserContent?,
    ) as $Val);
  }

  /// Create a copy of ExistUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExistUserContentCopyWith<$Res>? get content {
    if (_value.content == null) {
      return null;
    }

    return $ExistUserContentCopyWith<$Res>(_value.content!, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExistUserResponseImplCopyWith<$Res>
    implements $ExistUserResponseCopyWith<$Res> {
  factory _$$ExistUserResponseImplCopyWith(_$ExistUserResponseImpl value,
          $Res Function(_$ExistUserResponseImpl) then) =
      __$$ExistUserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, ExistUserContent? content});

  @override
  $ExistUserContentCopyWith<$Res>? get content;
}

/// @nodoc
class __$$ExistUserResponseImplCopyWithImpl<$Res>
    extends _$ExistUserResponseCopyWithImpl<$Res, _$ExistUserResponseImpl>
    implements _$$ExistUserResponseImplCopyWith<$Res> {
  __$$ExistUserResponseImplCopyWithImpl(_$ExistUserResponseImpl _value,
      $Res Function(_$ExistUserResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExistUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? content = freezed,
  }) {
    return _then(_$ExistUserResponseImpl(
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
              as ExistUserContent?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExistUserResponseImpl implements _ExistUserResponse {
  const _$ExistUserResponseImpl(
      {required this.success, required this.message, required this.content});

  factory _$ExistUserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExistUserResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final ExistUserContent? content;

  @override
  String toString() {
    return 'ExistUserResponse(success: $success, message: $message, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExistUserResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, content);

  /// Create a copy of ExistUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExistUserResponseImplCopyWith<_$ExistUserResponseImpl> get copyWith =>
      __$$ExistUserResponseImplCopyWithImpl<_$ExistUserResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExistUserResponseImplToJson(
      this,
    );
  }
}

abstract class _ExistUserResponse implements ExistUserResponse {
  const factory _ExistUserResponse(
      {required final bool success,
      required final String message,
      required final ExistUserContent? content}) = _$ExistUserResponseImpl;

  factory _ExistUserResponse.fromJson(Map<String, dynamic> json) =
      _$ExistUserResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  ExistUserContent? get content;

  /// Create a copy of ExistUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExistUserResponseImplCopyWith<_$ExistUserResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExistUserContent _$ExistUserContentFromJson(Map<String, dynamic> json) {
  return _ExistUserContent.fromJson(json);
}

/// @nodoc
mixin _$ExistUserContent {
  @JsonKey(name: 'exist_status')
  bool get existStatus => throw _privateConstructorUsedError;

  /// Serializes this ExistUserContent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExistUserContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExistUserContentCopyWith<ExistUserContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExistUserContentCopyWith<$Res> {
  factory $ExistUserContentCopyWith(
          ExistUserContent value, $Res Function(ExistUserContent) then) =
      _$ExistUserContentCopyWithImpl<$Res, ExistUserContent>;
  @useResult
  $Res call({@JsonKey(name: 'exist_status') bool existStatus});
}

/// @nodoc
class _$ExistUserContentCopyWithImpl<$Res, $Val extends ExistUserContent>
    implements $ExistUserContentCopyWith<$Res> {
  _$ExistUserContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExistUserContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? existStatus = null,
  }) {
    return _then(_value.copyWith(
      existStatus: null == existStatus
          ? _value.existStatus
          : existStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExistUserContentImplCopyWith<$Res>
    implements $ExistUserContentCopyWith<$Res> {
  factory _$$ExistUserContentImplCopyWith(_$ExistUserContentImpl value,
          $Res Function(_$ExistUserContentImpl) then) =
      __$$ExistUserContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'exist_status') bool existStatus});
}

/// @nodoc
class __$$ExistUserContentImplCopyWithImpl<$Res>
    extends _$ExistUserContentCopyWithImpl<$Res, _$ExistUserContentImpl>
    implements _$$ExistUserContentImplCopyWith<$Res> {
  __$$ExistUserContentImplCopyWithImpl(_$ExistUserContentImpl _value,
      $Res Function(_$ExistUserContentImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExistUserContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? existStatus = null,
  }) {
    return _then(_$ExistUserContentImpl(
      existStatus: null == existStatus
          ? _value.existStatus
          : existStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExistUserContentImpl implements _ExistUserContent {
  const _$ExistUserContentImpl(
      {@JsonKey(name: 'exist_status') required this.existStatus});

  factory _$ExistUserContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExistUserContentImplFromJson(json);

  @override
  @JsonKey(name: 'exist_status')
  final bool existStatus;

  @override
  String toString() {
    return 'ExistUserContent(existStatus: $existStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExistUserContentImpl &&
            (identical(other.existStatus, existStatus) ||
                other.existStatus == existStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, existStatus);

  /// Create a copy of ExistUserContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExistUserContentImplCopyWith<_$ExistUserContentImpl> get copyWith =>
      __$$ExistUserContentImplCopyWithImpl<_$ExistUserContentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExistUserContentImplToJson(
      this,
    );
  }
}

abstract class _ExistUserContent implements ExistUserContent {
  const factory _ExistUserContent(
          {@JsonKey(name: 'exist_status') required final bool existStatus}) =
      _$ExistUserContentImpl;

  factory _ExistUserContent.fromJson(Map<String, dynamic> json) =
      _$ExistUserContentImpl.fromJson;

  @override
  @JsonKey(name: 'exist_status')
  bool get existStatus;

  /// Create a copy of ExistUserContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExistUserContentImplCopyWith<_$ExistUserContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
