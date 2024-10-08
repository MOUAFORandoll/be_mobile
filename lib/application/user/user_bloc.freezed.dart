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
    required TResult Function(String data) sendCode,
    required TResult Function(Map<dynamic, dynamic> data) updateUserInfo,
    required TResult Function(String data, String code) verifyCode,
    required TResult Function(String data, String password) resetpassword,
    required TResult Function(BuildContext context) signOut,
    required TResult Function() getUserEvent,
    required TResult Function() getVilleQuartier,
    required TResult Function() updateUserImage,
    required TResult Function() getModePaiement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone, String password)? chooseExperience,
    TResult? Function(
            String name, String phone, String password, String re_password)?
        register,
    TResult? Function(String data)? sendCode,
    TResult? Function(Map<dynamic, dynamic> data)? updateUserInfo,
    TResult? Function(String data, String code)? verifyCode,
    TResult? Function(String data, String password)? resetpassword,
    TResult? Function(BuildContext context)? signOut,
    TResult? Function()? getUserEvent,
    TResult? Function()? getVilleQuartier,
    TResult? Function()? updateUserImage,
    TResult? Function()? getModePaiement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, String password)? chooseExperience,
    TResult Function(
            String name, String phone, String password, String re_password)?
        register,
    TResult Function(String data)? sendCode,
    TResult Function(Map<dynamic, dynamic> data)? updateUserInfo,
    TResult Function(String data, String code)? verifyCode,
    TResult Function(String data, String password)? resetpassword,
    TResult Function(BuildContext context)? signOut,
    TResult Function()? getUserEvent,
    TResult Function()? getVilleQuartier,
    TResult Function()? updateUserImage,
    TResult Function()? getModePaiement,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInEvent value) chooseExperience,
    required TResult Function(RegisterEvent value) register,
    required TResult Function(SendCode value) sendCode,
    required TResult Function(UpdateUserInfo value) updateUserInfo,
    required TResult Function(VerifyCode value) verifyCode,
    required TResult Function(ResetPassword value) resetpassword,
    required TResult Function(SignOutEvent value) signOut,
    required TResult Function(GetUserEvent value) getUserEvent,
    required TResult Function(GetVilleQuartier value) getVilleQuartier,
    required TResult Function(UpdateUserImage value) updateUserImage,
    required TResult Function(GetModePaiement value) getModePaiement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInEvent value)? chooseExperience,
    TResult? Function(RegisterEvent value)? register,
    TResult? Function(SendCode value)? sendCode,
    TResult? Function(UpdateUserInfo value)? updateUserInfo,
    TResult? Function(VerifyCode value)? verifyCode,
    TResult? Function(ResetPassword value)? resetpassword,
    TResult? Function(SignOutEvent value)? signOut,
    TResult? Function(GetUserEvent value)? getUserEvent,
    TResult? Function(GetVilleQuartier value)? getVilleQuartier,
    TResult? Function(UpdateUserImage value)? updateUserImage,
    TResult? Function(GetModePaiement value)? getModePaiement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInEvent value)? chooseExperience,
    TResult Function(RegisterEvent value)? register,
    TResult Function(SendCode value)? sendCode,
    TResult Function(UpdateUserInfo value)? updateUserInfo,
    TResult Function(VerifyCode value)? verifyCode,
    TResult Function(ResetPassword value)? resetpassword,
    TResult Function(SignOutEvent value)? signOut,
    TResult Function(GetUserEvent value)? getUserEvent,
    TResult Function(GetVilleQuartier value)? getVilleQuartier,
    TResult Function(UpdateUserImage value)? updateUserImage,
    TResult Function(GetModePaiement value)? getModePaiement,
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
    required TResult Function(String data) sendCode,
    required TResult Function(Map<dynamic, dynamic> data) updateUserInfo,
    required TResult Function(String data, String code) verifyCode,
    required TResult Function(String data, String password) resetpassword,
    required TResult Function(BuildContext context) signOut,
    required TResult Function() getUserEvent,
    required TResult Function() getVilleQuartier,
    required TResult Function() updateUserImage,
    required TResult Function() getModePaiement,
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
    TResult? Function(String data)? sendCode,
    TResult? Function(Map<dynamic, dynamic> data)? updateUserInfo,
    TResult? Function(String data, String code)? verifyCode,
    TResult? Function(String data, String password)? resetpassword,
    TResult? Function(BuildContext context)? signOut,
    TResult? Function()? getUserEvent,
    TResult? Function()? getVilleQuartier,
    TResult? Function()? updateUserImage,
    TResult? Function()? getModePaiement,
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
    TResult Function(String data)? sendCode,
    TResult Function(Map<dynamic, dynamic> data)? updateUserInfo,
    TResult Function(String data, String code)? verifyCode,
    TResult Function(String data, String password)? resetpassword,
    TResult Function(BuildContext context)? signOut,
    TResult Function()? getUserEvent,
    TResult Function()? getVilleQuartier,
    TResult Function()? updateUserImage,
    TResult Function()? getModePaiement,
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
    required TResult Function(SendCode value) sendCode,
    required TResult Function(UpdateUserInfo value) updateUserInfo,
    required TResult Function(VerifyCode value) verifyCode,
    required TResult Function(ResetPassword value) resetpassword,
    required TResult Function(SignOutEvent value) signOut,
    required TResult Function(GetUserEvent value) getUserEvent,
    required TResult Function(GetVilleQuartier value) getVilleQuartier,
    required TResult Function(UpdateUserImage value) updateUserImage,
    required TResult Function(GetModePaiement value) getModePaiement,
  }) {
    return chooseExperience(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInEvent value)? chooseExperience,
    TResult? Function(RegisterEvent value)? register,
    TResult? Function(SendCode value)? sendCode,
    TResult? Function(UpdateUserInfo value)? updateUserInfo,
    TResult? Function(VerifyCode value)? verifyCode,
    TResult? Function(ResetPassword value)? resetpassword,
    TResult? Function(SignOutEvent value)? signOut,
    TResult? Function(GetUserEvent value)? getUserEvent,
    TResult? Function(GetVilleQuartier value)? getVilleQuartier,
    TResult? Function(UpdateUserImage value)? updateUserImage,
    TResult? Function(GetModePaiement value)? getModePaiement,
  }) {
    return chooseExperience?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInEvent value)? chooseExperience,
    TResult Function(RegisterEvent value)? register,
    TResult Function(SendCode value)? sendCode,
    TResult Function(UpdateUserInfo value)? updateUserInfo,
    TResult Function(VerifyCode value)? verifyCode,
    TResult Function(ResetPassword value)? resetpassword,
    TResult Function(SignOutEvent value)? signOut,
    TResult Function(GetUserEvent value)? getUserEvent,
    TResult Function(GetVilleQuartier value)? getVilleQuartier,
    TResult Function(UpdateUserImage value)? updateUserImage,
    TResult Function(GetModePaiement value)? getModePaiement,
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
    required TResult Function(String data) sendCode,
    required TResult Function(Map<dynamic, dynamic> data) updateUserInfo,
    required TResult Function(String data, String code) verifyCode,
    required TResult Function(String data, String password) resetpassword,
    required TResult Function(BuildContext context) signOut,
    required TResult Function() getUserEvent,
    required TResult Function() getVilleQuartier,
    required TResult Function() updateUserImage,
    required TResult Function() getModePaiement,
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
    TResult? Function(String data)? sendCode,
    TResult? Function(Map<dynamic, dynamic> data)? updateUserInfo,
    TResult? Function(String data, String code)? verifyCode,
    TResult? Function(String data, String password)? resetpassword,
    TResult? Function(BuildContext context)? signOut,
    TResult? Function()? getUserEvent,
    TResult? Function()? getVilleQuartier,
    TResult? Function()? updateUserImage,
    TResult? Function()? getModePaiement,
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
    TResult Function(String data)? sendCode,
    TResult Function(Map<dynamic, dynamic> data)? updateUserInfo,
    TResult Function(String data, String code)? verifyCode,
    TResult Function(String data, String password)? resetpassword,
    TResult Function(BuildContext context)? signOut,
    TResult Function()? getUserEvent,
    TResult Function()? getVilleQuartier,
    TResult Function()? updateUserImage,
    TResult Function()? getModePaiement,
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
    required TResult Function(SendCode value) sendCode,
    required TResult Function(UpdateUserInfo value) updateUserInfo,
    required TResult Function(VerifyCode value) verifyCode,
    required TResult Function(ResetPassword value) resetpassword,
    required TResult Function(SignOutEvent value) signOut,
    required TResult Function(GetUserEvent value) getUserEvent,
    required TResult Function(GetVilleQuartier value) getVilleQuartier,
    required TResult Function(UpdateUserImage value) updateUserImage,
    required TResult Function(GetModePaiement value) getModePaiement,
  }) {
    return register(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInEvent value)? chooseExperience,
    TResult? Function(RegisterEvent value)? register,
    TResult? Function(SendCode value)? sendCode,
    TResult? Function(UpdateUserInfo value)? updateUserInfo,
    TResult? Function(VerifyCode value)? verifyCode,
    TResult? Function(ResetPassword value)? resetpassword,
    TResult? Function(SignOutEvent value)? signOut,
    TResult? Function(GetUserEvent value)? getUserEvent,
    TResult? Function(GetVilleQuartier value)? getVilleQuartier,
    TResult? Function(UpdateUserImage value)? updateUserImage,
    TResult? Function(GetModePaiement value)? getModePaiement,
  }) {
    return register?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInEvent value)? chooseExperience,
    TResult Function(RegisterEvent value)? register,
    TResult Function(SendCode value)? sendCode,
    TResult Function(UpdateUserInfo value)? updateUserInfo,
    TResult Function(VerifyCode value)? verifyCode,
    TResult Function(ResetPassword value)? resetpassword,
    TResult Function(SignOutEvent value)? signOut,
    TResult Function(GetUserEvent value)? getUserEvent,
    TResult Function(GetVilleQuartier value)? getVilleQuartier,
    TResult Function(UpdateUserImage value)? updateUserImage,
    TResult Function(GetModePaiement value)? getModePaiement,
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
abstract class _$$SendCodeImplCopyWith<$Res> {
  factory _$$SendCodeImplCopyWith(
          _$SendCodeImpl value, $Res Function(_$SendCodeImpl) then) =
      __$$SendCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String data});
}

/// @nodoc
class __$$SendCodeImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$SendCodeImpl>
    implements _$$SendCodeImplCopyWith<$Res> {
  __$$SendCodeImplCopyWithImpl(
      _$SendCodeImpl _value, $Res Function(_$SendCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$SendCodeImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendCodeImpl implements SendCode {
  const _$SendCodeImpl({required this.data});

  @override
  final String data;

  @override
  String toString() {
    return 'UserEvent.sendCode(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendCodeImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendCodeImplCopyWith<_$SendCodeImpl> get copyWith =>
      __$$SendCodeImplCopyWithImpl<_$SendCodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, String password) chooseExperience,
    required TResult Function(
            String name, String phone, String password, String re_password)
        register,
    required TResult Function(String data) sendCode,
    required TResult Function(Map<dynamic, dynamic> data) updateUserInfo,
    required TResult Function(String data, String code) verifyCode,
    required TResult Function(String data, String password) resetpassword,
    required TResult Function(BuildContext context) signOut,
    required TResult Function() getUserEvent,
    required TResult Function() getVilleQuartier,
    required TResult Function() updateUserImage,
    required TResult Function() getModePaiement,
  }) {
    return sendCode(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone, String password)? chooseExperience,
    TResult? Function(
            String name, String phone, String password, String re_password)?
        register,
    TResult? Function(String data)? sendCode,
    TResult? Function(Map<dynamic, dynamic> data)? updateUserInfo,
    TResult? Function(String data, String code)? verifyCode,
    TResult? Function(String data, String password)? resetpassword,
    TResult? Function(BuildContext context)? signOut,
    TResult? Function()? getUserEvent,
    TResult? Function()? getVilleQuartier,
    TResult? Function()? updateUserImage,
    TResult? Function()? getModePaiement,
  }) {
    return sendCode?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, String password)? chooseExperience,
    TResult Function(
            String name, String phone, String password, String re_password)?
        register,
    TResult Function(String data)? sendCode,
    TResult Function(Map<dynamic, dynamic> data)? updateUserInfo,
    TResult Function(String data, String code)? verifyCode,
    TResult Function(String data, String password)? resetpassword,
    TResult Function(BuildContext context)? signOut,
    TResult Function()? getUserEvent,
    TResult Function()? getVilleQuartier,
    TResult Function()? updateUserImage,
    TResult Function()? getModePaiement,
    required TResult orElse(),
  }) {
    if (sendCode != null) {
      return sendCode(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInEvent value) chooseExperience,
    required TResult Function(RegisterEvent value) register,
    required TResult Function(SendCode value) sendCode,
    required TResult Function(UpdateUserInfo value) updateUserInfo,
    required TResult Function(VerifyCode value) verifyCode,
    required TResult Function(ResetPassword value) resetpassword,
    required TResult Function(SignOutEvent value) signOut,
    required TResult Function(GetUserEvent value) getUserEvent,
    required TResult Function(GetVilleQuartier value) getVilleQuartier,
    required TResult Function(UpdateUserImage value) updateUserImage,
    required TResult Function(GetModePaiement value) getModePaiement,
  }) {
    return sendCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInEvent value)? chooseExperience,
    TResult? Function(RegisterEvent value)? register,
    TResult? Function(SendCode value)? sendCode,
    TResult? Function(UpdateUserInfo value)? updateUserInfo,
    TResult? Function(VerifyCode value)? verifyCode,
    TResult? Function(ResetPassword value)? resetpassword,
    TResult? Function(SignOutEvent value)? signOut,
    TResult? Function(GetUserEvent value)? getUserEvent,
    TResult? Function(GetVilleQuartier value)? getVilleQuartier,
    TResult? Function(UpdateUserImage value)? updateUserImage,
    TResult? Function(GetModePaiement value)? getModePaiement,
  }) {
    return sendCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInEvent value)? chooseExperience,
    TResult Function(RegisterEvent value)? register,
    TResult Function(SendCode value)? sendCode,
    TResult Function(UpdateUserInfo value)? updateUserInfo,
    TResult Function(VerifyCode value)? verifyCode,
    TResult Function(ResetPassword value)? resetpassword,
    TResult Function(SignOutEvent value)? signOut,
    TResult Function(GetUserEvent value)? getUserEvent,
    TResult Function(GetVilleQuartier value)? getVilleQuartier,
    TResult Function(UpdateUserImage value)? updateUserImage,
    TResult Function(GetModePaiement value)? getModePaiement,
    required TResult orElse(),
  }) {
    if (sendCode != null) {
      return sendCode(this);
    }
    return orElse();
  }
}

abstract class SendCode implements UserEvent {
  const factory SendCode({required final String data}) = _$SendCodeImpl;

  String get data;
  @JsonKey(ignore: true)
  _$$SendCodeImplCopyWith<_$SendCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateUserInfoImplCopyWith<$Res> {
  factory _$$UpdateUserInfoImplCopyWith(_$UpdateUserInfoImpl value,
          $Res Function(_$UpdateUserInfoImpl) then) =
      __$$UpdateUserInfoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<dynamic, dynamic> data});
}

/// @nodoc
class __$$UpdateUserInfoImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UpdateUserInfoImpl>
    implements _$$UpdateUserInfoImplCopyWith<$Res> {
  __$$UpdateUserInfoImplCopyWithImpl(
      _$UpdateUserInfoImpl _value, $Res Function(_$UpdateUserInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$UpdateUserInfoImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
    ));
  }
}

/// @nodoc

class _$UpdateUserInfoImpl implements UpdateUserInfo {
  const _$UpdateUserInfoImpl({required final Map<dynamic, dynamic> data})
      : _data = data;

  final Map<dynamic, dynamic> _data;
  @override
  Map<dynamic, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'UserEvent.updateUserInfo(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserInfoImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserInfoImplCopyWith<_$UpdateUserInfoImpl> get copyWith =>
      __$$UpdateUserInfoImplCopyWithImpl<_$UpdateUserInfoImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, String password) chooseExperience,
    required TResult Function(
            String name, String phone, String password, String re_password)
        register,
    required TResult Function(String data) sendCode,
    required TResult Function(Map<dynamic, dynamic> data) updateUserInfo,
    required TResult Function(String data, String code) verifyCode,
    required TResult Function(String data, String password) resetpassword,
    required TResult Function(BuildContext context) signOut,
    required TResult Function() getUserEvent,
    required TResult Function() getVilleQuartier,
    required TResult Function() updateUserImage,
    required TResult Function() getModePaiement,
  }) {
    return updateUserInfo(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone, String password)? chooseExperience,
    TResult? Function(
            String name, String phone, String password, String re_password)?
        register,
    TResult? Function(String data)? sendCode,
    TResult? Function(Map<dynamic, dynamic> data)? updateUserInfo,
    TResult? Function(String data, String code)? verifyCode,
    TResult? Function(String data, String password)? resetpassword,
    TResult? Function(BuildContext context)? signOut,
    TResult? Function()? getUserEvent,
    TResult? Function()? getVilleQuartier,
    TResult? Function()? updateUserImage,
    TResult? Function()? getModePaiement,
  }) {
    return updateUserInfo?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, String password)? chooseExperience,
    TResult Function(
            String name, String phone, String password, String re_password)?
        register,
    TResult Function(String data)? sendCode,
    TResult Function(Map<dynamic, dynamic> data)? updateUserInfo,
    TResult Function(String data, String code)? verifyCode,
    TResult Function(String data, String password)? resetpassword,
    TResult Function(BuildContext context)? signOut,
    TResult Function()? getUserEvent,
    TResult Function()? getVilleQuartier,
    TResult Function()? updateUserImage,
    TResult Function()? getModePaiement,
    required TResult orElse(),
  }) {
    if (updateUserInfo != null) {
      return updateUserInfo(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInEvent value) chooseExperience,
    required TResult Function(RegisterEvent value) register,
    required TResult Function(SendCode value) sendCode,
    required TResult Function(UpdateUserInfo value) updateUserInfo,
    required TResult Function(VerifyCode value) verifyCode,
    required TResult Function(ResetPassword value) resetpassword,
    required TResult Function(SignOutEvent value) signOut,
    required TResult Function(GetUserEvent value) getUserEvent,
    required TResult Function(GetVilleQuartier value) getVilleQuartier,
    required TResult Function(UpdateUserImage value) updateUserImage,
    required TResult Function(GetModePaiement value) getModePaiement,
  }) {
    return updateUserInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInEvent value)? chooseExperience,
    TResult? Function(RegisterEvent value)? register,
    TResult? Function(SendCode value)? sendCode,
    TResult? Function(UpdateUserInfo value)? updateUserInfo,
    TResult? Function(VerifyCode value)? verifyCode,
    TResult? Function(ResetPassword value)? resetpassword,
    TResult? Function(SignOutEvent value)? signOut,
    TResult? Function(GetUserEvent value)? getUserEvent,
    TResult? Function(GetVilleQuartier value)? getVilleQuartier,
    TResult? Function(UpdateUserImage value)? updateUserImage,
    TResult? Function(GetModePaiement value)? getModePaiement,
  }) {
    return updateUserInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInEvent value)? chooseExperience,
    TResult Function(RegisterEvent value)? register,
    TResult Function(SendCode value)? sendCode,
    TResult Function(UpdateUserInfo value)? updateUserInfo,
    TResult Function(VerifyCode value)? verifyCode,
    TResult Function(ResetPassword value)? resetpassword,
    TResult Function(SignOutEvent value)? signOut,
    TResult Function(GetUserEvent value)? getUserEvent,
    TResult Function(GetVilleQuartier value)? getVilleQuartier,
    TResult Function(UpdateUserImage value)? updateUserImage,
    TResult Function(GetModePaiement value)? getModePaiement,
    required TResult orElse(),
  }) {
    if (updateUserInfo != null) {
      return updateUserInfo(this);
    }
    return orElse();
  }
}

abstract class UpdateUserInfo implements UserEvent {
  const factory UpdateUserInfo({required final Map<dynamic, dynamic> data}) =
      _$UpdateUserInfoImpl;

  Map<dynamic, dynamic> get data;
  @JsonKey(ignore: true)
  _$$UpdateUserInfoImplCopyWith<_$UpdateUserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyCodeImplCopyWith<$Res> {
  factory _$$VerifyCodeImplCopyWith(
          _$VerifyCodeImpl value, $Res Function(_$VerifyCodeImpl) then) =
      __$$VerifyCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String data, String code});
}

/// @nodoc
class __$$VerifyCodeImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$VerifyCodeImpl>
    implements _$$VerifyCodeImplCopyWith<$Res> {
  __$$VerifyCodeImplCopyWithImpl(
      _$VerifyCodeImpl _value, $Res Function(_$VerifyCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? code = null,
  }) {
    return _then(_$VerifyCodeImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VerifyCodeImpl implements VerifyCode {
  const _$VerifyCodeImpl({required this.data, required this.code});

  @override
  final String data;
  @override
  final String code;

  @override
  String toString() {
    return 'UserEvent.verifyCode(data: $data, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyCodeImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyCodeImplCopyWith<_$VerifyCodeImpl> get copyWith =>
      __$$VerifyCodeImplCopyWithImpl<_$VerifyCodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, String password) chooseExperience,
    required TResult Function(
            String name, String phone, String password, String re_password)
        register,
    required TResult Function(String data) sendCode,
    required TResult Function(Map<dynamic, dynamic> data) updateUserInfo,
    required TResult Function(String data, String code) verifyCode,
    required TResult Function(String data, String password) resetpassword,
    required TResult Function(BuildContext context) signOut,
    required TResult Function() getUserEvent,
    required TResult Function() getVilleQuartier,
    required TResult Function() updateUserImage,
    required TResult Function() getModePaiement,
  }) {
    return verifyCode(data, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone, String password)? chooseExperience,
    TResult? Function(
            String name, String phone, String password, String re_password)?
        register,
    TResult? Function(String data)? sendCode,
    TResult? Function(Map<dynamic, dynamic> data)? updateUserInfo,
    TResult? Function(String data, String code)? verifyCode,
    TResult? Function(String data, String password)? resetpassword,
    TResult? Function(BuildContext context)? signOut,
    TResult? Function()? getUserEvent,
    TResult? Function()? getVilleQuartier,
    TResult? Function()? updateUserImage,
    TResult? Function()? getModePaiement,
  }) {
    return verifyCode?.call(data, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, String password)? chooseExperience,
    TResult Function(
            String name, String phone, String password, String re_password)?
        register,
    TResult Function(String data)? sendCode,
    TResult Function(Map<dynamic, dynamic> data)? updateUserInfo,
    TResult Function(String data, String code)? verifyCode,
    TResult Function(String data, String password)? resetpassword,
    TResult Function(BuildContext context)? signOut,
    TResult Function()? getUserEvent,
    TResult Function()? getVilleQuartier,
    TResult Function()? updateUserImage,
    TResult Function()? getModePaiement,
    required TResult orElse(),
  }) {
    if (verifyCode != null) {
      return verifyCode(data, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInEvent value) chooseExperience,
    required TResult Function(RegisterEvent value) register,
    required TResult Function(SendCode value) sendCode,
    required TResult Function(UpdateUserInfo value) updateUserInfo,
    required TResult Function(VerifyCode value) verifyCode,
    required TResult Function(ResetPassword value) resetpassword,
    required TResult Function(SignOutEvent value) signOut,
    required TResult Function(GetUserEvent value) getUserEvent,
    required TResult Function(GetVilleQuartier value) getVilleQuartier,
    required TResult Function(UpdateUserImage value) updateUserImage,
    required TResult Function(GetModePaiement value) getModePaiement,
  }) {
    return verifyCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInEvent value)? chooseExperience,
    TResult? Function(RegisterEvent value)? register,
    TResult? Function(SendCode value)? sendCode,
    TResult? Function(UpdateUserInfo value)? updateUserInfo,
    TResult? Function(VerifyCode value)? verifyCode,
    TResult? Function(ResetPassword value)? resetpassword,
    TResult? Function(SignOutEvent value)? signOut,
    TResult? Function(GetUserEvent value)? getUserEvent,
    TResult? Function(GetVilleQuartier value)? getVilleQuartier,
    TResult? Function(UpdateUserImage value)? updateUserImage,
    TResult? Function(GetModePaiement value)? getModePaiement,
  }) {
    return verifyCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInEvent value)? chooseExperience,
    TResult Function(RegisterEvent value)? register,
    TResult Function(SendCode value)? sendCode,
    TResult Function(UpdateUserInfo value)? updateUserInfo,
    TResult Function(VerifyCode value)? verifyCode,
    TResult Function(ResetPassword value)? resetpassword,
    TResult Function(SignOutEvent value)? signOut,
    TResult Function(GetUserEvent value)? getUserEvent,
    TResult Function(GetVilleQuartier value)? getVilleQuartier,
    TResult Function(UpdateUserImage value)? updateUserImage,
    TResult Function(GetModePaiement value)? getModePaiement,
    required TResult orElse(),
  }) {
    if (verifyCode != null) {
      return verifyCode(this);
    }
    return orElse();
  }
}

abstract class VerifyCode implements UserEvent {
  const factory VerifyCode(
      {required final String data,
      required final String code}) = _$VerifyCodeImpl;

  String get data;
  String get code;
  @JsonKey(ignore: true)
  _$$VerifyCodeImplCopyWith<_$VerifyCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetPasswordImplCopyWith<$Res> {
  factory _$$ResetPasswordImplCopyWith(
          _$ResetPasswordImpl value, $Res Function(_$ResetPasswordImpl) then) =
      __$$ResetPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String data, String password});
}

/// @nodoc
class __$$ResetPasswordImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$ResetPasswordImpl>
    implements _$$ResetPasswordImplCopyWith<$Res> {
  __$$ResetPasswordImplCopyWithImpl(
      _$ResetPasswordImpl _value, $Res Function(_$ResetPasswordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? password = null,
  }) {
    return _then(_$ResetPasswordImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ResetPasswordImpl implements ResetPassword {
  const _$ResetPasswordImpl({required this.data, required this.password});

  @override
  final String data;
  @override
  final String password;

  @override
  String toString() {
    return 'UserEvent.resetpassword(data: $data, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordImplCopyWith<_$ResetPasswordImpl> get copyWith =>
      __$$ResetPasswordImplCopyWithImpl<_$ResetPasswordImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone, String password) chooseExperience,
    required TResult Function(
            String name, String phone, String password, String re_password)
        register,
    required TResult Function(String data) sendCode,
    required TResult Function(Map<dynamic, dynamic> data) updateUserInfo,
    required TResult Function(String data, String code) verifyCode,
    required TResult Function(String data, String password) resetpassword,
    required TResult Function(BuildContext context) signOut,
    required TResult Function() getUserEvent,
    required TResult Function() getVilleQuartier,
    required TResult Function() updateUserImage,
    required TResult Function() getModePaiement,
  }) {
    return resetpassword(data, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone, String password)? chooseExperience,
    TResult? Function(
            String name, String phone, String password, String re_password)?
        register,
    TResult? Function(String data)? sendCode,
    TResult? Function(Map<dynamic, dynamic> data)? updateUserInfo,
    TResult? Function(String data, String code)? verifyCode,
    TResult? Function(String data, String password)? resetpassword,
    TResult? Function(BuildContext context)? signOut,
    TResult? Function()? getUserEvent,
    TResult? Function()? getVilleQuartier,
    TResult? Function()? updateUserImage,
    TResult? Function()? getModePaiement,
  }) {
    return resetpassword?.call(data, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, String password)? chooseExperience,
    TResult Function(
            String name, String phone, String password, String re_password)?
        register,
    TResult Function(String data)? sendCode,
    TResult Function(Map<dynamic, dynamic> data)? updateUserInfo,
    TResult Function(String data, String code)? verifyCode,
    TResult Function(String data, String password)? resetpassword,
    TResult Function(BuildContext context)? signOut,
    TResult Function()? getUserEvent,
    TResult Function()? getVilleQuartier,
    TResult Function()? updateUserImage,
    TResult Function()? getModePaiement,
    required TResult orElse(),
  }) {
    if (resetpassword != null) {
      return resetpassword(data, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInEvent value) chooseExperience,
    required TResult Function(RegisterEvent value) register,
    required TResult Function(SendCode value) sendCode,
    required TResult Function(UpdateUserInfo value) updateUserInfo,
    required TResult Function(VerifyCode value) verifyCode,
    required TResult Function(ResetPassword value) resetpassword,
    required TResult Function(SignOutEvent value) signOut,
    required TResult Function(GetUserEvent value) getUserEvent,
    required TResult Function(GetVilleQuartier value) getVilleQuartier,
    required TResult Function(UpdateUserImage value) updateUserImage,
    required TResult Function(GetModePaiement value) getModePaiement,
  }) {
    return resetpassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInEvent value)? chooseExperience,
    TResult? Function(RegisterEvent value)? register,
    TResult? Function(SendCode value)? sendCode,
    TResult? Function(UpdateUserInfo value)? updateUserInfo,
    TResult? Function(VerifyCode value)? verifyCode,
    TResult? Function(ResetPassword value)? resetpassword,
    TResult? Function(SignOutEvent value)? signOut,
    TResult? Function(GetUserEvent value)? getUserEvent,
    TResult? Function(GetVilleQuartier value)? getVilleQuartier,
    TResult? Function(UpdateUserImage value)? updateUserImage,
    TResult? Function(GetModePaiement value)? getModePaiement,
  }) {
    return resetpassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInEvent value)? chooseExperience,
    TResult Function(RegisterEvent value)? register,
    TResult Function(SendCode value)? sendCode,
    TResult Function(UpdateUserInfo value)? updateUserInfo,
    TResult Function(VerifyCode value)? verifyCode,
    TResult Function(ResetPassword value)? resetpassword,
    TResult Function(SignOutEvent value)? signOut,
    TResult Function(GetUserEvent value)? getUserEvent,
    TResult Function(GetVilleQuartier value)? getVilleQuartier,
    TResult Function(UpdateUserImage value)? updateUserImage,
    TResult Function(GetModePaiement value)? getModePaiement,
    required TResult orElse(),
  }) {
    if (resetpassword != null) {
      return resetpassword(this);
    }
    return orElse();
  }
}

abstract class ResetPassword implements UserEvent {
  const factory ResetPassword(
      {required final String data,
      required final String password}) = _$ResetPasswordImpl;

  String get data;
  String get password;
  @JsonKey(ignore: true)
  _$$ResetPasswordImplCopyWith<_$ResetPasswordImpl> get copyWith =>
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
    required TResult Function(String data) sendCode,
    required TResult Function(Map<dynamic, dynamic> data) updateUserInfo,
    required TResult Function(String data, String code) verifyCode,
    required TResult Function(String data, String password) resetpassword,
    required TResult Function(BuildContext context) signOut,
    required TResult Function() getUserEvent,
    required TResult Function() getVilleQuartier,
    required TResult Function() updateUserImage,
    required TResult Function() getModePaiement,
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
    TResult? Function(String data)? sendCode,
    TResult? Function(Map<dynamic, dynamic> data)? updateUserInfo,
    TResult? Function(String data, String code)? verifyCode,
    TResult? Function(String data, String password)? resetpassword,
    TResult? Function(BuildContext context)? signOut,
    TResult? Function()? getUserEvent,
    TResult? Function()? getVilleQuartier,
    TResult? Function()? updateUserImage,
    TResult? Function()? getModePaiement,
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
    TResult Function(String data)? sendCode,
    TResult Function(Map<dynamic, dynamic> data)? updateUserInfo,
    TResult Function(String data, String code)? verifyCode,
    TResult Function(String data, String password)? resetpassword,
    TResult Function(BuildContext context)? signOut,
    TResult Function()? getUserEvent,
    TResult Function()? getVilleQuartier,
    TResult Function()? updateUserImage,
    TResult Function()? getModePaiement,
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
    required TResult Function(SendCode value) sendCode,
    required TResult Function(UpdateUserInfo value) updateUserInfo,
    required TResult Function(VerifyCode value) verifyCode,
    required TResult Function(ResetPassword value) resetpassword,
    required TResult Function(SignOutEvent value) signOut,
    required TResult Function(GetUserEvent value) getUserEvent,
    required TResult Function(GetVilleQuartier value) getVilleQuartier,
    required TResult Function(UpdateUserImage value) updateUserImage,
    required TResult Function(GetModePaiement value) getModePaiement,
  }) {
    return signOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInEvent value)? chooseExperience,
    TResult? Function(RegisterEvent value)? register,
    TResult? Function(SendCode value)? sendCode,
    TResult? Function(UpdateUserInfo value)? updateUserInfo,
    TResult? Function(VerifyCode value)? verifyCode,
    TResult? Function(ResetPassword value)? resetpassword,
    TResult? Function(SignOutEvent value)? signOut,
    TResult? Function(GetUserEvent value)? getUserEvent,
    TResult? Function(GetVilleQuartier value)? getVilleQuartier,
    TResult? Function(UpdateUserImage value)? updateUserImage,
    TResult? Function(GetModePaiement value)? getModePaiement,
  }) {
    return signOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInEvent value)? chooseExperience,
    TResult Function(RegisterEvent value)? register,
    TResult Function(SendCode value)? sendCode,
    TResult Function(UpdateUserInfo value)? updateUserInfo,
    TResult Function(VerifyCode value)? verifyCode,
    TResult Function(ResetPassword value)? resetpassword,
    TResult Function(SignOutEvent value)? signOut,
    TResult Function(GetUserEvent value)? getUserEvent,
    TResult Function(GetVilleQuartier value)? getVilleQuartier,
    TResult Function(UpdateUserImage value)? updateUserImage,
    TResult Function(GetModePaiement value)? getModePaiement,
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
    required TResult Function(String data) sendCode,
    required TResult Function(Map<dynamic, dynamic> data) updateUserInfo,
    required TResult Function(String data, String code) verifyCode,
    required TResult Function(String data, String password) resetpassword,
    required TResult Function(BuildContext context) signOut,
    required TResult Function() getUserEvent,
    required TResult Function() getVilleQuartier,
    required TResult Function() updateUserImage,
    required TResult Function() getModePaiement,
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
    TResult? Function(String data)? sendCode,
    TResult? Function(Map<dynamic, dynamic> data)? updateUserInfo,
    TResult? Function(String data, String code)? verifyCode,
    TResult? Function(String data, String password)? resetpassword,
    TResult? Function(BuildContext context)? signOut,
    TResult? Function()? getUserEvent,
    TResult? Function()? getVilleQuartier,
    TResult? Function()? updateUserImage,
    TResult? Function()? getModePaiement,
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
    TResult Function(String data)? sendCode,
    TResult Function(Map<dynamic, dynamic> data)? updateUserInfo,
    TResult Function(String data, String code)? verifyCode,
    TResult Function(String data, String password)? resetpassword,
    TResult Function(BuildContext context)? signOut,
    TResult Function()? getUserEvent,
    TResult Function()? getVilleQuartier,
    TResult Function()? updateUserImage,
    TResult Function()? getModePaiement,
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
    required TResult Function(SendCode value) sendCode,
    required TResult Function(UpdateUserInfo value) updateUserInfo,
    required TResult Function(VerifyCode value) verifyCode,
    required TResult Function(ResetPassword value) resetpassword,
    required TResult Function(SignOutEvent value) signOut,
    required TResult Function(GetUserEvent value) getUserEvent,
    required TResult Function(GetVilleQuartier value) getVilleQuartier,
    required TResult Function(UpdateUserImage value) updateUserImage,
    required TResult Function(GetModePaiement value) getModePaiement,
  }) {
    return getUserEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInEvent value)? chooseExperience,
    TResult? Function(RegisterEvent value)? register,
    TResult? Function(SendCode value)? sendCode,
    TResult? Function(UpdateUserInfo value)? updateUserInfo,
    TResult? Function(VerifyCode value)? verifyCode,
    TResult? Function(ResetPassword value)? resetpassword,
    TResult? Function(SignOutEvent value)? signOut,
    TResult? Function(GetUserEvent value)? getUserEvent,
    TResult? Function(GetVilleQuartier value)? getVilleQuartier,
    TResult? Function(UpdateUserImage value)? updateUserImage,
    TResult? Function(GetModePaiement value)? getModePaiement,
  }) {
    return getUserEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInEvent value)? chooseExperience,
    TResult Function(RegisterEvent value)? register,
    TResult Function(SendCode value)? sendCode,
    TResult Function(UpdateUserInfo value)? updateUserInfo,
    TResult Function(VerifyCode value)? verifyCode,
    TResult Function(ResetPassword value)? resetpassword,
    TResult Function(SignOutEvent value)? signOut,
    TResult Function(GetUserEvent value)? getUserEvent,
    TResult Function(GetVilleQuartier value)? getVilleQuartier,
    TResult Function(UpdateUserImage value)? updateUserImage,
    TResult Function(GetModePaiement value)? getModePaiement,
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
abstract class _$$GetVilleQuartierImplCopyWith<$Res> {
  factory _$$GetVilleQuartierImplCopyWith(_$GetVilleQuartierImpl value,
          $Res Function(_$GetVilleQuartierImpl) then) =
      __$$GetVilleQuartierImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetVilleQuartierImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$GetVilleQuartierImpl>
    implements _$$GetVilleQuartierImplCopyWith<$Res> {
  __$$GetVilleQuartierImplCopyWithImpl(_$GetVilleQuartierImpl _value,
      $Res Function(_$GetVilleQuartierImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetVilleQuartierImpl implements GetVilleQuartier {
  const _$GetVilleQuartierImpl();

  @override
  String toString() {
    return 'UserEvent.getVilleQuartier()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetVilleQuartierImpl);
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
    required TResult Function(String data) sendCode,
    required TResult Function(Map<dynamic, dynamic> data) updateUserInfo,
    required TResult Function(String data, String code) verifyCode,
    required TResult Function(String data, String password) resetpassword,
    required TResult Function(BuildContext context) signOut,
    required TResult Function() getUserEvent,
    required TResult Function() getVilleQuartier,
    required TResult Function() updateUserImage,
    required TResult Function() getModePaiement,
  }) {
    return getVilleQuartier();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone, String password)? chooseExperience,
    TResult? Function(
            String name, String phone, String password, String re_password)?
        register,
    TResult? Function(String data)? sendCode,
    TResult? Function(Map<dynamic, dynamic> data)? updateUserInfo,
    TResult? Function(String data, String code)? verifyCode,
    TResult? Function(String data, String password)? resetpassword,
    TResult? Function(BuildContext context)? signOut,
    TResult? Function()? getUserEvent,
    TResult? Function()? getVilleQuartier,
    TResult? Function()? updateUserImage,
    TResult? Function()? getModePaiement,
  }) {
    return getVilleQuartier?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, String password)? chooseExperience,
    TResult Function(
            String name, String phone, String password, String re_password)?
        register,
    TResult Function(String data)? sendCode,
    TResult Function(Map<dynamic, dynamic> data)? updateUserInfo,
    TResult Function(String data, String code)? verifyCode,
    TResult Function(String data, String password)? resetpassword,
    TResult Function(BuildContext context)? signOut,
    TResult Function()? getUserEvent,
    TResult Function()? getVilleQuartier,
    TResult Function()? updateUserImage,
    TResult Function()? getModePaiement,
    required TResult orElse(),
  }) {
    if (getVilleQuartier != null) {
      return getVilleQuartier();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInEvent value) chooseExperience,
    required TResult Function(RegisterEvent value) register,
    required TResult Function(SendCode value) sendCode,
    required TResult Function(UpdateUserInfo value) updateUserInfo,
    required TResult Function(VerifyCode value) verifyCode,
    required TResult Function(ResetPassword value) resetpassword,
    required TResult Function(SignOutEvent value) signOut,
    required TResult Function(GetUserEvent value) getUserEvent,
    required TResult Function(GetVilleQuartier value) getVilleQuartier,
    required TResult Function(UpdateUserImage value) updateUserImage,
    required TResult Function(GetModePaiement value) getModePaiement,
  }) {
    return getVilleQuartier(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInEvent value)? chooseExperience,
    TResult? Function(RegisterEvent value)? register,
    TResult? Function(SendCode value)? sendCode,
    TResult? Function(UpdateUserInfo value)? updateUserInfo,
    TResult? Function(VerifyCode value)? verifyCode,
    TResult? Function(ResetPassword value)? resetpassword,
    TResult? Function(SignOutEvent value)? signOut,
    TResult? Function(GetUserEvent value)? getUserEvent,
    TResult? Function(GetVilleQuartier value)? getVilleQuartier,
    TResult? Function(UpdateUserImage value)? updateUserImage,
    TResult? Function(GetModePaiement value)? getModePaiement,
  }) {
    return getVilleQuartier?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInEvent value)? chooseExperience,
    TResult Function(RegisterEvent value)? register,
    TResult Function(SendCode value)? sendCode,
    TResult Function(UpdateUserInfo value)? updateUserInfo,
    TResult Function(VerifyCode value)? verifyCode,
    TResult Function(ResetPassword value)? resetpassword,
    TResult Function(SignOutEvent value)? signOut,
    TResult Function(GetUserEvent value)? getUserEvent,
    TResult Function(GetVilleQuartier value)? getVilleQuartier,
    TResult Function(UpdateUserImage value)? updateUserImage,
    TResult Function(GetModePaiement value)? getModePaiement,
    required TResult orElse(),
  }) {
    if (getVilleQuartier != null) {
      return getVilleQuartier(this);
    }
    return orElse();
  }
}

abstract class GetVilleQuartier implements UserEvent {
  const factory GetVilleQuartier() = _$GetVilleQuartierImpl;
}

/// @nodoc
abstract class _$$UpdateUserImageImplCopyWith<$Res> {
  factory _$$UpdateUserImageImplCopyWith(_$UpdateUserImageImpl value,
          $Res Function(_$UpdateUserImageImpl) then) =
      __$$UpdateUserImageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateUserImageImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UpdateUserImageImpl>
    implements _$$UpdateUserImageImplCopyWith<$Res> {
  __$$UpdateUserImageImplCopyWithImpl(
      _$UpdateUserImageImpl _value, $Res Function(_$UpdateUserImageImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpdateUserImageImpl implements UpdateUserImage {
  const _$UpdateUserImageImpl();

  @override
  String toString() {
    return 'UserEvent.updateUserImage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdateUserImageImpl);
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
    required TResult Function(String data) sendCode,
    required TResult Function(Map<dynamic, dynamic> data) updateUserInfo,
    required TResult Function(String data, String code) verifyCode,
    required TResult Function(String data, String password) resetpassword,
    required TResult Function(BuildContext context) signOut,
    required TResult Function() getUserEvent,
    required TResult Function() getVilleQuartier,
    required TResult Function() updateUserImage,
    required TResult Function() getModePaiement,
  }) {
    return updateUserImage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone, String password)? chooseExperience,
    TResult? Function(
            String name, String phone, String password, String re_password)?
        register,
    TResult? Function(String data)? sendCode,
    TResult? Function(Map<dynamic, dynamic> data)? updateUserInfo,
    TResult? Function(String data, String code)? verifyCode,
    TResult? Function(String data, String password)? resetpassword,
    TResult? Function(BuildContext context)? signOut,
    TResult? Function()? getUserEvent,
    TResult? Function()? getVilleQuartier,
    TResult? Function()? updateUserImage,
    TResult? Function()? getModePaiement,
  }) {
    return updateUserImage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, String password)? chooseExperience,
    TResult Function(
            String name, String phone, String password, String re_password)?
        register,
    TResult Function(String data)? sendCode,
    TResult Function(Map<dynamic, dynamic> data)? updateUserInfo,
    TResult Function(String data, String code)? verifyCode,
    TResult Function(String data, String password)? resetpassword,
    TResult Function(BuildContext context)? signOut,
    TResult Function()? getUserEvent,
    TResult Function()? getVilleQuartier,
    TResult Function()? updateUserImage,
    TResult Function()? getModePaiement,
    required TResult orElse(),
  }) {
    if (updateUserImage != null) {
      return updateUserImage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInEvent value) chooseExperience,
    required TResult Function(RegisterEvent value) register,
    required TResult Function(SendCode value) sendCode,
    required TResult Function(UpdateUserInfo value) updateUserInfo,
    required TResult Function(VerifyCode value) verifyCode,
    required TResult Function(ResetPassword value) resetpassword,
    required TResult Function(SignOutEvent value) signOut,
    required TResult Function(GetUserEvent value) getUserEvent,
    required TResult Function(GetVilleQuartier value) getVilleQuartier,
    required TResult Function(UpdateUserImage value) updateUserImage,
    required TResult Function(GetModePaiement value) getModePaiement,
  }) {
    return updateUserImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInEvent value)? chooseExperience,
    TResult? Function(RegisterEvent value)? register,
    TResult? Function(SendCode value)? sendCode,
    TResult? Function(UpdateUserInfo value)? updateUserInfo,
    TResult? Function(VerifyCode value)? verifyCode,
    TResult? Function(ResetPassword value)? resetpassword,
    TResult? Function(SignOutEvent value)? signOut,
    TResult? Function(GetUserEvent value)? getUserEvent,
    TResult? Function(GetVilleQuartier value)? getVilleQuartier,
    TResult? Function(UpdateUserImage value)? updateUserImage,
    TResult? Function(GetModePaiement value)? getModePaiement,
  }) {
    return updateUserImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInEvent value)? chooseExperience,
    TResult Function(RegisterEvent value)? register,
    TResult Function(SendCode value)? sendCode,
    TResult Function(UpdateUserInfo value)? updateUserInfo,
    TResult Function(VerifyCode value)? verifyCode,
    TResult Function(ResetPassword value)? resetpassword,
    TResult Function(SignOutEvent value)? signOut,
    TResult Function(GetUserEvent value)? getUserEvent,
    TResult Function(GetVilleQuartier value)? getVilleQuartier,
    TResult Function(UpdateUserImage value)? updateUserImage,
    TResult Function(GetModePaiement value)? getModePaiement,
    required TResult orElse(),
  }) {
    if (updateUserImage != null) {
      return updateUserImage(this);
    }
    return orElse();
  }
}

abstract class UpdateUserImage implements UserEvent {
  const factory UpdateUserImage() = _$UpdateUserImageImpl;
}

/// @nodoc
abstract class _$$GetModePaiementImplCopyWith<$Res> {
  factory _$$GetModePaiementImplCopyWith(_$GetModePaiementImpl value,
          $Res Function(_$GetModePaiementImpl) then) =
      __$$GetModePaiementImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetModePaiementImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$GetModePaiementImpl>
    implements _$$GetModePaiementImplCopyWith<$Res> {
  __$$GetModePaiementImplCopyWithImpl(
      _$GetModePaiementImpl _value, $Res Function(_$GetModePaiementImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetModePaiementImpl implements GetModePaiement {
  const _$GetModePaiementImpl();

  @override
  String toString() {
    return 'UserEvent.getModePaiement()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetModePaiementImpl);
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
    required TResult Function(String data) sendCode,
    required TResult Function(Map<dynamic, dynamic> data) updateUserInfo,
    required TResult Function(String data, String code) verifyCode,
    required TResult Function(String data, String password) resetpassword,
    required TResult Function(BuildContext context) signOut,
    required TResult Function() getUserEvent,
    required TResult Function() getVilleQuartier,
    required TResult Function() updateUserImage,
    required TResult Function() getModePaiement,
  }) {
    return getModePaiement();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone, String password)? chooseExperience,
    TResult? Function(
            String name, String phone, String password, String re_password)?
        register,
    TResult? Function(String data)? sendCode,
    TResult? Function(Map<dynamic, dynamic> data)? updateUserInfo,
    TResult? Function(String data, String code)? verifyCode,
    TResult? Function(String data, String password)? resetpassword,
    TResult? Function(BuildContext context)? signOut,
    TResult? Function()? getUserEvent,
    TResult? Function()? getVilleQuartier,
    TResult? Function()? updateUserImage,
    TResult? Function()? getModePaiement,
  }) {
    return getModePaiement?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone, String password)? chooseExperience,
    TResult Function(
            String name, String phone, String password, String re_password)?
        register,
    TResult Function(String data)? sendCode,
    TResult Function(Map<dynamic, dynamic> data)? updateUserInfo,
    TResult Function(String data, String code)? verifyCode,
    TResult Function(String data, String password)? resetpassword,
    TResult Function(BuildContext context)? signOut,
    TResult Function()? getUserEvent,
    TResult Function()? getVilleQuartier,
    TResult Function()? updateUserImage,
    TResult Function()? getModePaiement,
    required TResult orElse(),
  }) {
    if (getModePaiement != null) {
      return getModePaiement();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInEvent value) chooseExperience,
    required TResult Function(RegisterEvent value) register,
    required TResult Function(SendCode value) sendCode,
    required TResult Function(UpdateUserInfo value) updateUserInfo,
    required TResult Function(VerifyCode value) verifyCode,
    required TResult Function(ResetPassword value) resetpassword,
    required TResult Function(SignOutEvent value) signOut,
    required TResult Function(GetUserEvent value) getUserEvent,
    required TResult Function(GetVilleQuartier value) getVilleQuartier,
    required TResult Function(UpdateUserImage value) updateUserImage,
    required TResult Function(GetModePaiement value) getModePaiement,
  }) {
    return getModePaiement(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInEvent value)? chooseExperience,
    TResult? Function(RegisterEvent value)? register,
    TResult? Function(SendCode value)? sendCode,
    TResult? Function(UpdateUserInfo value)? updateUserInfo,
    TResult? Function(VerifyCode value)? verifyCode,
    TResult? Function(ResetPassword value)? resetpassword,
    TResult? Function(SignOutEvent value)? signOut,
    TResult? Function(GetUserEvent value)? getUserEvent,
    TResult? Function(GetVilleQuartier value)? getVilleQuartier,
    TResult? Function(UpdateUserImage value)? updateUserImage,
    TResult? Function(GetModePaiement value)? getModePaiement,
  }) {
    return getModePaiement?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInEvent value)? chooseExperience,
    TResult Function(RegisterEvent value)? register,
    TResult Function(SendCode value)? sendCode,
    TResult Function(UpdateUserInfo value)? updateUserInfo,
    TResult Function(VerifyCode value)? verifyCode,
    TResult Function(ResetPassword value)? resetpassword,
    TResult Function(SignOutEvent value)? signOut,
    TResult Function(GetUserEvent value)? getUserEvent,
    TResult Function(GetVilleQuartier value)? getVilleQuartier,
    TResult Function(UpdateUserImage value)? updateUserImage,
    TResult Function(GetModePaiement value)? getModePaiement,
    required TResult orElse(),
  }) {
    if (getModePaiement != null) {
      return getModePaiement(this);
    }
    return orElse();
  }
}

abstract class GetModePaiement implements UserEvent {
  const factory GetModePaiement() = _$GetModePaiementImpl;
}

/// @nodoc
mixin _$UserState {
  int? get isLoading => throw _privateConstructorUsedError;
  String? get authenticationFailedMessage => throw _privateConstructorUsedError;
  String? get registerFailedMessage => throw _privateConstructorUsedError;
  String? get villeUser => throw _privateConstructorUsedError;
  String? get quartierUser => throw _privateConstructorUsedError;
  String? get newPassword => throw _privateConstructorUsedError;
  int? get isCode => throw _privateConstructorUsedError;
  int? get isLoadingForgot => throw _privateConstructorUsedError;
  int? get isUpdateUserImage => throw _privateConstructorUsedError;
  int? get isCorrectCode => throw _privateConstructorUsedError;
  int? get isVilleQuartier => throw _privateConstructorUsedError;
  int? get loadModePaiement => throw _privateConstructorUsedError;
  bool? get successReset => throw _privateConstructorUsedError;
  List<ModePaiementModel>? get listModePaiement =>
      throw _privateConstructorUsedError;
  bool? get updating => throw _privateConstructorUsedError;

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
      String? registerFailedMessage,
      String? villeUser,
      String? quartierUser,
      String? newPassword,
      int? isCode,
      int? isLoadingForgot,
      int? isUpdateUserImage,
      int? isCorrectCode,
      int? isVilleQuartier,
      int? loadModePaiement,
      bool? successReset,
      List<ModePaiementModel>? listModePaiement,
      bool? updating});
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
    Object? villeUser = freezed,
    Object? quartierUser = freezed,
    Object? newPassword = freezed,
    Object? isCode = freezed,
    Object? isLoadingForgot = freezed,
    Object? isUpdateUserImage = freezed,
    Object? isCorrectCode = freezed,
    Object? isVilleQuartier = freezed,
    Object? loadModePaiement = freezed,
    Object? successReset = freezed,
    Object? listModePaiement = freezed,
    Object? updating = freezed,
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
      villeUser: freezed == villeUser
          ? _value.villeUser
          : villeUser // ignore: cast_nullable_to_non_nullable
              as String?,
      quartierUser: freezed == quartierUser
          ? _value.quartierUser
          : quartierUser // ignore: cast_nullable_to_non_nullable
              as String?,
      newPassword: freezed == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      isCode: freezed == isCode
          ? _value.isCode
          : isCode // ignore: cast_nullable_to_non_nullable
              as int?,
      isLoadingForgot: freezed == isLoadingForgot
          ? _value.isLoadingForgot
          : isLoadingForgot // ignore: cast_nullable_to_non_nullable
              as int?,
      isUpdateUserImage: freezed == isUpdateUserImage
          ? _value.isUpdateUserImage
          : isUpdateUserImage // ignore: cast_nullable_to_non_nullable
              as int?,
      isCorrectCode: freezed == isCorrectCode
          ? _value.isCorrectCode
          : isCorrectCode // ignore: cast_nullable_to_non_nullable
              as int?,
      isVilleQuartier: freezed == isVilleQuartier
          ? _value.isVilleQuartier
          : isVilleQuartier // ignore: cast_nullable_to_non_nullable
              as int?,
      loadModePaiement: freezed == loadModePaiement
          ? _value.loadModePaiement
          : loadModePaiement // ignore: cast_nullable_to_non_nullable
              as int?,
      successReset: freezed == successReset
          ? _value.successReset
          : successReset // ignore: cast_nullable_to_non_nullable
              as bool?,
      listModePaiement: freezed == listModePaiement
          ? _value.listModePaiement
          : listModePaiement // ignore: cast_nullable_to_non_nullable
              as List<ModePaiementModel>?,
      updating: freezed == updating
          ? _value.updating
          : updating // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      String? registerFailedMessage,
      String? villeUser,
      String? quartierUser,
      String? newPassword,
      int? isCode,
      int? isLoadingForgot,
      int? isUpdateUserImage,
      int? isCorrectCode,
      int? isVilleQuartier,
      int? loadModePaiement,
      bool? successReset,
      List<ModePaiementModel>? listModePaiement,
      bool? updating});
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
    Object? villeUser = freezed,
    Object? quartierUser = freezed,
    Object? newPassword = freezed,
    Object? isCode = freezed,
    Object? isLoadingForgot = freezed,
    Object? isUpdateUserImage = freezed,
    Object? isCorrectCode = freezed,
    Object? isVilleQuartier = freezed,
    Object? loadModePaiement = freezed,
    Object? successReset = freezed,
    Object? listModePaiement = freezed,
    Object? updating = freezed,
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
      villeUser: freezed == villeUser
          ? _value.villeUser
          : villeUser // ignore: cast_nullable_to_non_nullable
              as String?,
      quartierUser: freezed == quartierUser
          ? _value.quartierUser
          : quartierUser // ignore: cast_nullable_to_non_nullable
              as String?,
      newPassword: freezed == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      isCode: freezed == isCode
          ? _value.isCode
          : isCode // ignore: cast_nullable_to_non_nullable
              as int?,
      isLoadingForgot: freezed == isLoadingForgot
          ? _value.isLoadingForgot
          : isLoadingForgot // ignore: cast_nullable_to_non_nullable
              as int?,
      isUpdateUserImage: freezed == isUpdateUserImage
          ? _value.isUpdateUserImage
          : isUpdateUserImage // ignore: cast_nullable_to_non_nullable
              as int?,
      isCorrectCode: freezed == isCorrectCode
          ? _value.isCorrectCode
          : isCorrectCode // ignore: cast_nullable_to_non_nullable
              as int?,
      isVilleQuartier: freezed == isVilleQuartier
          ? _value.isVilleQuartier
          : isVilleQuartier // ignore: cast_nullable_to_non_nullable
              as int?,
      loadModePaiement: freezed == loadModePaiement
          ? _value.loadModePaiement
          : loadModePaiement // ignore: cast_nullable_to_non_nullable
              as int?,
      successReset: freezed == successReset
          ? _value.successReset
          : successReset // ignore: cast_nullable_to_non_nullable
              as bool?,
      listModePaiement: freezed == listModePaiement
          ? _value._listModePaiement
          : listModePaiement // ignore: cast_nullable_to_non_nullable
              as List<ModePaiementModel>?,
      updating: freezed == updating
          ? _value.updating
          : updating // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$UserStateImpl implements _UserState {
  const _$UserStateImpl(
      {this.isLoading,
      this.authenticationFailedMessage,
      this.registerFailedMessage,
      this.villeUser,
      this.quartierUser,
      this.newPassword,
      this.isCode,
      this.isLoadingForgot,
      this.isUpdateUserImage,
      this.isCorrectCode,
      this.isVilleQuartier,
      this.loadModePaiement,
      this.successReset,
      final List<ModePaiementModel>? listModePaiement,
      this.updating})
      : _listModePaiement = listModePaiement;

  @override
  final int? isLoading;
  @override
  final String? authenticationFailedMessage;
  @override
  final String? registerFailedMessage;
  @override
  final String? villeUser;
  @override
  final String? quartierUser;
  @override
  final String? newPassword;
  @override
  final int? isCode;
  @override
  final int? isLoadingForgot;
  @override
  final int? isUpdateUserImage;
  @override
  final int? isCorrectCode;
  @override
  final int? isVilleQuartier;
  @override
  final int? loadModePaiement;
  @override
  final bool? successReset;
  final List<ModePaiementModel>? _listModePaiement;
  @override
  List<ModePaiementModel>? get listModePaiement {
    final value = _listModePaiement;
    if (value == null) return null;
    if (_listModePaiement is EqualUnmodifiableListView)
      return _listModePaiement;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? updating;

  @override
  String toString() {
    return 'UserState(isLoading: $isLoading, authenticationFailedMessage: $authenticationFailedMessage, registerFailedMessage: $registerFailedMessage, villeUser: $villeUser, quartierUser: $quartierUser, newPassword: $newPassword, isCode: $isCode, isLoadingForgot: $isLoadingForgot, isUpdateUserImage: $isUpdateUserImage, isCorrectCode: $isCorrectCode, isVilleQuartier: $isVilleQuartier, loadModePaiement: $loadModePaiement, successReset: $successReset, listModePaiement: $listModePaiement, updating: $updating)';
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
                other.registerFailedMessage == registerFailedMessage) &&
            (identical(other.villeUser, villeUser) ||
                other.villeUser == villeUser) &&
            (identical(other.quartierUser, quartierUser) ||
                other.quartierUser == quartierUser) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.isCode, isCode) || other.isCode == isCode) &&
            (identical(other.isLoadingForgot, isLoadingForgot) ||
                other.isLoadingForgot == isLoadingForgot) &&
            (identical(other.isUpdateUserImage, isUpdateUserImage) ||
                other.isUpdateUserImage == isUpdateUserImage) &&
            (identical(other.isCorrectCode, isCorrectCode) ||
                other.isCorrectCode == isCorrectCode) &&
            (identical(other.isVilleQuartier, isVilleQuartier) ||
                other.isVilleQuartier == isVilleQuartier) &&
            (identical(other.loadModePaiement, loadModePaiement) ||
                other.loadModePaiement == loadModePaiement) &&
            (identical(other.successReset, successReset) ||
                other.successReset == successReset) &&
            const DeepCollectionEquality()
                .equals(other._listModePaiement, _listModePaiement) &&
            (identical(other.updating, updating) ||
                other.updating == updating));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      authenticationFailedMessage,
      registerFailedMessage,
      villeUser,
      quartierUser,
      newPassword,
      isCode,
      isLoadingForgot,
      isUpdateUserImage,
      isCorrectCode,
      isVilleQuartier,
      loadModePaiement,
      successReset,
      const DeepCollectionEquality().hash(_listModePaiement),
      updating);

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
      final String? registerFailedMessage,
      final String? villeUser,
      final String? quartierUser,
      final String? newPassword,
      final int? isCode,
      final int? isLoadingForgot,
      final int? isUpdateUserImage,
      final int? isCorrectCode,
      final int? isVilleQuartier,
      final int? loadModePaiement,
      final bool? successReset,
      final List<ModePaiementModel>? listModePaiement,
      final bool? updating}) = _$UserStateImpl;

  @override
  int? get isLoading;
  @override
  String? get authenticationFailedMessage;
  @override
  String? get registerFailedMessage;
  @override
  String? get villeUser;
  @override
  String? get quartierUser;
  @override
  String? get newPassword;
  @override
  int? get isCode;
  @override
  int? get isLoadingForgot;
  @override
  int? get isUpdateUserImage;
  @override
  int? get isCorrectCode;
  @override
  int? get isVilleQuartier;
  @override
  int? get loadModePaiement;
  @override
  bool? get successReset;
  @override
  List<ModePaiementModel>? get listModePaiement;
  @override
  bool? get updating;
  @override
  @JsonKey(ignore: true)
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
