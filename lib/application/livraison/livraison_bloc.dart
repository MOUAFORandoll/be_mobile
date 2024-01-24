import 'package:BananaExpress/application/livraison/repositories/livraisonRepo.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../old/model/data/VilleModel.dart';

import '../../../old/model/exportmodel.dart';
import 'livraison_event.dart';
import 'livraison_state.dart';

class LivraisonBloc extends Bloc<LivraisonEvent, LivraisonState> {
  final LivraisonRepo livraisonRepo;
  LivraisonBloc({required this.livraisonRepo})
      : super(LivraisonState(
            isVille: true, isPointRecuperation: true, index: 0)) {
    on<BackIndexEvent>((event, emit) async {
      print('BackIndexEvent');
      emit(state.copyWith(index: 0));
    });
    on<VerifyFormEvent>((event, emit) async {
      print('VerifyFormEvent');
      // if (state.isVille && state.isPointRecuperation) {
      emit(state.copyWith(index: 1));
      // }
    });
    on<GetVilleEvent>(_getVille);
    on<GetRecupPointEvent>(_getpointLocalisation);
    on<SelectedVille>((event, emit) async {
      emit(state.copyWith(selectedVIlle: event.ville));
      // }
    });
  }

  Future<void> _getVille(
      GetVilleEvent event, Emitter<LivraisonState> emit) async {
    try {
      print('debut get ville event');
      Response response = await livraisonRepo.getVille();
      if (response.data != null) {
        if (response.data['data'].length != 0) {
          emit(state.copyWith(
              villeList: (response.data['data'] as List)
                  .map((e) => VilleModel.fromJson(e))
                  .toList()));
        } else {}
      }
    } catch (e) {}
  }

  Future<void> _getpointLocalisation(
      GetRecupPointEvent event, Emitter<LivraisonState> emit) async {
    try {
      print('debut get getLivraisonPointByVille event');
      Response response =
          await livraisonRepo.getLivraisonPointByVille(event.ville);
      if (response.data != null) {
        if (response.data['data'].length != 0) {
          emit(state.copyWith(
              list_recuperation_point: (response.data['data'] as List)
                  .map((e) => PointLivraisonModel.fromJson(e))
                  .toList()));
        } else {}
      }
    } catch (e) {}
  }
}
