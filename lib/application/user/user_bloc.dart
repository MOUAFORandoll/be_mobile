import 'dart:async';
import 'package:BananaExpress/application/database/database_cubit.dart';

import 'package:BananaExpress/application/user/repositories/user_repository.dart';
import 'package:BananaExpress/routes/app_router.dart';
import 'package:BananaExpress/utils/functions/app_loader.dart';
import 'package:BananaExpress/utils/functions/viewFunctions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '/entity.dart';
import '../export_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepo userRepo;
  final DatabaseCubit database;
  UserBloc({required this.userRepo, required this.database})
      : super(UserState.initial()) {
    // on<GetDataBateEvent>((event, emit) async {
    //   print('okkof');
    //   // final database = await DataBaseController.getInstance();
    //   // emit(GetDataBateState(database: database));
    // });

    on<SignInEvent>(_Login);
    on<SignOutEvent>(_OnSignOut);

    on<RegisterEvent>(_Register);
    on<GetUserEvent>(_GetUserEvent);
    // on<FailedRegister>(_Register);
  }

  _OnSignOut(SignOutEvent event, Emitter<UserState> emit) async {
    var loader = AppLoader.bounceLargeColorLoaderController();
    loader.open(event.context);
    await Future.delayed(Duration(seconds: 5), () {
      database.close();
      loader.close();
      AutoRouter.of(event.context).replaceAll([AuthRoute()]);
    });
    try {
      // database.saveKeyKen( );
    } catch (e) {}
  }

  _GetUserEvent(GetUserEvent event, Emitter<UserState> emit) async {
    await userRepo.getUser().then((value) async {
      print('------------------value----------${value.data}-');
      if (value.data['data'] != null &&
          value.data['data'] != [] &&
          value.data['data'].length != 0) {
        var _UserSave = User.fromJson(value.data['data']);

        await database.saveUser(_UserSave);
      }
    }).catchError((error) {});
  }

  _Login(SignInEvent event, Emitter<UserState> emit) async {
    var data = {
      'phone': event.phone,
      'password': event.password,
    };
    print(data);
    emit(state.copyWith(isLoading: 1));
    await userRepo.Login(data).then((response) async {
      if (response.statusCode == 200) {
        database.saveKeyKen(response.data);

        await userRepo.getUser().then((value) async {
          if (value != null) {
            print('------------------value----------${value.data}-');
            if (value.data['data'] != null &&
                value.data['data'] != [] &&
                value.data['data'].length != 0) {
              emit(state.copyWith(
                  isLoading: 2, authenticationFailedMessage: ''));
              emit(UserState.authenticated());

              var _UserSave = User.fromJson(value.data['data']);

              await database.saveUser(_UserSave);
            }
          }
        }).catchError((error) {
          emit(state.copyWith(
              isLoading: 3,
              authenticationFailedMessage:
                  'Une erreur est survenue recommencer'));
        });
      } else {
        emit(state.copyWith(
            isLoading: 3,
            authenticationFailedMessage: 'Phone ou mot de passe incorrect'));
      }
    }).onError((error, s) {
      // print('----${s}-----');
      // print('------${error}---');
      emit(state.copyWith(
          isLoading: 3,
          authenticationFailedMessage: 'Phone ou mot de passe incorrect'));
    });
  }

  _Register(RegisterEvent event, Emitter<UserState> emit) async {
    var data = {
      'phone': int.parse(event.phone),
      'password': event.password,
      'nom': event.name,
      'prenom': event.name,
    };
    print(data);
    emit(state.copyWith(isLoading: 1));
    // emit(UserState.loginIngUser());

    try {
      Response response = await userRepo.SignUp(data);

      if (response.statusCode == 201) {
        var data = {
          'phone': event.phone,
          'password': event.password,
        };
        print(data);

        try {
          var responselog = await userRepo.Login(data);

          if (responselog.statusCode == 200) {
            database.saveKeyKen(responselog.data);

            await userRepo.getUser().then((value) async {
              print('------------------value----------${value.data}-');
              if (value.data['data'] != null &&
                  value.data['data'] != [] &&
                  value.data['data'].length != 0) {
                emit(state.copyWith(
                    isLoading: 2, authenticationFailedMessage: ''));
                emit(UserState.authenticated());

                var _UserSave = User.fromJson(value.data['data']);

                await database.saveUser(_UserSave);
              }
            }).catchError((error) {
              emit(state.copyWith(
                  isLoading: 3,
                  authenticationFailedMessage:
                      'Une erreur est survenue recommencer'));
            });
          } else {
            emit(state.copyWith(
                isLoading: 3,
                authenticationFailedMessage: 'Identifiants incorrects'));
          }
        } catch (e) {
          emit(state.copyWith(
              isLoading: 3,
              authenticationFailedMessage:
                  'Une erreur est survenue recommencer'));
        }
      } else {
        emit(state.copyWith(
            isLoading: 3,
            authenticationFailedMessage: 'Identifiants incorrects'));
      }
    } catch (e) {
      emit(state.copyWith(
          isLoading: 3,
          authenticationFailedMessage: 'Une erreur est survenue recommencer'));
    }
  }

  Stream<UserState> mapEventToState(UserEvent event) async* {}

  Future<bool> connected() async {
    var isConnected = await database.getUser() != null;

    print('-----isConnected-----***----------${isConnected}');
    return isConnected;
  }

  var fn = new ViewFunctions();

  Future<void> onLogin(
    SignInEvent event,
  ) async {
    var data = {
      'phone': event.phone,
      'password': event.password,
    };
    print(data);
    try {
      fn.loading('connection', 'encours');
      Response response = await userRepo.Login(data);

      if (response.statusCode == 200) {
        database.saveKeyKen(response.data);
        // await getUser();
        // await getUserDB();
        // refresh();
        // //
        // // await getUser();
        // await initAllApp();
        // _isConnected = true;
        // // Get.back(closeOverlays: true);
        // update(); // await MyBinding().onGetAll();
        fn.closeLoader();
      } else {
        // fn.closeLoader();
        fn.closeLoader();

        fn.snackBar('Connexion', 'Identifiants incorrects', false);
      }

      // fn.snackBar('Mise a jour', response.body['message'], true);
      // _isConnected = true;
      // // Get.back(closeOverlays: true);
      // update();
    } catch (e) {}
  }

  // @override
  // void onError(Object error, StackTrace stacktrace) {
  //   _addErr(error);
  //   super.onError(error, stacktrace);
  // }

  @override
  Future<void> close() async {
    await super.close();
  }

  // void _addErr(e) {
  //   if (e is StateError) return;
  //   try {
  //     add(ErrorEvent((e is String)
  //         ? e
  //         : (e.message ?? "Something went wrong. Please try again!")));
  //   } catch (e) {
  //     add(ErrorEvent("Something went wrong. Please try again!"));
  //   }
  // }
}
