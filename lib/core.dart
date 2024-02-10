import 'package:BabanaExpress/application/connected/connected_bloc.dart';
import 'package:BabanaExpress/application/database/database_cubit.dart';
import 'package:BabanaExpress/application/export_bloc.dart';

import 'package:BabanaExpress/application/livraison/repositories/livraisonRepo.dart';
import 'package:BabanaExpress/application/pharmacy/repositories/pharmacy_repository.dart';
import 'package:BabanaExpress/application/splash/splash_bloc.dart';
import 'package:BabanaExpress/application/user/repositories/user_repository.dart';
import 'package:BabanaExpress/infrastructure/_commons/network/app_requests.dart';
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
  sl..registerFactory(() => SplashBloc(database: sl()));

  sl
    ..registerFactory(() => UserBloc(userRepo: sl(), database: sl()))
    ..registerLazySingleton(() => UserRepo(apiClient: sl()));

  sl..registerFactory(() => HomeBloc(database: sl()));
  sl
    ..registerFactory(() => LivraisonBloc(livraisonRepo: sl(), database: sl()))
    ..registerLazySingleton(() => LivraisonRepo(apiClient: sl()));

  sl
    ..registerFactory(() => PharmacyBloc(pharmacyRepo: sl()))
    ..registerLazySingleton(() => PharmacyRepo(apiClient: sl()));
  requestPermission();
  initConnected();
}

void initConnected() async {
  sl.registerFactory(() => ConnectedBloc());
}

Future<void> initLoad(context) async {
  BlocProvider.of<HomeBloc>(context).add(UserDataEvent());
  BlocProvider.of<UserBloc>(context)
    ..add(GetUserEvent())
    ..add(GetVilleQuartier());
  BlocProvider.of<LivraisonBloc>(context)
    ..add(StartLogLat())
    ..add(GetVilleAndCategoryEvent())
    ..add(HistoriqueUserLivraison());
  BlocProvider.of<PharmacyBloc>(context).add(HistoriqueLivraisonMedicament());
  initSetDefaultValue(context);
}

Future<void> initSetDefaultValue(context) async {
  BlocProvider.of<LivraisonBloc>(context).add(OnStartEvent());
  BlocProvider.of<PharmacyBloc>(context).add(OnStartEventP());
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
