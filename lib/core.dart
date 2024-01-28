import 'package:BananaExpress/application/connected/connected_bloc.dart';
import 'package:BananaExpress/application/database/database_cubit.dart';
import 'package:BananaExpress/application/export_bloc.dart';

import 'package:BananaExpress/application/livraison/repositories/livraisonRepo.dart';
import 'package:BananaExpress/application/splash/splash_bloc.dart';
import 'package:BananaExpress/application/user/repositories/user_repository.dart';
import 'package:BananaExpress/infrastructure/_commons/network/app_requests.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:connectivity/connectivity.dart';

import 'utils/Services/ApiClientNew.dart';

import 'package:BananaExpress/infrastructure/_commons/exceptions.dart';
import 'package:BananaExpress/infrastructure/_commons/network/network_info.dart';

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
  sl..registerFactory(() => ApiClient());
  sl
    ..registerFactory(() => UserBloc(userRepo: sl(), database: sl()))
    ..registerLazySingleton(() => UserRepo(apiClient: sl()));

  sl..registerFactory(() => HomeBloc(database: sl()));
  sl
    ..registerFactory(() => LivraisonBloc(livraisonRepo: sl()))
    ..registerLazySingleton(() => LivraisonRepo(apiClient: sl()));
  initConnected();
}

void initConnected() async {
  sl.registerFactory(() => ConnectedBloc());
}

Future<void> initLoad(context) async {
    BlocProvider.of<HomeBloc>(context) .add(UserDataEvent());
    BlocProvider.of<UserBloc>(context) .add(GetUserEvent());
  BlocProvider.of<LivraisonBloc>(context)
    ..add(StartLogLat())
    ..add(GetVilleAndCategoryEvent());
}



// import 'package:BananaExpress/application/database/database_cubit.dart';
// import 'package:BananaExpress/application/export_bloc.dart';

// import 'package:BananaExpress/application/livraison/repositories/livraisonRepo.dart';
// import 'package:BananaExpress/application/splash/splash_bloc.dart';
// import 'package:BananaExpress/application/user/repositories/user_repository.dart';
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
