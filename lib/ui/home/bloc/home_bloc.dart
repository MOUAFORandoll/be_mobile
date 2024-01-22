import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../model/exportmodel.dart';
import '../../databasecubit/cubit/databasecubit_cubit.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DatabaseCubit database;
  HomeBloc({required this.database}) : super(InitialDataState()) {
    on<UserDataEvent>((event, emit) async {
      print('---------UserD-------------------------*ataEvent');
      var user = await database.getUser();
      print('---------UserD-------------------------*${user!.phone}');

      emit(InitialDataState(user: user));
      
      print('---------UserD-------------------------*ataEvent');
    });
    on<SetIndexEvent>((event, emit) async {
      print('-----------------SetIndexEvent');
      emit(InitialDataState(index: event.index));
    });
  }

  @override
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
