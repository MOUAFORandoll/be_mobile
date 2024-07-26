import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:BabanaExpress/application/database/database_cubit.dart';
import 'package:BabanaExpress/application/market/repositories/marketRepo.dart'; 
import 'package:BabanaExpress/application/model/data/MapPlaceInfoModel.dart';
import 'package:BabanaExpress/application/model/data/PanierModel.dart';
import 'package:BabanaExpress/application/model/exportmodel.dart';
import 'package:BabanaExpress/core.dart';

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'market_event.dart';
part 'market_state.dart';
part 'market_bloc.freezed.dart';
// https://maps.googleapis.com/maps/api/geocode/json?latlng=4.0670378,9.7830391&sensor=true&key=AIzaSyB2lLkho9yRrZ9DgZ4btFOZ6x22-zZTJ38

class MarketBloc extends Bloc<MarketEvent, MarketState> {
  final MarketRepo marketRepo;
  final DatabaseCubit database;
  MarketBloc({required this.marketRepo, required this.database})
      : super(MarketState.initial()) {
    on<OnStartEventMarket>((event, emit) async {
      var database = sl.get<DatabaseCubit>();
      var user = database.getUser();
      if (user != null) {
        emit(state.copyWith(
            contactRecepteur: TextEditingController(text: user.phone)));
      }
    });
    on<SetCarouselCurrent>((event, emit) async {
      emit(state.copyWith(indexCarossel: event.indexCarossel));
    });
    on<SelectPointLivraisonMarket>(_selectPointLivraisonMarket);

    on<VerifyFormMarketEvent>((event, emit) async {
      // emit(state.copyWith(
      //     index: 1, errorVille: false, errorPointRecuperation: false));
      if (state.selectedVIlle == null) {
        emit(state.copyWith(errorVille: true));
      } else {
        emit(state.copyWith(errorVille: false));
      }

      // if (state.formKeyMarket!.currentState!.validate()) {
      //   print('VerifyFormMarketEvent');

      //   if (state.selectedVIlle != null &&
      //           state.selected_recuperation_point != null &&
      //           state.contactEmetteur!.text.length !=
      //               0 /*  &&
      //       state.libelle!.text.length != 0 */
      //       ) {
      //     emit(state.copyWith(
      //         index: 1, errorVille: false, errorPointRecuperation: false));
      //   }
      // }
    });
    on<GetLivraisonProduit>(getLivraisonProduit);

    on<SelectedVilleMarket>((event, emit) async {
      emit(state.copyWith(
        selectedVIlle: event.ville,
      ));
    });
    on<MapValidatePointLivraisonMarket>(_mapValidatePointLivraison);
    on<GetProduits>(_getProduit);

    on<SelectedCategoryProduit>(selectedCategoryProduit);

    on<CalculFraisLivraisonProduit>(calculFraisLivraisonProduit);

    on<SelectModePaiementPanier>(selectModePaiementPanier);
    on<AddProduitToPanier>(addProduitToPanier);
    on<RemoveProduitToPanier>(removeProduitToPanier);
    on<ManageQteProduit>(manageQteProduit);
    on<NewLivraisonProduit>(newLivraisonProduit);
    on<FilterProduits>(filterProduits);
    on<InitFilter>(initFilter);
  }

  Future<void> newLivraisonProduit(
      NewLivraisonProduit event, Emitter<MarketState> emit) async {
    emit(state.copyWith(isRequest: null));
    emit(state.copyWith(isRequest: 4));
    emit(state.copyWith(paiement_url: ''));

    var data = await createFormData();

    await marketRepo.newLivraisonMarket(data).then((response) {
      print(response.data);

      if (response.statusCode == 201) {
        if (response.data != null) {
          print(' emit(state.copyWith(isRequest: --------------5))');
          if (state.selectedModePaiement!.id == 1) {
            emit(state.copyWith(
                isRequest: 5,
                isDownloadFacture: 0,
                paiement_url: response.data['paiement_url']));
          }
          if (state.selectedModePaiement!.id == 2) {
            emit(state.copyWith(
                isRequest: 5, isDownloadFacture: 0, paiement_url: 'next'));
          }
          add(GetLivraisonProduit());

          // _cleanData(emit);
          print('00 emit(state.copyWith(isRequest: --------------5))');
        }
      } else {
        emit(state.copyWith(isRequest: 3));
      }
    }).onError((e, s) {
      emit(state.copyWith(isRequest: 3));
    });
  }

  Future<FormData> createFormData() async {
    var key = await database.getKey();
    var data = {
      'keySecret': key,
      'idPointLivraison': state.selected_livraison_point?.id ?? 0,
      'libelleLocalisation': state.selected_livraison_point?.libelle,
      'quartier': state.selected_livraison_point?.quartier,
      'longitude': state.selected_livraison_point?.longitude,
      'latitude': state.selected_livraison_point?.latitude,
      'service': 1,
      'modePaiement': state.selectedModePaiement!.id,
      'montant': getMontant(),
      'contactLivraison': state.contactRecepteur?.text,
      'description': '',
      'ville': state.selectedVIlle?.id,
      'produits': convertProduits(),
    };
    print(data);
    FormData formData = FormData.fromMap(data);
    return formData;
  }

  convertProduits() {
    List _produits = [];
    state.paniers!.forEach((e) {
      _produits
          .add({'produit': e.id.toString(), 'quantite': e.quantite.toString()});
    });
    print(_produits);

    return jsonEncode(_produits);
  }

  getMontant() {
    double montant = 1000;
    state.paniers!.forEach((e) {
      montant += e.produit.prix * e.quantite;
    });

    return montant;
  }

  // ignore: unused_element
  Future<void> _cleanData(Emitter<MarketState> emit) async {
    print(' emit(state.copyWith(isRequest: --------------5))');
    emit(state.copyWith(
        // isMapSelectedPointLivraison: false,
        // isMapSelectedPointRecuperation: false,
        // errorVille: false,
        // isLoadedVille: 0,
        // isLoadedVCategory: 0,
        // errorImage: false,
        // isDownloadFacture: 0,
        // isRequest: 0,
        // // urlFacture: '',
        // isLoadedHistoriqueLivraison: 0,
        // frais: 0,
        // errorQte: false,
        // errorPointRecuperation: false,
        // errorCategory: false,
        // errorPointLivraison: false,
        // index: 0,
        // idColis: 1,
        // listColis: [],
        // imageColis: [],
        // selectedVIlle: null,
        // list_category_colis: [],
        // list_search_point_localisation: [],
        // phone: TextEditingController(),
        // libelle: TextEditingController(),
        // contactEmetteur: TextEditingController(),
        // description: TextEditingController(),
        // nomColis: TextEditingController(),
        // quantiteColis: TextEditingController(text: '1'),
        // contactRecepteur: TextEditingController(),
        // valeurColis: TextEditingController(),
        // quartier_recuperation_point: '',
        ));
  }

  Future<void> manageQteProduit(
      ManageQteProduit event, Emitter<MarketState> emit) async {
    int isIPanier = isInPanier(event.produit);
    if (isIPanier != -1) {
      List<PanierModel> paniers = List.from(state.paniers as Iterable);
      paniers[isIPanier] = new PanierModel(
          id: event.produit.id,
          produit: event.produit,
          quantite: event.state
              ? paniers[isIPanier].quantite + 1
              : check(paniers[isIPanier].quantite - 1));
      emit(state.copyWith(
        paniers: paniers,
      ));
    } else {
      add(AddProduitToPanier(produit: event.produit));
    }
  }

  check(val) {
    return val < 1 ? 1 : val;
  }

  Future<void> removeProduitToPanier(
      RemoveProduitToPanier event, Emitter<MarketState> emit) async {
    int isIPanier = isInPanier(event.produit);

    if (isIPanier != -1) {
      List<PanierModel> paniers = List.from(state.paniers as Iterable);
      paniers.removeAt(isIPanier);
      emit(state.copyWith(
        paniers: paniers,
      ));
    }
  }

  Future<void> addProduitToPanier(
      AddProduitToPanier event, Emitter<MarketState> emit) async {
    List<PanierModel> paniers_exist = List.from(state.paniers as Iterable);

    paniers_exist
      ..add(new PanierModel(
          id: event.produit.id, produit: event.produit, quantite: 1));
    emit(state.copyWith(
      paniers: paniers_exist,
    ));
  }

  isInPanier(produit) {
    List<PanierModel> paniers = state.paniers!;
    int index = paniers.indexWhere((element) => element.id == produit.id);
    print('------${index}--------${produit.id}------*');
    return index;
  }

  isInPanierQuantity(produit) {
    List<PanierModel> paniers = state.paniers!;
    int isIPanier = isInPanier(produit);
    if (isIPanier != -1) {
      return paniers[isIPanier].quantite;
    }
    return 0;
  }

  Future<void> selectedCategoryProduit(
      SelectedCategoryProduit event, Emitter<MarketState> emit) async {
    emit(state.copyWith(
      category: event.categoryProduit,
    ));
  }

  Future<void> _mapValidatePointLivraison(
      MapValidatePointLivraisonMarket event, Emitter<MarketState> emit) async {
    PointLivraisonModel _point = new PointLivraisonModel(
        id: 0,
        libelle: event.libelle,
        quartier: event.quartier,
        ville: state.selectedVIlle!.libelle,
        longitude: state.position!.longitude,
        latitude: state.position!.latitude);

    emit(state.copyWith(
      selected_livraison_point: _point,
      errorVille: false,
      errorPointRecuperation: false,
      isMapSelectedPointLivraison: true,
    ));
  }

  Future<void> _selectPointLivraisonMarket(
      SelectPointLivraisonMarket event, Emitter<MarketState> emit) async {
    emit(state.copyWith(
      selected_livraison_point: event.point_livraison,
    ));
  }

  Future<void> selectModePaiementPanier(
      SelectModePaiementPanier event, Emitter<MarketState> emit) async {
    emit(state.copyWith(selectedModePaiement: event.modePaiement));
  }

  Future<void> calculFraisLivraisonProduit(
      CalculFraisLivraisonProduit event, Emitter<MarketState> emit) async {
    var data = {
      'service': 1,
      'description': 'description.text',
      'quantite': 'quantite.text',
      'valeurProduit': 'valeurProduit.text',
      'category': 'categorySelect.id',
    };
    emit(state.copyWith(isRequest: null));
    emit(state.copyWith(isRequest: 1));

    await marketRepo.calculFraisMarket(data).then((response) {
      print(response.data);

      if (response.statusCode == 200) {
        print(response.data);

        emit(state.copyWith(
            isRequest: 2, frais: double.parse(response.data['frais'])));
        emit(state.copyWith(isRequest: null));
      } else {
        emit(state.copyWith(isRequest: 3));
        // fn.snackBar('Calcul des frais', response.body['message'], false);
      }
    }).onError((e, s) {
      emit(state.copyWith(isRequest: 3));
      emit(state.copyWith(isRequest: null));
    }).catchError((e) {
      print('---------------${e}');
      emit(state.copyWith(isRequest: 3));
      emit(state.copyWith(isRequest: null));
    });
  }

  Future<void> getLivraisonProduit(
      GetLivraisonProduit event, Emitter<MarketState> emit) async {
    var key = await database.getKey();
    emit(state.copyWith(
      isLoadedLivraison: 0,
    ));
    await marketRepo.getHistoryLivraisons(key).then((response) {
      if (response.data != null) {
        emit(state.copyWith(
            isLoadedLivraison: 1,
            userLivraisonList: (response.data['data'] as List)
                .map((e) => LivraisonMarketModel.fromJson(e))
                .toList()));
      } else {
        emit(state.copyWith(
          isLoadedLivraison: 2,
        ));
      }
    }).onError((e, s) {
      emit(state.copyWith(
        isLoadedLivraison: 2,
      ));
    });
  }

  Future<void> _getProduit(GetProduits event, Emitter<MarketState> emit) async {
    log('----------------${state.isLoadedProduit}----------------');

    if ([1, 2, null].contains(state.isLoadedProduit)) {
      if (event.actualise == true) {
        log('----------------${state.isLoadedProduit}----------------');
        emit(state.copyWith(indexPage: 0, listProduits: []));
      }
      var key = await database.getKey();
      int indexPage = state.indexPage! + 1;
      emit(state.copyWith(isLoadedProduit: 0, indexPage: indexPage));

      await marketRepo.getProduits(key, state.indexPage).then((response) {
        if (response.data != null) {
          log('--------------------------------');
          log(response.data.toString());
          List<ProduitModel> _pendingProduits =
              List.from(state.listProduits! as Iterable);
          _pendingProduits.addAll((response.data['data'] as List)
              .map((e) => ProduitModel.fromJson(e))
              .toList());
          emit(state.copyWith(
              isLoadedProduit: 1, listProduits: _pendingProduits));
          emit(state.copyWith(
            isLoadedProduit: null,
          ));

          log('--------------------------------');
        } else {
          emit(state.copyWith(
            isLoadedProduit: 2,
          ));
          emit(state.copyWith(
            isLoadedProduit: null,
          ));
        }
      }).onError((e, s) {
        emit(state.copyWith(
          isLoadedLivraison: 2,
        ));
        emit(state.copyWith(
          isLoadedProduit: null,
        ));
      });
    }
  }

  Future<void> initFilter(InitFilter event, Emitter<MarketState> emit) async {
    if (event.isOpen!) {
      emit(state.copyWith(
          listProduitsSave: state.listProduits, indexPageFilter: 1));
      log('----------------${state.listProduitsSave}----------------');
      emit(state.copyWith(
        listProduits: [],
      ));
    } else {
      emit(state.copyWith(listProduits: state.listProduitsSave));
      log('----------------${state.listProduits}----------------');
    }
  }

  Future<void> filterProduits(
      FilterProduits event, Emitter<MarketState> emit) async {
    log('----------------${state.indexPageFilter}----------------');

    if (state.saveSearch == event.search) {
      int indexPageFilter = state.indexPageFilter! + 1;
      emit(state.copyWith(indexPageFilter: indexPageFilter));
    } else {
      emit(state.copyWith(
        indexPageFilter: 1,
        listProduits: [],
      ));
    }
    emit(state.copyWith(isLoadedProduit: 0, saveSearch: event.search));

    await marketRepo
        .filterProduits(event.search, state.indexPageFilter)
        .then((response) {
      if (response.data != null) {
        List<ProduitModel> _pendingProduits =
            List.from(state.listProduits! as Iterable);
        _pendingProduits.addAll((response.data['data'] as List)
            .map((e) => ProduitModel.fromJson(e))
            .toList());
        emit(
            state.copyWith(isLoadedProduit: 1, listProduits: _pendingProduits));
        emit(state.copyWith(
          isLoadedProduit: null,
        ));

        log('-------------------${response.data['data']}-------------');
      } else {
        emit(state.copyWith(
          isLoadedProduit: 2,
        ));
        emit(state.copyWith(
          isLoadedProduit: null,
        ));
      }
    }).onError((e, s) {
      emit(state.copyWith(
        isLoadedLivraison: 2,
      ));
      emit(state.copyWith(
        isLoadedProduit: null,
      ));
    });
  }
}
