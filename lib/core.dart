import 'package:BabanaExpress/application/callcenter/repositories/callcenterRepo.dart';
import 'package:BabanaExpress/application/compte/repositories/compteRepo.dart';
import 'package:BabanaExpress/application/connected/connected_bloc.dart';
import 'package:BabanaExpress/application/database/database_cubit.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/application/home/repositories/homeRepo.dart';

import 'package:BabanaExpress/application/livraison/repositories/livraisonRepo.dart';
import 'package:BabanaExpress/application/market/repositories/marketRepo.dart';
import 'package:BabanaExpress/application/model/data/MessageModel.dart';
import 'package:BabanaExpress/application/pharmacy/repositories/pharmacy_repository.dart';
import 'package:BabanaExpress/application/splash/splash_bloc.dart';
import 'package:BabanaExpress/application/user/repositories/user_repository.dart';
import 'package:BabanaExpress/infrastructure/_commons/network/app_requests.dart';
import 'package:BabanaExpress/presentation/callcenter/CallCenterPage.dart';
import 'package:BabanaExpress/routes/app_router.dart';
import 'package:BabanaExpress/utils/Services/NotificationService.dart';
import 'package:BabanaExpress/utils/Services/SocketService.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:connectivity/connectivity.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:BabanaExpress/infrastructure/_commons/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final db = await new DatabaseCubit();
  GetStorage box = GetStorage();
  sl.registerFactory(() => Connectivity());
  sl.registerLazySingleton<IAppRequests>(() => AppRequests());
  sl.registerLazySingleton<INetworkInfo>(() => NetworkInfo(connectivity: sl()));
  sl.registerLazySingleton<GetStorage>(() => box);
  sl.registerLazySingleton<DatabaseCubit>(() => db);
  sl.registerFactory(() => SplashBloc(database: sl()));

  sl
    ..registerFactory(() => UserBloc(userRepo: sl(), database: sl()))
    ..registerLazySingleton(() => UserRepo(apiClient: sl()));

  sl
    ..registerFactory(() => HomeBloc(homeRepo: sl(), database: sl()))
    ..registerLazySingleton(() => HomeRepo(apiClient: sl()));
  sl
    ..registerFactory(() => LivraisonBloc(livraisonRepo: sl(), database: sl()))
    ..registerLazySingleton(() => LivraisonRepo(apiClient: sl()));
  sl
    ..registerFactory(() => CompteBloc(compteRepo: sl(), database: sl()))
    ..registerLazySingleton(() => CompteRepo(apiClient: sl()));

  sl
    ..registerFactory(() => PharmacyBloc(pharmacyRepo: sl()))
    ..registerLazySingleton(() => PharmacyRepo(apiClient: sl()));
  sl
    ..registerFactory(() => MarketBloc(marketRepo: sl(), database: sl()))
    ..registerLazySingleton(() => MarketRepo(apiClient: sl()));
  sl
    ..registerFactory(
        () => CallCenterBloc(callcenterRepo: sl(), database: sl()))
    ..registerLazySingleton(() => CallCenterRepo(apiClient: sl()));
  requestPermission();

  sl.registerSingleton<AppRouter>(AppRouter());
  initConnected();
  // sl
  //   ..registerFactory(() => SocketService(
  //         livraison_bloc: sl(),
  //       ));
}

void initConnected() async {
  sl.registerFactory(() => ConnectedBloc());
}

Future<void> initLoad(context) async {
  BlocProvider.of<HomeBloc>(context)
    ..add(UserDataEvent())
    ..add(HomeStateLivraison());
  BlocProvider.of<UserBloc>(context)
    ..add(GetUserEvent())
    ..add(GetModePaiement())
    ..add(GetVilleQuartier());
  BlocProvider.of<LivraisonBloc>(context)
    ..add(StartLogLat())
    ..add(GetVilleAndCategoryEvent())
    ..add(HistoriqueUserLivraison());
  BlocProvider.of<PharmacyBloc>(context).add(HistoriqueLivraisonMedicament());
  BlocProvider.of<CompteBloc>(context).add(HistoriqueTransaction());
  BlocProvider.of<MarketBloc>(context)
    ..add(MarketEvent.getProduits(false))
    ..add(MarketEvent.getLivraisonProduit());
  BlocProvider.of<CallCenterBloc>(context).add(CallCenterEvent.getMessage());
  initSetDefaultValue(context);
  initSocket(context);
}

Future<void> initSocket(context) async {
  var database = sl.get<DatabaseCubit>();
  var key = await database.getKey();
  SocketService().HistoriqueUserLivraison(
      recepteur: key!,
      action: (data) {
        print('------------------ev ');
        print('------------------ev ${data}');
        print('------------------ev ');
        NotificationService()
            .livraisonNotification(content: data, context: context);
        // BlocProvider.of<LivraisonBloc>( context)
        //     .add(HistoriqueUserLivraison());
      });
  SocketService().livraisonValidate(
      recepteur: key,
      action: (data) {
        NotificationService()
            .livraisonValidateNotification(content: data, context: context);
      });
  SocketService().livraisonMedicament(
      recepteur: key,
      action: (data) {
        NotificationService()
            .livraisonMedicamensNotification(content: data, context: context);
      });
  SocketService().livraisonProduit(
      recepteur: key,
      action: (data) {
        NotificationService()
            .livraisonProduitsNotification(content: data, context: context);
      });
  SocketService().livraisonFinish(
      recepteur: key,
      action: (data) {
        NotificationService()
            .livraisonFinishNotification(content: data, context: context);
      });
  SocketService().transactionCredit(
      recepteur: key,
      action: (data) {
        // BlocProvider.of<CompteBloc>(context).add(HistoriqueTransaction());
        NotificationService()
            .depotFinishNotification(content: data, context: context);
      });
  SocketService().callCenter(
      recepteur: key,
      action: (data) {
        // BlocProvider.of<CompteBloc>(context).add(HistoriqueTransaction());

        print(sl.get<AppRouter>().currentUrl);
        print(CallCenterPage.routeName);
        // context.get<CallCenterBloc>().add(GetMessage());

        NotificationService().callCenterNotification(
            content: MessageModel.fromJson(data), context: context);
      });
}

Future<void> initSetDefaultValue(context) async {
  BlocProvider.of<LivraisonBloc>(context).add(OnStartEvent());
  BlocProvider.of<PharmacyBloc>(context).add(OnStartEventP());
  BlocProvider.of<MarketBloc>(context).add(OnStartEventMarket());
}

Future<void> requestPermission() async {
  PermissionStatus status = await Permission.storage.request();
  print(status);

  if (status == PermissionStatus.granted) {
    print('accepte');
  } else {
    print('refuse');
  }
}

// import 'package:BabanaExpress/application/database/database_cubit.dart';
// import 'package:BabanaExpress/application/export_bloc.dart';

// import 'package:BabanaExpress/application/livraison/repositories/livraisonRepo.dart';
// import 'package:BabanaExpress/application/splash/splash_bloc.dart';
// import 'package:BabanaExpress/application/user/repositories/user_repository.dart';
// import 'package:get_it/get_it.dart';
// import 'package:get_storage/get_storage.dart';

// import 'utils/Services/ApiClientNew.dart';

// final sl = GetIt.instance;

// Future<void> init() async {
//   final db = await new DatabaseCubit();
//   GetStorage box = GetStorage();

//   sl.registerSingleton<ApiClient>(ApiClient());

//   sl.registerLazySingleton<GetStorage>(() => box);

//   sl.registerLazySingleton<DatabaseCubit>(() => db);
//   sl..registerFactory(() => SplashBloc(database: sl()));
//   sl
//     ..registerFactory(() => UserBloc(userRepo: sl(), database: sl()))
//     ..registerLazySingleton(() => UserRepo(apiClient: sl()));

//   sl..registerFactory(() => HomeBloc(database: sl()));
//   sl
//     ..registerFactory(() => LivraisonBloc(livraisonRepo: sl()))
//     ..registerLazySingleton(() => LivraisonRepo(apiClient: sl()));
// }
