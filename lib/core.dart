import 'package:BananaExpress/application/database/database_cubit.dart';
import 'package:BananaExpress/application/export_bloc.dart';
  
import 'package:BananaExpress/application/livraison/repositories/livraisonRepo.dart';
import 'package:BananaExpress/application/splash/splash_bloc.dart'; 
import 'package:BananaExpress/application/user/repositories/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
 
import 'utils/Services/ApiClientNew.dart'; 

final sl = GetIt.instance;

Future<void> init() async {

  final db = await new DatabaseCubit();
   GetStorage box = GetStorage();
  sl.registerLazySingleton<GetStorage>(() => box);
  sl.registerLazySingleton<DatabaseCubit>(() => db);
  sl..registerFactory(() => SplashBloc(database: sl())) ; 
   sl
    ..registerFactory(() => UserBloc(userRepo: sl(), database: sl()))
    ..registerLazySingleton(() => UserRepo(apiClient: sl()))
   
    ..registerLazySingleton(() => ApiClient());
  
  
  
  sl..registerFactory(() => HomeBloc(database: sl()));
  sl..registerFactory(() => LivraisonBloc(livraisonRepo: sl()))
    ..registerLazySingleton(() => LivraisonRepo(apiClient: sl()));
}
