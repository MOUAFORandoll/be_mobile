import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart' hide PreferencesService;
import 'package:BabanaExpress/common/models/user.dart';
import 'package:BabanaExpress/common/services/preferences_service.dart';
import 'package:BabanaExpress/common/services/user_service.dart';
import 'package:BabanaExpress/utils/Services/auth_social_service%20.dart';

part 'user_state.dart';

class UserCubit extends ObjectCubit<User, UserState> {
  final UserService userService;
  final PreferencesService preferencesService;
  final AuthSocialService authSocial;

  UserCubit(
    this.userService,
    this.preferencesService,
    this.authSocial,
  ) : super(const InitializingUserState()) {
    _getInitialState(true);
  }

  @override
  User? getObject(UserState state) {
    if (state is UserLoggedState) {
      return state.user;
    }
    return null;
  }

  void socialLogin() {
    final stateBefore = state;

    authSocial.signInWithGoogle().then((googleResponse) {
      if (googleResponse == null) {
        emit(AuthErrorState('Erreur lors de la connexion avec Google.'));
        return;
      }

      final data = {
        'email': googleResponse.email,
        'nom': googleResponse.displayName,
        'prenom': '',
        'socialPicture': googleResponse.photoUrl,
        'isSocialGoogle': true
      };

      emit(const AuthLoadingState());

      userService.loginSocial(data: data).then((loginResponse) {
        log('=======${loginResponse}============');
        log('=======${loginResponse.success}============');

        if (loginResponse.success) {
          log('===================');
          final user = loginResponse.content!.user;
          final token = loginResponse.content!.token;
          final refreshToken = loginResponse.content!.refreshToken;

          preferencesService.saveUser(user).then((_) {
            preferencesService.saveRefreshToken(refreshToken);
            return preferencesService.saveAuthToken(token);
          }).then((_) {
            if (user.isComplete) {
              emit(AuthUserSuccessState());
              emit(stateBefore);
            } else {
              log('===================');
              log('========CompleteUserUserState===========');
              emit(CompleteUserProfileState());
              emit(stateBefore);
              log('========CompleteUserUserState===========');
            }
          });
        } else {
          emit(AuthErrorState(loginResponse.message));
        }
      }).catchError((error, trace) {
        emit(AuthErrorState(error, trace));
      }).whenComplete(() {
        emit(stateBefore);
      });
    }).catchError((error, trace) {
      emit(AuthErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void verifyUserExist({
    required String identifiant,
  }) {
    final stateBefore = state;

    emit(AuthLoadingState());

    final data = {
      'identifiant': identifiant,
    };
    userService.verifyUserExist(data: data).then((response) async {
      if (response.success) {
        if (response.content!.existStatus == true) {
          emit(const AuthUserExistState());
        } else {
          emit(AuthUserNotExistState());
          emit(InitializingUserState());
        }
      } else {
        emit(AuthErrorState(response.message));
        emit(stateBefore);
      }
    }, onError: (error, trace) {
      emit(AuthErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void sendRecoveryCode({
    required String identifiant,
  }) {
    final stateBefore = state;

    emit(AuthLoadingState());

    final data = {
      'identifiant': identifiant,
    };
    userService.sendRecoveryCode(data: data).then((response) async {
      if (response.success) {
        emit(const SendedState());
      } else {
        emit(AuthErrorState(response.message));
        emit(stateBefore);
      }
    }, onError: (error, trace) {
      emit(AuthErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void verifyCode({
    required String identifiant,
    required String code,
  }) {
    final stateBefore = state;

    emit(AuthLoadingState());

    final data = {
      'identifiant': identifiant,
      'code': code,
    };
    userService.verifyCode(data: data).then((response) async {
      if (response.success) {
        emit(const ValidCodeState());
      } else {
        emit(AuthErrorState(response.message));
        emit(stateBefore);
      }
    }, onError: (error, trace) {
      emit(AuthErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void newPassword({
    required String identifiant,
    required String password,
  }) {
    final stateBefore = state;

    emit(AuthLoadingState());

    final data = {
      'password': password,
      'identifiant': identifiant,
    };
    userService.newPassword(data: data).then((response) async {
      if (response.success) {
        emit(const SuccesChangePasswordState());
      } else {
        emit(AuthErrorState(response.message));
        emit(stateBefore);
      }
    }, onError: (error, trace) {
      emit(AuthErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void resetState() {
    if (!(state is InitializingUserState)) {
      emit(InitializingUserState());
    }
  }

  void login({
    required String identifiant,
    required String password,
  }) {
    final stateBefore = state;

    emit(const AuthLoadingState());

    final data = {
      'identifiant': identifiant,
      'password': password,
    };
    userService.login(data: data).then((response) async {
      if (response.success) {
        preferencesService.saveUser(response.content!.user);
        preferencesService.saveAuthToken(response.content!.token);
        preferencesService.saveRefreshToken(response.content!.refreshToken);
        emit(const AuthUserSuccessState());
        emit(stateBefore);
      } else {
        emit(AuthErrorState(response.message));
        emit(stateBefore);
      }
    }, onError: (error, trace) {
      emit(AuthErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void completeProfil({
    required String phone,
  }) {
    final stateBefore = InitializingUserState();

    emit(const UserUpdatingState());

    final data = {
      'phone': phone,
    };
    userService.completeProfil(data: data).then((response) async {
      if (response.success) {
        preferencesService.saveUser(response.content!.user);
        preferencesService.saveAuthToken(response.content!.token);
        preferencesService.saveRefreshToken(response.content!.refreshToken);

        emit(const UserUpdatedState());

        emit(stateBefore);
      } else {
        emit(AuthErrorState(response.message));
        emit(stateBefore);
      }
    }, onError: (error, trace) {
      emit(AuthErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void me() {
    userService.getMe().then((response) async {
      if (response.success) {
        preferencesService.saveUser(response.content!.user);
      } else {
        emit(AuthErrorState(response.message));
      }
    }, onError: (error, trace) {
      emit(AuthErrorState(error, trace));
    });
  }

  void _getInitialState([bool refresh = false]) {
    final user = preferencesService.user;

    if (user == null) {
      emit(const UserNotLoggedState());
    } else {
      if (refresh) _refreshData();
      if (user.isComplete) {
        emit(UserLoggedState(user));
      } else {
        emit(const CompleteUserProfileState());
      }
    }
  }

  void register({
    required String phone,
    required String mail,
    required String name,
    required String password,
  }) {
    emit(const AuthLoadingState());

    final data = {
      'phone': phone,
      'email': mail,
      'nom': name,
      'prenom': '',
      'password': password,
    };
    userService.register(data: data).then((response) async {
      print('--=-==-=-${response}=');
      if (response.success) {
        preferencesService.saveUser(response.content!.user);
        preferencesService.saveAuthToken(response.content!.token);
        preferencesService.saveRefreshToken(response.content!.refreshToken);

        emit(const AuthUserSuccessState());
      } else {
        print('--response=-==-=-=');
        print(response.message);
        print('--=-==-=-=');
        emit(AuthErrorState(response.message));
      }
      emit(InitializingUserState());
    }, onError: (error, trace) {
      print('--=-==-=-=');
      emit(AuthErrorState(error, trace));
      emit(InitializingUserState());
    });
  }

  void reset() {
    _getInitialState();
  }

  User get user {
    final user = getObject(state) ?? object;

    if (user != null) return user;
    throw UnsupportedError(
        'cannot retrieve user when not logged: Current state is ${state.runtimeType}');
  }

  _refreshData() {
    if (preferencesService.user != null) {
      return userService.getMe().then((response) async {
        await preferencesService.saveUser(response.content!.user);
        emit(UserLoggedState(response.content!.user));
      }, onError: (error, trace) {
        emit(AuthErrorState(error, trace));
      });
    }
  }

  void updateProfilePicture({required File file}) {
    final stateBefore = state;

    emit(const UserUpdatingState());
    userService.updateProfilePicture(file: file).then((user) {
      preferencesService.saveUser(user);
      emit(const UserUpdatedState());
      emit(UserLoggedState(user));
    }, onError: (error, trace) {
      emit(UserErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void signOut() {
    if (state is UserLoggedState) {
      final stateBefore = state;
      emit(const UserLoggingOut());

      Future.wait([
        GoogleSignIn().signOut(),
        preferencesService.clear(),
        Future.delayed(const Duration(seconds: 2))
      ]).then((value) => emit(const UserNotLoggedState()),
          onError: (error, trace) {
        emit(UserErrorState(error, trace));
        emit(stateBefore);
      });
    } else {
      print('User is not logged ${state}');
    }
  }

  @override
  void update(User object) {
    // TODO: implement update
  }
}
