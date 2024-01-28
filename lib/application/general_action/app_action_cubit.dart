import 'dart:async';

import 'package:bloc/bloc.dart'; 
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_action_state.dart';
part 'app_action_cubit.freezed.dart';

class AppActionCubit extends Cubit<AppActionState> {
  AppActionCubit() : super(AppActionState.initial()) {
    emit(state.copyWith(index: 0));
  }

  Future<void> setIndex(int index) async {
    emit(state.copyWith(index: index));
    print(index);
  }

  void toLogin() {
    emit(state.copyWith(isLogin: true));
  }

  void toRegister() {
    print('..:');
    emit(state.copyWith(isLogin: false));

    print('..:');
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
