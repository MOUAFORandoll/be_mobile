// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'database_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DatabaseState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Store store) initialized,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Store store)? initialized,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Store store)? initialized,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DatabaseInitialState value) initial,
    required TResult Function(DatabaseLoadingState value) loading,
    required TResult Function(DatabaseInitializedState value) initialized,
    required TResult Function(DatabaseErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DatabaseInitialState value)? initial,
    TResult? Function(DatabaseLoadingState value)? loading,
    TResult? Function(DatabaseInitializedState value)? initialized,
    TResult? Function(DatabaseErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DatabaseInitialState value)? initial,
    TResult Function(DatabaseLoadingState value)? loading,
    TResult Function(DatabaseInitializedState value)? initialized,
    TResult Function(DatabaseErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatabaseStateCopyWith<$Res> {
  factory $DatabaseStateCopyWith(
          DatabaseState value, $Res Function(DatabaseState) then) =
      _$DatabaseStateCopyWithImpl<$Res, DatabaseState>;
}

/// @nodoc
class _$DatabaseStateCopyWithImpl<$Res, $Val extends DatabaseState>
    implements $DatabaseStateCopyWith<$Res> {
  _$DatabaseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DatabaseInitialStateImplCopyWith<$Res> {
  factory _$$DatabaseInitialStateImplCopyWith(_$DatabaseInitialStateImpl value,
          $Res Function(_$DatabaseInitialStateImpl) then) =
      __$$DatabaseInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DatabaseInitialStateImplCopyWithImpl<$Res>
    extends _$DatabaseStateCopyWithImpl<$Res, _$DatabaseInitialStateImpl>
    implements _$$DatabaseInitialStateImplCopyWith<$Res> {
  __$$DatabaseInitialStateImplCopyWithImpl(_$DatabaseInitialStateImpl _value,
      $Res Function(_$DatabaseInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DatabaseInitialStateImpl implements DatabaseInitialState {
  const _$DatabaseInitialStateImpl();

  @override
  String toString() {
    return 'DatabaseState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatabaseInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Store store) initialized,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Store store)? initialized,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Store store)? initialized,
    TResult Function(String error)? error,
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
    required TResult Function(DatabaseInitialState value) initial,
    required TResult Function(DatabaseLoadingState value) loading,
    required TResult Function(DatabaseInitializedState value) initialized,
    required TResult Function(DatabaseErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DatabaseInitialState value)? initial,
    TResult? Function(DatabaseLoadingState value)? loading,
    TResult? Function(DatabaseInitializedState value)? initialized,
    TResult? Function(DatabaseErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DatabaseInitialState value)? initial,
    TResult Function(DatabaseLoadingState value)? loading,
    TResult Function(DatabaseInitializedState value)? initialized,
    TResult Function(DatabaseErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class DatabaseInitialState implements DatabaseState {
  const factory DatabaseInitialState() = _$DatabaseInitialStateImpl;
}

/// @nodoc
abstract class _$$DatabaseLoadingStateImplCopyWith<$Res> {
  factory _$$DatabaseLoadingStateImplCopyWith(_$DatabaseLoadingStateImpl value,
          $Res Function(_$DatabaseLoadingStateImpl) then) =
      __$$DatabaseLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DatabaseLoadingStateImplCopyWithImpl<$Res>
    extends _$DatabaseStateCopyWithImpl<$Res, _$DatabaseLoadingStateImpl>
    implements _$$DatabaseLoadingStateImplCopyWith<$Res> {
  __$$DatabaseLoadingStateImplCopyWithImpl(_$DatabaseLoadingStateImpl _value,
      $Res Function(_$DatabaseLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DatabaseLoadingStateImpl implements DatabaseLoadingState {
  const _$DatabaseLoadingStateImpl();

  @override
  String toString() {
    return 'DatabaseState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatabaseLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Store store) initialized,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Store store)? initialized,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Store store)? initialized,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DatabaseInitialState value) initial,
    required TResult Function(DatabaseLoadingState value) loading,
    required TResult Function(DatabaseInitializedState value) initialized,
    required TResult Function(DatabaseErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DatabaseInitialState value)? initial,
    TResult? Function(DatabaseLoadingState value)? loading,
    TResult? Function(DatabaseInitializedState value)? initialized,
    TResult? Function(DatabaseErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DatabaseInitialState value)? initial,
    TResult Function(DatabaseLoadingState value)? loading,
    TResult Function(DatabaseInitializedState value)? initialized,
    TResult Function(DatabaseErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DatabaseLoadingState implements DatabaseState {
  const factory DatabaseLoadingState() = _$DatabaseLoadingStateImpl;
}

/// @nodoc
abstract class _$$DatabaseInitializedStateImplCopyWith<$Res> {
  factory _$$DatabaseInitializedStateImplCopyWith(
          _$DatabaseInitializedStateImpl value,
          $Res Function(_$DatabaseInitializedStateImpl) then) =
      __$$DatabaseInitializedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Store store});
}

/// @nodoc
class __$$DatabaseInitializedStateImplCopyWithImpl<$Res>
    extends _$DatabaseStateCopyWithImpl<$Res, _$DatabaseInitializedStateImpl>
    implements _$$DatabaseInitializedStateImplCopyWith<$Res> {
  __$$DatabaseInitializedStateImplCopyWithImpl(
      _$DatabaseInitializedStateImpl _value,
      $Res Function(_$DatabaseInitializedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = freezed,
  }) {
    return _then(_$DatabaseInitializedStateImpl(
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store,
    ));
  }
}

/// @nodoc

class _$DatabaseInitializedStateImpl implements DatabaseInitializedState {
  const _$DatabaseInitializedStateImpl({required this.store});

  @override
  final Store store;

  @override
  String toString() {
    return 'DatabaseState.initialized(store: $store)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatabaseInitializedStateImpl &&
            const DeepCollectionEquality().equals(other.store, store));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(store));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DatabaseInitializedStateImplCopyWith<_$DatabaseInitializedStateImpl>
      get copyWith => __$$DatabaseInitializedStateImplCopyWithImpl<
          _$DatabaseInitializedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Store store) initialized,
    required TResult Function(String error) error,
  }) {
    return initialized(store);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Store store)? initialized,
    TResult? Function(String error)? error,
  }) {
    return initialized?.call(store);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Store store)? initialized,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(store);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DatabaseInitialState value) initial,
    required TResult Function(DatabaseLoadingState value) loading,
    required TResult Function(DatabaseInitializedState value) initialized,
    required TResult Function(DatabaseErrorState value) error,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DatabaseInitialState value)? initial,
    TResult? Function(DatabaseLoadingState value)? loading,
    TResult? Function(DatabaseInitializedState value)? initialized,
    TResult? Function(DatabaseErrorState value)? error,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DatabaseInitialState value)? initial,
    TResult Function(DatabaseLoadingState value)? loading,
    TResult Function(DatabaseInitializedState value)? initialized,
    TResult Function(DatabaseErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class DatabaseInitializedState implements DatabaseState {
  const factory DatabaseInitializedState({required final Store store}) =
      _$DatabaseInitializedStateImpl;

  Store get store;
  @JsonKey(ignore: true)
  _$$DatabaseInitializedStateImplCopyWith<_$DatabaseInitializedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DatabaseErrorStateImplCopyWith<$Res> {
  factory _$$DatabaseErrorStateImplCopyWith(_$DatabaseErrorStateImpl value,
          $Res Function(_$DatabaseErrorStateImpl) then) =
      __$$DatabaseErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$DatabaseErrorStateImplCopyWithImpl<$Res>
    extends _$DatabaseStateCopyWithImpl<$Res, _$DatabaseErrorStateImpl>
    implements _$$DatabaseErrorStateImplCopyWith<$Res> {
  __$$DatabaseErrorStateImplCopyWithImpl(_$DatabaseErrorStateImpl _value,
      $Res Function(_$DatabaseErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$DatabaseErrorStateImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DatabaseErrorStateImpl implements DatabaseErrorState {
  const _$DatabaseErrorStateImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'DatabaseState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatabaseErrorStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DatabaseErrorStateImplCopyWith<_$DatabaseErrorStateImpl> get copyWith =>
      __$$DatabaseErrorStateImplCopyWithImpl<_$DatabaseErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Store store) initialized,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Store store)? initialized,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Store store)? initialized,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DatabaseInitialState value) initial,
    required TResult Function(DatabaseLoadingState value) loading,
    required TResult Function(DatabaseInitializedState value) initialized,
    required TResult Function(DatabaseErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DatabaseInitialState value)? initial,
    TResult? Function(DatabaseLoadingState value)? loading,
    TResult? Function(DatabaseInitializedState value)? initialized,
    TResult? Function(DatabaseErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DatabaseInitialState value)? initial,
    TResult Function(DatabaseLoadingState value)? loading,
    TResult Function(DatabaseInitializedState value)? initialized,
    TResult Function(DatabaseErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DatabaseErrorState implements DatabaseState {
  const factory DatabaseErrorState({required final String error}) =
      _$DatabaseErrorStateImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$DatabaseErrorStateImplCopyWith<_$DatabaseErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
