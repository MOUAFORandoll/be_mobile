// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, String password) chooseExperience,
    required TResult Function(
            String name, String phone, String password, String re_password)
        register,
    required TResult Function(BuildContext context) signOut,
    required TResult Function() getUserEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone, String password)? chooseExperience,
    TResult? Function(
            String name, String phone, String password, String re_password)?
        register,
    TResult? Function(BuildContext context)? signOut,
    TResult? Function()? getUserEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, String password)? chooseExperience,
    TResult Function(
            String name, String phone, String password, String re_password)?
        register,
    TResult Function(BuildContext context)? signOut,
    TResult Function()? getUserEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInEvent value) chooseExperience,
    required TResult Function(RegisterEvent value) register,
    required TResult Function(SignOutEvent value) signOut,
    required TResult Function(GetUserEvent value) getUserEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInEvent value)? chooseExperience,
    TResult? Function(RegisterEvent value)? register,
    TResult? Function(SignOutEvent value)? signOut,
    TResult? Function(GetUserEvent value)? getUserEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInEvent value)? chooseExperience,
    TResult Function(RegisterEvent value)? register,
    TResult Function(SignOutEvent value)? signOut,
    TResult Function(GetUserEvent value)? getUserEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SignInEventImplCopyWith<$Res> {
  factory _$$SignInEventImplCopyWith(
          _$SignInEventImpl value, $Res Function(_$SignInEventImpl) then) =
      __$$SignInEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phone, String password});
}

/// @nodoc
class __$$SignInEventImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$SignInEventImpl>
    implements _$$SignInEventImplCopyWith<$Res> {
  __$$SignInEventImplCopyWithImpl(
      _$SignInEventImpl _value, $Res Function(_$SignInEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? password = null,
  }) {
    return _then(_$SignInEventImpl(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignInEventImpl implements SignInEvent {
  const _$SignInEventImpl({required this.phone, required this.password});

  @override
  final String phone;
  @override
  final String password;

  @override
  String toString() {
    return 'UserEvent.chooseExperience(phone: $phone, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInEventImpl &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phone, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInEventImplCopyWith<_$SignInEventImpl> get copyWith =>
      __$$SignInEventImplCopyWithImpl<_$SignInEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, String password) chooseExperience,
    required TResult Function(
            String name, String phone, String password, String re_password)
        register,
    required TResult Function(BuildContext context) signOut,
    required TResult Function() getUserEvent,
  }) {
    return chooseExperience(phone, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone, String password)? chooseExperience,
    TResult? Function(
            String name, String phone, String password, String re_password)?
        register,
    TResult? Function(BuildContext context)? signOut,
    TResult? Function()? getUserEvent,
  }) {
    return chooseExperience?.call(phone, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, String password)? chooseExperience,
    TResult Function(
            String name, String phone, String password, String re_password)?
        register,
    TResult Function(BuildContext context)? signOut,
    TResult Function()? getUserEvent,
    required TResult orElse(),
  }) {
    if (chooseExperience != null) {
      return chooseExperience(phone, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInEvent value) chooseExperience,
    required TResult Function(RegisterEvent value) register,
    required TResult Function(SignOutEvent value) signOut,
    required TResult Function(GetUserEvent value) getUserEvent,
  }) {
    return chooseExperience(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInEvent value)? chooseExperience,
    TResult? Function(RegisterEvent value)? register,
    TResult? Function(SignOutEvent value)? signOut,
    TResult? Function(GetUserEvent value)? getUserEvent,
  }) {
    return chooseExperience?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInEvent value)? chooseExperience,
    TResult Function(RegisterEvent value)? register,
    TResult Function(SignOutEvent value)? signOut,
    TResult Function(GetUserEvent value)? getUserEvent,
    required TResult orElse(),
  }) {
    if (chooseExperience != null) {
      return chooseExperience(this);
    }
    return orElse();
  }
}

abstract class SignInEvent implements UserEvent {
  const factory SignInEvent(
      {required final String phone,
      required final String password}) = _$SignInEventImpl;

  String get phone;
  String get password;
  @JsonKey(ignore: true)
  _$$SignInEventImplCopyWith<_$SignInEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterEventImplCopyWith<$Res> {
  factory _$$RegisterEventImplCopyWith(
          _$RegisterEventImpl value, $Res Function(_$RegisterEventImpl) then) =
      __$$RegisterEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, String phone, String password, String re_password});
}

/// @nodoc
class __$$RegisterEventImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$RegisterEventImpl>
    implements _$$RegisterEventImplCopyWith<$Res> {
  __$$RegisterEventImplCopyWithImpl(
      _$RegisterEventImpl _value, $Res Function(_$RegisterEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? password = null,
    Object? re_password = null,
  }) {
    return _then(_$RegisterEventImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      re_password: null == re_password
          ? _value.re_password
          : re_password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterEventImpl implements RegisterEvent {
  const _$RegisterEventImpl(
      {required this.name,
      required this.phone,
      required this.password,
      required this.re_password});

  @override
  final String name;
  @override
  final String phone;
  @override
  final String password;
  @override
  final String re_password;

  @override
  String toString() {
    return 'UserEvent.register(name: $name, phone: $phone, password: $password, re_password: $re_password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterEventImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.re_password, re_password) ||
                other.re_password == re_password));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, phone, password, re_password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterEventImplCopyWith<_$RegisterEventImpl> get copyWith =>
      __$$RegisterEventImplCopyWithImpl<_$RegisterEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, String password) chooseExperience,
    required TResult Function(
            String name, String phone, String password, String re_password)
        register,
    required TResult Function(BuildContext context) signOut,
    required TResult Function() getUserEvent,
  }) {
    return register(name, phone, password, re_password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone, String password)? chooseExperience,
    TResult? Function(
            String name, String phone, String password, String re_password)?
        register,
    TResult? Function(BuildContext context)? signOut,
    TResult? Function()? getUserEvent,
  }) {
    return register?.call(name, phone, password, re_password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, String password)? chooseExperience,
    TResult Function(
            String name, String phone, String password, String re_password)?
        register,
    TResult Function(BuildContext context)? signOut,
    TResult Function()? getUserEvent,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(name, phone, password, re_password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInEvent value) chooseExperience,
    required TResult Function(RegisterEvent value) register,
    required TResult Function(SignOutEvent value) signOut,
    required TResult Function(GetUserEvent value) getUserEvent,
  }) {
    return register(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInEvent value)? chooseExperience,
    TResult? Function(RegisterEvent value)? register,
    TResult? Function(SignOutEvent value)? signOut,
    TResult? Function(GetUserEvent value)? getUserEvent,
  }) {
    return register?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInEvent value)? chooseExperience,
    TResult Function(RegisterEvent value)? register,
    TResult Function(SignOutEvent value)? signOut,
    TResult Function(GetUserEvent value)? getUserEvent,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(this);
    }
    return orElse();
  }
}

abstract class RegisterEvent implements UserEvent {
  const factory RegisterEvent(
      {required final String name,
      required final String phone,
      required final String password,
      required final String re_password}) = _$RegisterEventImpl;

  String get name;
  String get phone;
  String get password;
  String get re_password;
  @JsonKey(ignore: true)
  _$$RegisterEventImplCopyWith<_$RegisterEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignOutEventImplCopyWith<$Res> {
  factory _$$SignOutEventImplCopyWith(
          _$SignOutEventImpl value, $Res Function(_$SignOutEventImpl) then) =
      __$$SignOutEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class __$$SignOutEventImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$SignOutEventImpl>
    implements _$$SignOutEventImplCopyWith<$Res> {
  __$$SignOutEventImplCopyWithImpl(
      _$SignOutEventImpl _value, $Res Function(_$SignOutEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_$SignOutEventImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$SignOutEventImpl implements SignOutEvent {
  const _$SignOutEventImpl({required this.context});

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'UserEvent.signOut(context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignOutEventImpl &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignOutEventImplCopyWith<_$SignOutEventImpl> get copyWith =>
      __$$SignOutEventImplCopyWithImpl<_$SignOutEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, String password) chooseExperience,
    required TResult Function(
            String name, String phone, String password, String re_password)
        register,
    required TResult Function(BuildContext context) signOut,
    required TResult Function() getUserEvent,
  }) {
    return signOut(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone, String password)? chooseExperience,
    TResult? Function(
            String name, String phone, String password, String re_password)?
        register,
    TResult? Function(BuildContext context)? signOut,
    TResult? Function()? getUserEvent,
  }) {
    return signOut?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, String password)? chooseExperience,
    TResult Function(
            String name, String phone, String password, String re_password)?
        register,
    TResult Function(BuildContext context)? signOut,
    TResult Function()? getUserEvent,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut(context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInEvent value) chooseExperience,
    required TResult Function(RegisterEvent value) register,
    required TResult Function(SignOutEvent value) signOut,
    required TResult Function(GetUserEvent value) getUserEvent,
  }) {
    return signOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInEvent value)? chooseExperience,
    TResult? Function(RegisterEvent value)? register,
    TResult? Function(SignOutEvent value)? signOut,
    TResult? Function(GetUserEvent value)? getUserEvent,
  }) {
    return signOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInEvent value)? chooseExperience,
    TResult Function(RegisterEvent value)? register,
    TResult Function(SignOutEvent value)? signOut,
    TResult Function(GetUserEvent value)? getUserEvent,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut(this);
    }
    return orElse();
  }
}

abstract class SignOutEvent implements UserEvent {
  const factory SignOutEvent({required final BuildContext context}) =
      _$SignOutEventImpl;

  BuildContext get context;
  @JsonKey(ignore: true)
  _$$SignOutEventImplCopyWith<_$SignOutEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetUserEventImplCopyWith<$Res> {
  factory _$$GetUserEventImplCopyWith(
          _$GetUserEventImpl value, $Res Function(_$GetUserEventImpl) then) =
      __$$GetUserEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUserEventImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$GetUserEventImpl>
    implements _$$GetUserEventImplCopyWith<$Res> {
  __$$GetUserEventImplCopyWithImpl(
      _$GetUserEventImpl _value, $Res Function(_$GetUserEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetUserEventImpl implements GetUserEvent {
  const _$GetUserEventImpl();

  @override
  String toString() {
    return 'UserEvent.getUserEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetUserEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, String password) chooseExperience,
    required TResult Function(
            String name, String phone, String password, String re_password)
        register,
    required TResult Function(BuildContext context) signOut,
    required TResult Function() getUserEvent,
  }) {
    return getUserEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone, String password)? chooseExperience,
    TResult? Function(
            String name, String phone, String password, String re_password)?
        register,
    TResult? Function(BuildContext context)? signOut,
    TResult? Function()? getUserEvent,
  }) {
    return getUserEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, String password)? chooseExperience,
    TResult Function(
            String name, String phone, String password, String re_password)?
        register,
    TResult Function(BuildContext context)? signOut,
    TResult Function()? getUserEvent,
    required TResult orElse(),
  }) {
    if (getUserEvent != null) {
      return getUserEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInEvent value) chooseExperience,
    required TResult Function(RegisterEvent value) register,
    required TResult Function(SignOutEvent value) signOut,
    required TResult Function(GetUserEvent value) getUserEvent,
  }) {
    return getUserEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInEvent value)? chooseExperience,
    TResult? Function(RegisterEvent value)? register,
    TResult? Function(SignOutEvent value)? signOut,
    TResult? Function(GetUserEvent value)? getUserEvent,
  }) {
    return getUserEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInEvent value)? chooseExperience,
    TResult Function(RegisterEvent value)? register,
    TResult Function(SignOutEvent value)? signOut,
    TResult Function(GetUserEvent value)? getUserEvent,
    required TResult orElse(),
  }) {
    if (getUserEvent != null) {
      return getUserEvent(this);
    }
    return orElse();
  }
}

abstract class GetUserEvent implements UserEvent {
  const factory GetUserEvent() = _$GetUserEventImpl;
}

/// @nodoc
mixin _$UserState {
  int? get isLoading => throw _privateConstructorUsedError;
  String? get authenticationFailedMessage => throw _privateConstructorUsedError;
  String? get registerFailedMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
  @useResult
  $Res call(
      {int? isLoading,
      String? authenticationFailedMessage,
      String? registerFailedMessage});
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = freezed,
    Object? authenticationFailedMessage = freezed,
    Object? registerFailedMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as int?,
      authenticationFailedMessage: freezed == authenticationFailedMessage
          ? _value.authenticationFailedMessage
          : authenticationFailedMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      registerFailedMessage: freezed == registerFailedMessage
          ? _value.registerFailedMessage
          : registerFailedMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStateImplCopyWith<$Res>
    implements $UserStateCopyWith<$Res> {
  factory _$$UserStateImplCopyWith(
          _$UserStateImpl value, $Res Function(_$UserStateImpl) then) =
      __$$UserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? isLoading,
      String? authenticationFailedMessage,
      String? registerFailedMessage});
}

/// @nodoc
class __$$UserStateImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateImpl>
    implements _$$UserStateImplCopyWith<$Res> {
  __$$UserStateImplCopyWithImpl(
      _$UserStateImpl _value, $Res Function(_$UserStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = freezed,
    Object? authenticationFailedMessage = freezed,
    Object? registerFailedMessage = freezed,
  }) {
    return _then(_$UserStateImpl(
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as int?,
      authenticationFailedMessage: freezed == authenticationFailedMessage
          ? _value.authenticationFailedMessage
          : authenticationFailedMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      registerFailedMessage: freezed == registerFailedMessage
          ? _value.registerFailedMessage
          : registerFailedMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserStateImpl implements _UserState {
  const _$UserStateImpl(
      {this.isLoading,
      this.authenticationFailedMessage,
      this.registerFailedMessage});

  @override
  final int? isLoading;
  @override
  final String? authenticationFailedMessage;
  @override
  final String? registerFailedMessage;

  @override
  String toString() {
    return 'UserState(isLoading: $isLoading, authenticationFailedMessage: $authenticationFailedMessage, registerFailedMessage: $registerFailedMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.authenticationFailedMessage,
                    authenticationFailedMessage) ||
                other.authenticationFailedMessage ==
                    authenticationFailedMessage) &&
            (identical(other.registerFailedMessage, registerFailedMessage) ||
                other.registerFailedMessage == registerFailedMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      authenticationFailedMessage, registerFailedMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      __$$UserStateImplCopyWithImpl<_$UserStateImpl>(this, _$identity);
}

abstract class _UserState implements UserState {
  const factory _UserState(
      {final int? isLoading,
      final String? authenticationFailedMessage,
      final String? registerFailedMessage}) = _$UserStateImpl;

  @override
  int? get isLoading;
  @override
  String? get authenticationFailedMessage;
  @override
  String? get registerFailedMessage;
  @override
  @JsonKey(ignore: true)
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
