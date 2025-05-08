part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState(
      {int? isLoading,
      String? authenticationFailedMessage,
      String? registerFailedMessage,
      String? villeUser,
      String? quartierUser,
      String? newPassword,
      int? isCode,
      int? isSocialAuthentification,
      int? isLoadingForgot,
      int? isUpdateUserImage,
      int? isUpdateUserInfo,
      bool? completeprofil,
      int? isCorrectCode,
      int? isVilleQuartier,
      int? loadModePaiement,
      bool? successReset,
      bool? loginUser,
      List<ModePaiementModel>? listModePaiement,
      required TextEditingController phone,
      required TextEditingController password,
      required TextEditingController name,
      required TextEditingController re_password,
      required int? isExistLoading,
      bool? updating}) = _UserState;

  factory UserState.initial() => UserState(
    loginUser :null,
        phone: TextEditingController(),
        password: TextEditingController(),
        name: TextEditingController(),
        re_password: TextEditingController(),
        isSocialAuthentification: null,
        isExistLoading: null,
        isCode: 0,
        updating: false,
        isCorrectCode: 0,
        loadModePaiement: 0,
        successReset: false,
        isLoading: 0,
        isUpdateUserImage: 0,
        villeUser: '',
        quartierUser: '',
        listModePaiement: [],
        isVilleQuartier: 0,
        isUpdateUserInfo: null,
        completeprofil: null,
      );

  factory UserState.unauthenticated() => UserState.initial();

  factory UserState.checkingUser() => UserState.initial();

  factory UserState.loginIngUser() => UserState.initial();

  factory UserState.authenticated() => UserState.initial();
}
