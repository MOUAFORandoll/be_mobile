import 'dart:async';
import 'dart:io';

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
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

  void socialLogin()async {
    final stateBefore = state;
    await authSocial.signInWithGoogle();
    // authSocial.signInWithGoogle().then((response) async {
    //   if (response == null) {
    //     print('*-------------------------nulll');
    //     emit(AuthErrorState('Erreur lors de la connexion avec Google.'));
    //     return;
    //   }
    //   final data = {
    //     'email': response!.email,
    //     'nom': response.displayName,
    //     'prenom': '',
    //     'socialPicture': response.photoUrl,
    //     'isSocialGoogle': true
    //   };
    //   emit(const AuthLoadingState());
    //   await userService.loginSocial(user: data).then((response) async {
    //     if (response.success) {
    //       preferencesService.saveUser(response.content!.user);
    //       preferencesService.saveAuthToken(response.content!.token);

    //       if (response.content!.user.isComplete) {
    //         emit(const AuthUserSuccessState());
    //       } else {
    //         emit(const CompleteUserUserState());
    //       }
    //     } else {
    //       emit(AuthErrorState(response.message));
    //     }
    //     emit(stateBefore);
    //   }, onError: (error, trace) {
    //     emit(AuthErrorState(error, trace));
    //     emit(stateBefore);
    //   });
    //   emit(stateBefore);
    // }, onError: (error, trace) {
    //   emit(AuthErrorState(error, trace));
    //   emit(stateBefore);
    // });
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

  void updateUser({
    required String phone,
  }) {
    final stateBefore = InitializingUserState();

    emit(const UserUpdatingState());

    final data = {
      'phone': phone,
    };
    userService.updateUser(data: data).then((response) async {
      if (response.success) {
        preferencesService.saveUser(response.content!.user);
        preferencesService.saveAuthToken(response.content!.token);
        emit(const UserUpdatedState());
      } else {
        emit(AuthErrorState(response.message));
      }
      emit(stateBefore);
    }, onError: (error, trace) {
      emit(AuthErrorState(error, trace));
      emit(stateBefore);
    });
  }

  void me() {
    userService.getMe().then((response) async {
      if (response.success) {
        preferencesService.saveUser(response.content!.user);
        preferencesService.saveAuthToken(response.content!.token);
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

  Future<void> _refreshData() {
    return userService.getMe().then((response) async {
      await preferencesService.saveUser(response.content!.user);
      preferencesService.saveAuthToken(response.content!.token);
      emit(UserLoggedState(response.content!.user));
    }, onError: (error, trace) {
      emit(AuthErrorState(error, trace));
    });
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
