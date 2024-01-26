import 'package:BananaExpress/application/livraison/repositories/livraisonRepo.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../old/model/data/VilleModel.dart';

import '../../../old/model/exportmodel.dart';
part 'livraison_event.dart';
part 'livraison_state.dart';
part 'livraison_bloc.freezed.dart';

class LivraisonBloc extends Bloc<LivraisonEvent, LivraisonState> {
  final LivraisonRepo livraisonRepo;
  LivraisonBloc({required this.livraisonRepo})
      : super(LivraisonState.initial()) {
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
      emit(state.copyWith(
        selectedVIlle: event.ville,
      ));
      // }
    });
    on<SetLogLat>(_setLongLat);
    on<StartLogLat>(_setStartLongLat);
    on<SearchPointEvent>(_searchPointRecuperationPointLivraison);
  }

  void _searchPointRecuperationPointLivraison(
      SearchPointEvent event, Emitter<LivraisonState> emit) {
    String searchPointRecuperationText = event.text.toLowerCase();
    print('----texte---${searchPointRecuperationText}');

    emit(
      state.copyWith(list_search_recuperation_point: []),
    );
    if (searchPointRecuperationText.isEmpty) {
      emit(state.copyWith(
        list_search_recuperation_point: state.list_recuperation_point,
      ));
    } else {
      var point = state.list_recuperation_point!
          .where(
            (element) =>
                element.libelle
                    .toLowerCase()
                    .contains(searchPointRecuperationText) ||
                element.quartier
                    .toLowerCase()
                    .contains(searchPointRecuperationText) ||
                element.ville
                    .toLowerCase()
                    .contains(searchPointRecuperationText),
          )
          .toList();
      emit(
        state.copyWith(list_search_recuperation_point: point),
      );
      print('----texte---${state.list_search_recuperation_point!.length}');
    }
  }

  Future<void> _setLongLat(
      SetLogLat event, Emitter<LivraisonState> emit) async {
    emit(state.copyWith(
      position: event.latLng,
      quartier_recuperation_point: event.quartier_recuperation_point,
    ));
  }

  Future<void> _setStartLongLat(
      StartLogLat event, Emitter<LivraisonState> emit) async {
    var position;

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {}

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.always ||
          permission == LocationPermission.unableToDetermine ||
          permission == LocationPermission.whileInUse) {
        position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
      }
    }
    position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    position = await Geolocator.getCurrentPosition();

    emit(state.copyWith(
        position: LatLng(position.latitude, position.longitude)));
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
          print('-----------state.villeList.length');
          print(state.villeList!.length);
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
