part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState(
      {int? isLoading,
      String? authenticationFailedMessage,
      String? registerFailedMessage,
      String? villeUser,
      String? quartierUser,
      int? isVilleQuartier}) = _UserState;

  factory UserState.initial() => UserState(
      isLoading: 0, villeUser: '', quartierUser: '', isVilleQuartier: 0);

  factory UserState.authenticationFailed({
    required String message,
  }) =>
      UserState(
        authenticationFailedMessage: message,
      );

  factory UserState.registerFailed({
    required String message,
  }) =>
      UserState(
        registerFailedMessage: message,
      );

  factory UserState.unauthenticated() => UserState.initial();

  factory UserState.checkingUser() => UserState.initial();

  factory UserState.loginIngUser() => UserState.initial();

  factory UserState.loginIngFailed({required String message}) =>
      UserState(authenticationFailedMessage: message);

  factory UserState.authenticated() => UserState.initial();
}
