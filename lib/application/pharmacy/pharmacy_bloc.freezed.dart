// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pharmacy_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PharmacyEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() updatePharmacyImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? updatePharmacyImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? updatePharmacyImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdatePharmacyImage value) updatePharmacyImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdatePharmacyImage value)? updatePharmacyImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdatePharmacyImage value)? updatePharmacyImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PharmacyEventCopyWith<$Res> {
  factory $PharmacyEventCopyWith(
          PharmacyEvent value, $Res Function(PharmacyEvent) then) =
      _$PharmacyEventCopyWithImpl<$Res, PharmacyEvent>;
}

/// @nodoc
class _$PharmacyEventCopyWithImpl<$Res, $Val extends PharmacyEvent>
    implements $PharmacyEventCopyWith<$Res> {
  _$PharmacyEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UpdatePharmacyImageImplCopyWith<$Res> {
  factory _$$UpdatePharmacyImageImplCopyWith(_$UpdatePharmacyImageImpl value,
          $Res Function(_$UpdatePharmacyImageImpl) then) =
      __$$UpdatePharmacyImageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdatePharmacyImageImplCopyWithImpl<$Res>
    extends _$PharmacyEventCopyWithImpl<$Res, _$UpdatePharmacyImageImpl>
    implements _$$UpdatePharmacyImageImplCopyWith<$Res> {
  __$$UpdatePharmacyImageImplCopyWithImpl(_$UpdatePharmacyImageImpl _value,
      $Res Function(_$UpdatePharmacyImageImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpdatePharmacyImageImpl implements UpdatePharmacyImage {
  const _$UpdatePharmacyImageImpl();

  @override
  String toString() {
    return 'PharmacyEvent.updatePharmacyImage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePharmacyImageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() updatePharmacyImage,
  }) {
    return updatePharmacyImage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? updatePharmacyImage,
  }) {
    return updatePharmacyImage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? updatePharmacyImage,
    required TResult orElse(),
  }) {
    if (updatePharmacyImage != null) {
      return updatePharmacyImage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdatePharmacyImage value) updatePharmacyImage,
  }) {
    return updatePharmacyImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdatePharmacyImage value)? updatePharmacyImage,
  }) {
    return updatePharmacyImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdatePharmacyImage value)? updatePharmacyImage,
    required TResult orElse(),
  }) {
    if (updatePharmacyImage != null) {
      return updatePharmacyImage(this);
    }
    return orElse();
  }
}

abstract class UpdatePharmacyImage implements PharmacyEvent {
  const factory UpdatePharmacyImage() = _$UpdatePharmacyImageImpl;
}

/// @nodoc
mixin _$PharmacyState {
  int? get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PharmacyStateCopyWith<PharmacyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PharmacyStateCopyWith<$Res> {
  factory $PharmacyStateCopyWith(
          PharmacyState value, $Res Function(PharmacyState) then) =
      _$PharmacyStateCopyWithImpl<$Res, PharmacyState>;
  @useResult
  $Res call({int? isLoading});
}

/// @nodoc
class _$PharmacyStateCopyWithImpl<$Res, $Val extends PharmacyState>
    implements $PharmacyStateCopyWith<$Res> {
  _$PharmacyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PharmacyStateImplCopyWith<$Res>
    implements $PharmacyStateCopyWith<$Res> {
  factory _$$PharmacyStateImplCopyWith(
          _$PharmacyStateImpl value, $Res Function(_$PharmacyStateImpl) then) =
      __$$PharmacyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? isLoading});
}

/// @nodoc
class __$$PharmacyStateImplCopyWithImpl<$Res>
    extends _$PharmacyStateCopyWithImpl<$Res, _$PharmacyStateImpl>
    implements _$$PharmacyStateImplCopyWith<$Res> {
  __$$PharmacyStateImplCopyWithImpl(
      _$PharmacyStateImpl _value, $Res Function(_$PharmacyStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = freezed,
  }) {
    return _then(_$PharmacyStateImpl(
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$PharmacyStateImpl implements _PharmacyState {
  const _$PharmacyStateImpl({this.isLoading});

  @override
  final int? isLoading;

  @override
  String toString() {
    return 'PharmacyState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PharmacyStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PharmacyStateImplCopyWith<_$PharmacyStateImpl> get copyWith =>
      __$$PharmacyStateImplCopyWithImpl<_$PharmacyStateImpl>(this, _$identity);
}

abstract class _PharmacyState implements PharmacyState {
  const factory _PharmacyState({final int? isLoading}) = _$PharmacyStateImpl;

  @override
  int? get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$PharmacyStateImplCopyWith<_$PharmacyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
