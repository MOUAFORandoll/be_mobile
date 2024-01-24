import 'dart:async';

import 'package:BananaExpress/application/export_bloc.dart';
import 'package:bloc/bloc.dart'; 
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DatabaseCubit database;
  HomeBloc({required this.database}) : super(HomeState()) {
    on<UserDataEvent>((event, emit) async {
      emit(LoadState());
      print('---------UserD-------------------------*ataEvent');
      var user = await database.getUser();
      print('---------UserD-------------------------*${user!.phone}');
      
      emit(HomeState(user: user));
      
      print('---------UserD-------------------------*ataEvent');
    });
    on<SetIndexEvent>((event, emit) async {
      print('-----------------SetIndexEvent');
      emit(state.copyWith(index: event.index));
    });
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

class ServiceBloc extends Bloc<HomeEvent, ServiceState> {
  final DatabaseCubit database;
  ServiceBloc({required this.database}) : super(ServiceState()) {
   
  }
}
