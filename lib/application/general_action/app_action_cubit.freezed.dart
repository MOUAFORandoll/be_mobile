// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_action_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppActionState {
  bool get isLogin => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  bool get isInternetConnection => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppActionStateCopyWith<AppActionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppActionStateCopyWith<$Res> {
  factory $AppActionStateCopyWith(
          AppActionState value, $Res Function(AppActionState) then) =
      _$AppActionStateCopyWithImpl<$Res, AppActionState>;
  @useResult
  $Res call({bool isLogin, int index, bool isInternetConnection});
}

/// @nodoc
class _$AppActionStateCopyWithImpl<$Res, $Val extends AppActionState>
    implements $AppActionStateCopyWith<$Res> {
  _$AppActionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLogin = null,
    Object? index = null,
    Object? isInternetConnection = null,
  }) {
    return _then(_value.copyWith(
      isLogin: null == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      isInternetConnection: null == isInternetConnection
          ? _value.isInternetConnection
          : isInternetConnection // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppActionStateImplCopyWith<$Res>
    implements $AppActionStateCopyWith<$Res> {
  factory _$$AppActionStateImplCopyWith(_$AppActionStateImpl value,
          $Res Function(_$AppActionStateImpl) then) =
      __$$AppActionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLogin, int index, bool isInternetConnection});
}

/// @nodoc
class __$$AppActionStateImplCopyWithImpl<$Res>
    extends _$AppActionStateCopyWithImpl<$Res, _$AppActionStateImpl>
    implements _$$AppActionStateImplCopyWith<$Res> {
  __$$AppActionStateImplCopyWithImpl(
      _$AppActionStateImpl _value, $Res Function(_$AppActionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLogin = null,
    Object? index = null,
    Object? isInternetConnection = null,
  }) {
    return _then(_$AppActionStateImpl(
      isLogin: null == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      isInternetConnection: null == isInternetConnection
          ? _value.isInternetConnection
          : isInternetConnection // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AppActionStateImpl implements _AppActionState {
  const _$AppActionStateImpl(
      {required this.isLogin,
      required this.index,
      required this.isInternetConnection});

  @override
  final bool isLogin;
  @override
  final int index;
  @override
  final bool isInternetConnection;

  @override
  String toString() {
    return 'AppActionState(isLogin: $isLogin, index: $index, isInternetConnection: $isInternetConnection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppActionStateImpl &&
            (identical(other.isLogin, isLogin) || other.isLogin == isLogin) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.isInternetConnection, isInternetConnection) ||
                other.isInternetConnection == isInternetConnection));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLogin, index, isInternetConnection);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppActionStateImplCopyWith<_$AppActionStateImpl> get copyWith =>
      __$$AppActionStateImplCopyWithImpl<_$AppActionStateImpl>(
          this, _$identity);
}

abstract class _AppActionState implements AppActionState {
  const factory _AppActionState(
      {required final bool isLogin,
      required final int index,
      required final bool isInternetConnection}) = _$AppActionStateImpl;

  @override
  bool get isLogin;
  @override
  int get index;
  @override
  bool get isInternetConnection;
  @override
  @JsonKey(ignore: true)
  _$$AppActionStateImplCopyWith<_$AppActionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
