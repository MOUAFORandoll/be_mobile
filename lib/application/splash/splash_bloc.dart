import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';

import 'package:get_storage/get_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:BabanaExpress/application/database/database_cubit.dart';

import '../../core.dart';

part 'splash_event.dart';
part 'splash_state.dart';
part 'splash_bloc.freezed.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final DatabaseCubit database;

  SplashBloc({required this.database}) : super(const SplashState.loading()) {
    on<SplashEvent>((event, emit) {
      // GetStorage box = sl.get<GetStorage>();
      // box.write('first', 0);
    });
    on<StartLoading>((event, emit) async {
      GetStorage box = sl.get<GetStorage>();
      var isConnected = await database.getUser() != null;
      var key = await database.getKey();
      print(
          '-======database.user!.phone========-------${database.user!.phone}');
      await Future.delayed(Duration(seconds: 5), () {
        PageRouteInfo<dynamic> route;
        print(
            '-======database.user!.phone========-------${database.user!.phone == 'null' || database.user!.phone!.isEmpty}');

        route = /*  (box.read('first') != 1)
            ? AuthRoute()
            : */
            isConnected
                ? database.user!.phone == 'null' ||
                        database.user!.phone == null ||
                        database.user!.phone!.isEmpty
                    ? CompleteProfilRoute()
                    : const HomeRoute()
                : const AuthRoute();
        if (key != null) {
          // SocketService().HistoriqueUserLivraison(
          //     recepteur: key,
          //     action: (data) {
          //       print('------------------ev ');
          //       print('------------------ev ${data}');
          //       print('------------------ev ');
          //       NotificationService().livraisonNotification(
          //           content: data, context: event.context);
          //       // BlocProvider.of<LivraisonBloc>(event.context)
          //       //     .add(HistoriqueUserLivraison());
          //     });
          // SocketService().livraisonValidate(
          //     recepteur: key,
          //     action: (data) {
          //       NotificationService().livraisonValidateNotification(
          //           content: data, context: event.context);
          //     });
          // SocketService().livraisonFinish(
          //     recepteur: key,
          //     action: (data) {
          //       NotificationService().livraisonFinishNotification(
          //           content: data, context: event.context);
          //     });
          // SocketService().transactionCredit(
          // recepteur: key,
          // action: (data) {
          //   // event.context.watch<CompteBloc>().add(HistoriqueTransaction());
          //   NotificationService().depotFinishNotification(
          //       content: data, context: event.context);
          // });
        }
        emit(SplashState.loaded(isConnected, route));
      });
    });
  }
}
