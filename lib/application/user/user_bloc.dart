import 'dart:async';
import 'package:BananaExpress/application/database/database_cubit.dart';

import 'package:BananaExpress/application/user/repositories/user_repository.dart';
import 'package:BananaExpress/utils/functions/viewFunctions.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../old/controller/entity.dart';
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
    on<RegisterEvent>(_Register);
  }

  _Login(SignInEvent event, Emitter<UserState> emit) async {
    var data = {
      'phone': event.phone,
      'password': event.password,
    };
    print(data);
    emit(state.copyWith(isLoading: 1));
    emit(UserState.loginIngUser());

    try {
      var response = await userRepo.Login(data);

      if (response.statusCode == 200) {
        database.saveKeyKen(response.data);

        await userRepo.getUser().then((value) async {
          print('------------------value----------${value.data}-');
          if (value.data['data'] != null &&
              value.data['data'] != [] &&
              value.data['data'].length != 0) {
            emit(state.copyWith(
              isLoading: 2,
            ));
            emit(UserState.authenticated());

            var _UserSave = User.fromJson(value.data['data']);

            await database.saveUser(_UserSave);
          }
        }).catchError((error) {
          emit(state.copyWith(isLoading: 3));
          emit(UserState.loginIngFailed(
            message: 'Identifiants incorrects',
          ));

          fn.closeLoader();
        });
      } else {
        emit(state.copyWith(isLoading: 3));
        emit(UserState.loginIngFailed(
          message: 'Identifiants incorrects',
        ));

        fn.closeLoader();

        fn.snackBar('Connexion', 'Identifiants incorrects', false);
      }
    } catch (e) {
      emit(state.copyWith(isLoading: 3));
      emit(UserState.loginIngFailed(
        message: 'Identifiants incorrects',
      ));
    }
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
                  isLoading: 2,
                ));
                emit(UserState.authenticated());

                var _UserSave = User.fromJson(value.data['data']);

                await database.saveUser(_UserSave);
              }
            }).catchError((error) {
              emit(state.copyWith(isLoading: 3));
              emit(UserState.loginIngFailed(
                message: 'Identifiants incorrects',
              ));

              fn.closeLoader();
            });
          } else {
            emit(state.copyWith(isLoading: 3));
            emit(UserState.loginIngFailed(
              message: 'Identifiants incorrects',
            ));

            fn.closeLoader();

            fn.snackBar('Connexion', 'Identifiants incorrects', false);
          }
        } catch (e) {
          emit(state.copyWith(isLoading: 3));
          emit(UserState.loginIngFailed(
            message: 'Identifiants incorrects',
          ));
        }
      } else {
        emit(state.copyWith(isLoading: 3));

        fn.closeLoader();

        fn.snackBar('Connexion', 'Identifiants incorrects', false);
      }
    } catch (e) {
      emit(state.copyWith(isLoading: 3));
      emit(UserState.loginIngFailed(
        message: 'Identifiants incorrects',
      ));
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

  Future<void> onRegister(
    SignInEvent event,
  ) async {
    print(event.phone);
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
