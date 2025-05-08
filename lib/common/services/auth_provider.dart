import 'package:BabanaExpress/common/bloc/user_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthProvider extends ChangeNotifier {
  final UserCubit userCubit;

  AuthProvider(this.userCubit) {
    // Écoutez les changements d'état dans le UserCubit
    userCubit.stream.listen((state) {
      notifyListeners(); // Notifiez les écouteurs de l'AuthProvider
    });
  }

  UserState get currentState => userCubit.state;
}
