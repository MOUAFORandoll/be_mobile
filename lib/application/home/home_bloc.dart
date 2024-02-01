import 'dart:async';

import 'package:BananaExpress/application/database/database_cubit.dart';
import 'package:BananaExpress/entity.dart';

import 'package:BananaExpress/application/model/exportmodel.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
 

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DatabaseCubit database;
  HomeBloc({required this.database}) : super(HomeState.initial()) {
    on<UserDataEvent>((event, emit) async {
      emit(state.copyWith(index: 0));

      print('---------UserD-------------------------');
      var user = await database.getUser();
      print(
          '---------UserD-----*${user!.id}--------------------*${user.phone}');

      emit(state.copyWith(user: user));

      print(
          '---------UserD-------------------------*ataEvent***${state.user!.nom}');
    });
    on<SetIndexEvent>((event, emit) async {
      print('-----------------SetIndexEvent');
      emit(state.copyWith(index: event.index));
    });
  
  }
  @override
  void onError(Object error, StackTrace stacktrace) {
    super.onError(error, stacktrace);
  }

  @override
  Future<void> close() async {
    await super.close();
  }
}
