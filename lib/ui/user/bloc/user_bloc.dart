import 'dart:async';

import 'package:BananaExpress/ui/databasecubit/cubit/databasecubit_cubit.dart';
import 'package:BananaExpress/ui/general_action/cubit/app_action_state.dart';
import 'package:BananaExpress/ui/user/repositories/user_repository.dart';
import 'package:BananaExpress/utils/functions/viewFunctions.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../controller/entity.dart';
import '../../../utils/datebase.dart';
import '../models/UserModel.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepo userRepo;
  final DatabaseCubit database;
  UserBloc({required this.userRepo, required this.database})
      : super(InitialDataState()) {
    on<GetDataBateEvent>((event, emit) async {
      print('okkof');
      // final database = await DataBaseController.getInstance();
      // emit(GetDataBateState(database: database));
    });
    on<SignInEvent>((event, emit) async {
      print('okkof');
      var data = {
        'phone': event.phone,
        'password': event.password,
      };
      print(data);
      emit(InitialDataState(isLoading: 1));
      emit(LoginIngUser());

      try {
        var response = await userRepo.Login(data);

        if (response.statusCode == 200) {
          database.saveKeyKen(response.data);

          await userRepo.getUser().then((value) async {
            print('------------------value----------${value.data}-');
            if (value.data['data'] != null &&
                value.data['data'] != [] &&
                value.data['data'].length != 0) {
              emit(InitialDataState(
                isLoading: 2,
              ));
              emit(Authenticated());

              var _UserSave = User.fromJson(value.data['data']);

              await database.saveUser(_UserSave);
            }
          }).catchError((error) {
            emit(InitialDataState(isLoading: 3));
            emit(LoginIngFailed(
              message: 'Identifiants incorrects',
            ));

            fn.closeLoader();
          });

          // await getUser();
          // await getUserDB();
          // refresh();
          // //
          // // await getUser();
          // await initAllApp();
          // _isConnected = true;
          // // Get.back(closeOverlays: true);
          // update(); // await MyBinding().onGetAll();
          // fn.closeLoader();
        } else {
          emit(InitialDataState(isLoading: 3));
          emit(LoginIngFailed(
            message: 'Identifiants incorrects',
          ));

          fn.closeLoader();

          fn.snackBar('Connexion', 'Identifiants incorrects', false);
        }

        // fn.snackBar('Mise a jour', response.body['message'], true);
        // _isConnected = true;
        // // Get.back(closeOverlays: true);
        // update();
      } catch (e) {
        emit(InitialDataState(isLoading: 3));
        emit(LoginIngFailed(
          message: 'Identifiants incorrects',
        ));
      }
    });
    on<RegisterEvent>((event, emit) async {
      print('okkof');
      var data = {
        'phone': int.parse(event.phone),
        'password': event.password,
        'nom': event.name,
        'prenom': event.name,
      };
      print(data);
      emit(InitialDataState(isLoading: 1));
      emit(LoginIngUser());

      try {
        Response response = await userRepo.SignUp(data);

        if (response.statusCode == 200) {
          database.saveKeyKen(response.data);
          emit(InitialDataState(
            isLoading: 2,
          ));
          emit(Authenticated());

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
          emit(InitialDataState(isLoading: 3));
          // emit(LoginIngFailed(
          //   message: 'Identifiants incorrects',
          // ));

          // fn.closeLoader();
          fn.closeLoader();

          fn.snackBar('Connexion', 'Identifiants incorrects', false);
        }

        // fn.snackBar('Mise a jour', response.body['message'], true);
        // _isConnected = true;
        // // Get.back(closeOverlays: true);
        // update();
      } catch (e) {
        emit(InitialDataState(isLoading: 3));
        emit(LoginIngFailed(
          message: 'Identifiants incorrects',
        ));
      }
    });
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

  @override
  void onError(Object error, StackTrace stacktrace) {
    _addErr(error);
    super.onError(error, stacktrace);
  }

  @override
  Future<void> close() async {
    await super.close();
  }

  void _addErr(e) {
    if (e is StateError) return;
    try {
      add(ErrorEvent((e is String)
          ? e
          : (e.message ?? "Something went wrong. Please try again!")));
    } catch (e) {
      add(ErrorEvent("Something went wrong. Please try again!"));
    }
  }
}
