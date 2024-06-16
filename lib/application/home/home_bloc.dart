import 'package:BabanaExpress/application/database/database_cubit.dart';
import 'package:BabanaExpress/application/home/repositories/homeRepo.dart';
import 'package:BabanaExpress/entity.dart';

import 'package:BabanaExpress/application/model/exportmodel.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'dart:developer';
part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepo homeRepo;
  final DatabaseCubit database;

  HomeBloc({required this.homeRepo, required this.database})
      : super(HomeState.initial()) {
    on<UserDataEvent>((event, emit) async {
      emit(state.copyWith(index: 0));

      print('---------UserD-------------------------');
      var user = await database.getUser();

      emit(state.copyWith(user: user));

      print(
          '---------UserD-------------------------*ataEvent***${state.user!.solde}');
      print(
          '---------UserD-------------------------*ataEvent***${state.user!.profile}');
    });

    on<SetIndexEvent>((event, emit) async {
      print('-----------------SetIndexEvent');
      emit(state.copyWith(index: event.index));
    });
    on<SetIndexHistoryEvent>((event, emit) async {
      print('-----------------SetindexHistory');
      emit(state.copyWith(indexHistory: event.index));
    });

    on<HomeStateLivraison>(homeStateLivraison);
    on<FindLivraisonById>(findLivraisonById);
  }
  Future<void> homeStateLivraison(
      HomeStateLivraison event, Emitter<HomeState> emit) async {
    var key = await database.getKey();
    emit(state.copyWith(
      isLoadedHomeStateLivraison: 0,
    ));
    await homeRepo.getHomeLivraisonsState(key).then((response) {
      if (response.data != null) {
        emit(state.copyWith(
            isLoadedHomeStateLivraison: 1,
            userHomeLivraisonList: (response.data['data'] as List)
                .map((e) => LivraisonUserHomeModel.fromJson(e))
                .toList()));
      } else {
        emit(state.copyWith(
          isLoadedHomeStateLivraison: 2,
        ));
      }
    }).onError((e, s) {
      emit(state.copyWith(
        isLoadedHomeStateLivraison: 2,
      ));
    });
  }

  Future<void> findLivraisonById(
      FindLivraisonById event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
      isLoadedLivraison: 0,
    ));
    emit(state.copyWith(livraison: null));

    await homeRepo.findLivraisonById(event.idLivraison).then((response) {
      if (response.data != null) {
        log(event.idLivraison.toString());
        log(response.data['data'].toString());
        emit(state.copyWith(
            isLoadedLivraison: 1,
            service_id: response.data['data']['service_id'],
            livraison: response.data['data']['service_id'] == 3
                ? LivraisonMedicamentModel.fromJson(response.data['data'])
                : response.data['data']['service_id'] == 4
                    ? LivraisonMarketModel.fromJson(response.data['data'])
                    : LivraisonModel.fromJson(response.data['data'])));
      } else {
        emit(state.copyWith(isLoadedLivraison: 2, livraison: null));
        emit(state.copyWith(isLoadedLivraison: null));
      }
    }).onError((e, s) {
      emit(state.copyWith(isLoadedLivraison: 2, livraison: null));
      emit(state.copyWith(isLoadedLivraison: null));
    });
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
