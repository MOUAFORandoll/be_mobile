import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'GeneralAction_event.dart';
import 'GeneralAction_state.dart';

class GeneralActionCubit extends Cubit<GeneralActionState> {
  GeneralActionCubit(BuildContext context)
      : super(GeneralActionState.initialState);

  @override
  Stream<GeneralActionState> mapEventToState(GeneralActionEvent event) async* {}

  Future<void> setIndex(
    WrapperEvent event,
  ) async {
    print(event);
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
