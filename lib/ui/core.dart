import 'package:BananaExpress/ui/databasecubit/cubit/databasecubit_cubit.dart';
import 'package:BananaExpress/ui/home/bloc/home_bloc.dart';
import 'package:BananaExpress/ui/user/bloc/user_bloc.dart';
import 'package:BananaExpress/ui/user/repositories/user_repository.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initApp() async {
  sl
    ..registerFactory(() => UserBloc(userRepo: sl(), database: sl()))
    ..registerLazySingleton(() => UserRepo())
    ..registerLazySingleton(() => DatabaseCubit());
  sl..registerFactory(() => HomeBloc(database: sl()));
}
