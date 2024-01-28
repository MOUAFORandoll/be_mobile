import 'package:BananaExpress/application/livraison/repositories/livraisonRepo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
      if (state.selectedVIlle == null) {
        emit(state.copyWith(errorVille: true));
      } else {
        emit(state.copyWith(errorVille: false));
      }
      if (state.selected_recuperation_point == null) {
        emit(state.copyWith(errorPointRecuperation: true));
      } else {
        emit(state.copyWith(errorPointRecuperation: false));
      }
  if (state.formKeyLivraison!.currentState!.validate()) {
        print('VerifyFormEvent');
      
        if (state.selectedVIlle != null &&
            state.selected_recuperation_point != null &&
            state.contactEmetteur!.text.length != 0 &&
            state.libelle!.text.length != 0) {
          emit(state.copyWith(
              index: 1, errorVille: false, errorPointRecuperation: false));
        }
      }
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
    on<SelectedPointLocalisation>(_selectPointRecuperation);
    on<MapValidatePoint>(_mapValidatePoint);
    on<MapSelected>(_mapSelected);
    on<StartLogLat>(_setStartLongLat);
    on<SearchPointEvent>(_searchPointRecuperationPointLivraison);
  }

  Future<void> _selectPointRecuperation(
      SelectedPointLocalisation event, Emitter<LivraisonState> emit) async {
    emit(state.copyWith(
      selected_recuperation_point: event.point_recup,
    ));
  }

  Future<void> _mapValidatePoint(
      MapValidatePoint event, Emitter<LivraisonState> emit) async {
    PointLivraisonModel _point = new PointLivraisonModel(
        id: 0,
        libelle: event.libelle,
        quartier: event.quartier,
        ville: state.selectedVIlle!.libelle,
        longitude: state.position!.longitude,
        latitude: state.position!.latitude);

    emit(state.copyWith(
      selected_recuperation_point: _point,
      errorVille: false,
      errorPointRecuperation: false,
      isMapSelectedPointRecuperation: true,
    ));
  }

  Future<void> _mapSelected(
      MapSelected event, Emitter<LivraisonState> emit) async {
    emit(state.copyWith(
      errorPointRecuperation: false,
      isMapSelectedPointRecuperation: event.status,
    ));
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
