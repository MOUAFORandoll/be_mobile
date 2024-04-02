// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connected_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConnectedEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() onConnected,
    required TResult Function() onNotConnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? onConnected,
    TResult? Function()? onNotConnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? onConnected,
    TResult Function()? onNotConnected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(OnConnected value) onConnected,
    required TResult Function(OnNotConnected value) onNotConnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(OnConnected value)? onConnected,
    TResult? Function(OnNotConnected value)? onNotConnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(OnConnected value)? onConnected,
    TResult Function(OnNotConnected value)? onNotConnected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectedEventCopyWith<$Res> {
  factory $ConnectedEventCopyWith(
          ConnectedEvent value, $Res Function(ConnectedEvent) then) =
      _$ConnectedEventCopyWithImpl<$Res, ConnectedEvent>;
}

/// @nodoc
class _$ConnectedEventCopyWithImpl<$Res, $Val extends ConnectedEvent>
    implements $ConnectedEventCopyWith<$Res> {
  _$ConnectedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$ConnectedEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'ConnectedEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() onConnected,
    required TResult Function() onNotConnected,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? onConnected,
    TResult? Function()? onNotConnected,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? onConnected,
    TResult Function()? onNotConnected,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(OnConnected value) onConnected,
    required TResult Function(OnNotConnected value) onNotConnected,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(OnConnected value)? onConnected,
    TResult? Function(OnNotConnected value)? onNotConnected,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(OnConnected value)? onConnected,
    TResult Function(OnNotConnected value)? onNotConnected,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ConnectedEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$OnConnectedImplCopyWith<$Res> {
  factory _$$OnConnectedImplCopyWith(
          _$OnConnectedImpl value, $Res Function(_$OnConnectedImpl) then) =
      __$$OnConnectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnConnectedImplCopyWithImpl<$Res>
    extends _$ConnectedEventCopyWithImpl<$Res, _$OnConnectedImpl>
    implements _$$OnConnectedImplCopyWith<$Res> {
  __$$OnConnectedImplCopyWithImpl(
      _$OnConnectedImpl _value, $Res Function(_$OnConnectedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnConnectedImpl implements OnConnected {
  const _$OnConnectedImpl();

  @override
  String toString() {
    return 'ConnectedEvent.onConnected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnConnectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() onConnected,
    required TResult Function() onNotConnected,
  }) {
    return onConnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? onConnected,
    TResult? Function()? onNotConnected,
  }) {
    return onConnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? onConnected,
    TResult Function()? onNotConnected,
    required TResult orElse(),
  }) {
    if (onConnected != null) {
      return onConnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(OnConnected value) onConnected,
    required TResult Function(OnNotConnected value) onNotConnected,
  }) {
    return onConnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(OnConnected value)? onConnected,
    TResult? Function(OnNotConnected value)? onNotConnected,
  }) {
    return onConnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(OnConnected value)? onConnected,
    TResult Function(OnNotConnected value)? onNotConnected,
    required TResult orElse(),
  }) {
    if (onConnected != null) {
      return onConnected(this);
    }
    return orElse();
  }
}

abstract class OnConnected implements ConnectedEvent {
  const factory OnConnected() = _$OnConnectedImpl;
}

/// @nodoc
abstract class _$$OnNotConnectedImplCopyWith<$Res> {
  factory _$$OnNotConnectedImplCopyWith(_$OnNotConnectedImpl value,
          $Res Function(_$OnNotConnectedImpl) then) =
      __$$OnNotConnectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnNotConnectedImplCopyWithImpl<$Res>
    extends _$ConnectedEventCopyWithImpl<$Res, _$OnNotConnectedImpl>
    implements _$$OnNotConnectedImplCopyWith<$Res> {
  __$$OnNotConnectedImplCopyWithImpl(
      _$OnNotConnectedImpl _value, $Res Function(_$OnNotConnectedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnNotConnectedImpl implements OnNotConnected {
  const _$OnNotConnectedImpl();

  @override
  String toString() {
    return 'ConnectedEvent.onNotConnected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnNotConnectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() onConnected,
    required TResult Function() onNotConnected,
  }) {
    return onNotConnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? onConnected,
    TResult? Function()? onNotConnected,
  }) {
    return onNotConnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? onConnected,
    TResult Function()? onNotConnected,
    required TResult orElse(),
  }) {
    if (onNotConnected != null) {
      return onNotConnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(OnConnected value) onConnected,
    required TResult Function(OnNotConnected value) onNotConnected,
  }) {
    return onNotConnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(OnConnected value)? onConnected,
    TResult? Function(OnNotConnected value)? onNotConnected,
  }) {
    return onNotConnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(OnConnected value)? onConnected,
    TResult Function(OnNotConnected value)? onNotConnected,
    required TResult orElse(),
  }) {
    if (onNotConnected != null) {
      return onNotConnected(this);
    }
    return orElse();
  }
}

abstract class OnNotConnected implements ConnectedEvent {
  const factory OnNotConnected() = _$OnNotConnectedImpl;
}

/// @nodoc
mixin _$ConnectedState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() connectedSucessState,
    required TResult Function() connectedFailureState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? connectedSucessState,
    TResult? Function()? connectedFailureState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? connectedSucessState,
    TResult Function()? connectedFailureState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ConnectedSucessState value) connectedSucessState,
    required TResult Function(ConnectedFailureState value)
        connectedFailureState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ConnectedSucessState value)? connectedSucessState,
    TResult? Function(ConnectedFailureState value)? connectedFailureState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ConnectedSucessState value)? connectedSucessState,
    TResult Function(ConnectedFailureState value)? connectedFailureState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectedStateCopyWith<$Res> {
  factory $ConnectedStateCopyWith(
          ConnectedState value, $Res Function(ConnectedState) then) =
      _$ConnectedStateCopyWithImpl<$Res, ConnectedState>;
}

/// @nodoc
class _$ConnectedStateCopyWithImpl<$Res, $Val extends ConnectedState>
    implements $ConnectedStateCopyWith<$Res> {
  _$ConnectedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ConnectedStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ConnectedState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() connectedSucessState,
    required TResult Function() connectedFailureState,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? connectedSucessState,
    TResult? Function()? connectedFailureState,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? connectedSucessState,
    TResult Function()? connectedFailureState,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ConnectedSucessState value) connectedSucessState,
    required TResult Function(ConnectedFailureState value)
        connectedFailureState,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ConnectedSucessState value)? connectedSucessState,
    TResult? Function(ConnectedFailureState value)? connectedFailureState,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ConnectedSucessState value)? connectedSucessState,
    TResult Function(ConnectedFailureState value)? connectedFailureState,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ConnectedState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ConnectedSucessStateImplCopyWith<$Res> {
  factory _$$ConnectedSucessStateImplCopyWith(_$ConnectedSucessStateImpl value,
          $Res Function(_$ConnectedSucessStateImpl) then) =
      __$$ConnectedSucessStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectedSucessStateImplCopyWithImpl<$Res>
    extends _$ConnectedStateCopyWithImpl<$Res, _$ConnectedSucessStateImpl>
    implements _$$ConnectedSucessStateImplCopyWith<$Res> {
  __$$ConnectedSucessStateImplCopyWithImpl(_$ConnectedSucessStateImpl _value,
      $Res Function(_$ConnectedSucessStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ConnectedSucessStateImpl implements ConnectedSucessState {
  const _$ConnectedSucessStateImpl();

  @override
  String toString() {
    return 'ConnectedState.connectedSucessState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectedSucessStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() connectedSucessState,
    required TResult Function() connectedFailureState,
  }) {
    return connectedSucessState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? connectedSucessState,
    TResult? Function()? connectedFailureState,
  }) {
    return connectedSucessState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? connectedSucessState,
    TResult Function()? connectedFailureState,
    required TResult orElse(),
  }) {
    if (connectedSucessState != null) {
      return connectedSucessState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ConnectedSucessState value) connectedSucessState,
    required TResult Function(ConnectedFailureState value)
        connectedFailureState,
  }) {
    return connectedSucessState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ConnectedSucessState value)? connectedSucessState,
    TResult? Function(ConnectedFailureState value)? connectedFailureState,
  }) {
    return connectedSucessState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ConnectedSucessState value)? connectedSucessState,
    TResult Function(ConnectedFailureState value)? connectedFailureState,
    required TResult orElse(),
  }) {
    if (connectedSucessState != null) {
      return connectedSucessState(this);
    }
    return orElse();
  }
}

abstract class ConnectedSucessState implements ConnectedState {
  const factory ConnectedSucessState() = _$ConnectedSucessStateImpl;
}

/// @nodoc
abstract class _$$ConnectedFailureStateImplCopyWith<$Res> {
  factory _$$ConnectedFailureStateImplCopyWith(
          _$ConnectedFailureStateImpl value,
          $Res Function(_$ConnectedFailureStateImpl) then) =
      __$$ConnectedFailureStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectedFailureStateImplCopyWithImpl<$Res>
    extends _$ConnectedStateCopyWithImpl<$Res, _$ConnectedFailureStateImpl>
    implements _$$ConnectedFailureStateImplCopyWith<$Res> {
  __$$ConnectedFailureStateImplCopyWithImpl(_$ConnectedFailureStateImpl _value,
      $Res Function(_$ConnectedFailureStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ConnectedFailureStateImpl implements ConnectedFailureState {
  const _$ConnectedFailureStateImpl();

  @override
  String toString() {
    return 'ConnectedState.connectedFailureState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectedFailureStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() connectedSucessState,
    required TResult Function() connectedFailureState,
  }) {
    return connectedFailureState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? connectedSucessState,
    TResult? Function()? connectedFailureState,
  }) {
    return connectedFailureState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? connectedSucessState,
    TResult Function()? connectedFailureState,
    required TResult orElse(),
  }) {
    if (connectedFailureState != null) {
      return connectedFailureState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ConnectedSucessState value) connectedSucessState,
    required TResult Function(ConnectedFailureState value)
        connectedFailureState,
  }) {
    return connectedFailureState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ConnectedSucessState value)? connectedSucessState,
    TResult? Function(ConnectedFailureState value)? connectedFailureState,
  }) {
    return connectedFailureState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ConnectedSucessState value)? connectedSucessState,
    TResult Function(ConnectedFailureState value)? connectedFailureState,
    required TResult orElse(),
  }) {
    if (connectedFailureState != null) {
      return connectedFailureState(this);
    }
    return orElse();
  }
}

abstract class ConnectedFailureState implements ConnectedState {
  const factory ConnectedFailureState() = _$ConnectedFailureStateImpl;
}
