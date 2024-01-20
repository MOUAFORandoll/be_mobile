import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'GeneralAction_event.dart';
import 'GeneralAction_state.dart';

class GeneralActionCubit extends Cubit<GeneralActionState> {
  GeneralActionCubit() : super(GeneralActionState());

  @override
  Stream<GeneralActionState> mapEventToState(GeneralActionEvent event) async* {}
  setIndex(
    index,
  ) async {
    emit(GeneralActionState(index: index));
    print(index);
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
