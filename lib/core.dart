import 'package:BananaExpress/application/export_bloc.dart';
  
import 'package:BananaExpress/application/livraison/repositories/livraisonRepo.dart'; 
import 'package:BananaExpress/application/user/repositories/user_repository.dart';
import 'package:get_it/get_it.dart';
 
import 'utils/Services/ApiClientNew.dart'; 

final sl = GetIt.instance;

Future<void> init() async {
  sl
    ..registerFactory(() => UserBloc(userRepo: sl(), database: sl()))
    ..registerLazySingleton(() => UserRepo(apiClient: sl()))
    ..registerLazySingleton(() => DatabaseCubit())
    ..registerLazySingleton(() => ApiClient());


  sl..registerFactory(() => HomeBloc(database: sl()));
  sl..registerFactory(() => LivraisonBloc(livraisonRepo: sl()))
    ..registerLazySingleton(() => LivraisonRepo(apiClient: sl()));
}
