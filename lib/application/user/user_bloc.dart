import 'dart:async';
import 'package:BananaExpress/application/database/database_cubit.dart';

import 'package:BananaExpress/application/user/repositories/user_repository.dart';
import 'package:BananaExpress/routes/app_router.gr.dart';

import 'package:BananaExpress/utils/functions/app_loader.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:BananaExpress/presentation/components/exportcomponent.dart';

import '/entity.dart';
import '../export_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
    on<GetVilleQuartier>(_getVilleQuartier);
  }

  Future<void> _getVilleQuartier(
      GetVilleQuartier event, Emitter<UserState> emit) async {
    emit(state.copyWith(isVilleQuartier: 0));
    var position;

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {}

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.always ||
          permission == LocationPermission.unableToDetermine ||
          permission == LocationPermission.whileInUse) {
        position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
      }
    }
    position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    position = await Geolocator.getCurrentPosition();
    await userRepo
        .getVilleQuartier(position.longitude, position.latitude)
        .then((response) {
      print(response.data);
      if (response.data != null) {
        emit(state.copyWith(
            quartierUser: response.data['quartier'],
            villeUser: response.data['ville'],
            isVilleQuartier: 1));
      } else {
        emit(state.copyWith(isVilleQuartier: 2));
      }
    }).onError((e, s) {
      emit(state.copyWith(isVilleQuartier: 2));
    });
  }

  _OnSignOut(SignOutEvent event, Emitter<UserState> emit) async {
    var loader = AppLoader.bounceLargeColorLoaderController();
    loader.open(event.context);
    await Future.delayed(Duration(seconds: 5), () {
      database.disconnect();
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
      if (response.statusCode == 201) {
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
            authenticationFailedMessage: response.data['message']));
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
        database.saveKeyKen(response.data);

        await userRepo.getUser().then((value) async {
          print('------------------value----------${value.data}-');
          if (value.data['data'] != null &&
              value.data['data'] != [] &&
              value.data['data'].length != 0) {
            emit(state.copyWith(isLoading: 2, authenticationFailedMessage: ''));
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
            authenticationFailedMessage: response.data['message']));
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

  @override
  Future<void> close() async {
    await super.close();
  }
}
