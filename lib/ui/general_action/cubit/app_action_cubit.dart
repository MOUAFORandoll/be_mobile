import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'app_action_state.dart';

class AppActionCubit extends Cubit<AppActionState> {
  AppActionCubit() : super(InitialState()) {
    emit(OnboardingState());
  }
  
  setIndex(
    index,
  ) async {
    emit(OnboardingState(index: index));
    print(index);
  }
  
  toLogin() {
    emit(ToLoginState());
  }

  toRegister() {
    print('..:');
    emit(ToRegisterState());
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
