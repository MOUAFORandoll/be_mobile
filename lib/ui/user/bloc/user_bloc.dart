import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../utils/datebase.dart';
import '../models/UserModel.dart';
import 'user_event.dart';
import 'user_state.dart';  

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(InitialDataState()) {
    on<GetDataBateEvent>((event, emit) async {
      print('okkof');
      final database = await DataBaseController.getInstance();
      emit(GetDataBateState(database: database));
    });
  }

  updateDatabase() async {}

  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is SignInEvent) {
      print(event);
      yield AuthenticatedState(isConnected: true);
    } else if (event is SignOutEvent) {
      // Logique pour la déconnexion
      yield UnauthenticatedState();
    } else if (event is CheckUserIsConnectedEvent) {
      try {
        var isConnected =
            await (state as GetDataBateState).database.getUser() != null;
        yield AuthenticatedState(isConnected: isConnected);
      } catch (error) {
        // yield AuthErrorState(error: error.toString());
      }
    } else if (event is GetUserDBEvent) {
      try {
        var data = await (state as GetDataBateState).database.getUser();

        if (data != null) {
          var _User = UserModel.fromJson(data.toMap());
        }
        // yield AuthUserLoadedState(user: _User);
      } catch (error) {
        // yield AuthErrorState(error: error.toString());
      }
    }
  }

  Future<bool> connected() async {
    var isConnected = await (state as GetDataBateState).database != null
        ? (state as GetDataBateState).database.getUser() != null
        : false;

    print('-----isConnected-----***----------${isConnected}');
    return isConnected;
  }
  
  Future<void> onLogin(
    SignInEvent event,
  ) async {
    print(event.phone);
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
