import 'dart:async';

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_action_state.dart';
part 'app_action_cubit.freezed.dart';

class AppActionCubit extends Cubit<AppActionState> {
  final Connectivity _connectivity = Connectivity();
  AppActionCubit() : super(AppActionState.initial()) {
    late StreamSubscription<ConnectivityResult> _connectivitySubscription;

    emit(state.copyWith(index: 0));
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        emit(state.copyWith(isInternetConnection: false));
      } else {
        emit(state.copyWith(isInternetConnection: true));
      }
    });
  }

  Future<void> setIndex(int index) async {
    emit(state.copyWith(index: index));
    print(index);
  }

  void changeLanguage(Locale locale) {
    // languageCubit.setLanguage(locale);
    // emit(YourLanguageChangedState());
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
