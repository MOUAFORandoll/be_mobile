import 'dart:convert';

import 'package:BabanaExpress/application/database/database_cubit.dart';
import 'package:BabanaExpress/application/model/data/LivraisonMedicamentModel.dart';
import 'package:BabanaExpress/application/model/data/PointLivraisonModel.dart';
import 'package:BabanaExpress/application/model/data/VilleModel.dart';
import 'package:BabanaExpress/application/pharmacy/repositories/pharmacy_repository.dart';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core.dart';
part 'pharmacy_event.dart';
part 'pharmacy_state.dart';
part 'pharmacy_bloc.freezed.dart';

class PharmacyBloc extends Bloc<PharmacyEvent, PharmacyState> {
  final PharmacyRepo pharmacyRepo;
  var database = sl.get<DatabaseCubit>();

  PharmacyBloc({required this.pharmacyRepo}) : super(PharmacyState.initial()) {
    on<OnStartEventP>((event, emit) async {
      var user = database.getUser();
      if (user != null) {
        emit(state.copyWith(
            contactRecepteur: TextEditingController(text: user.phone)));
      }
    });

    on<BackIndexEventP>((event, emit) async {
      print('BackIndexEvent');
      emit(state.copyWith(index: 0));
    });
    on<VerifyFormChooseMedicamentEventP>((event, emit) async {
      if (state.listMedicamentChoose!.isNotEmpty &&
          state.listMedicamentChoose!.length != 0) {
        print('-----tff');
        emit(state.copyWith(
          index: 1,
          isRequest: null,
        ));
      }
    });
    on<FindMedicament>(_findMedicament);
    on<ChooseMedicament>(_chooseMedicament);
    on<CloseListMedicament>(_closeListMedicament);
    on<SetQuantiteMedicament>(_setQuantiteMedicament);
    on<DeleteMedicament>(_deleteMedicament);
    on<SelectedVilleP>((event, emit) async {
      emit(state.copyWith(
        selectedVIlle: event.ville,
      ));
    });
    // on<SetLogLat>(_setLongLat);
    on<MapValidatePointLivraisonP>(_mapValidatePointLivraison);
    // on<MapSelectedP>(_mapSelected);
    // on<StartLogLat>(_setStartLongLat);
    on<NewLivraisonPharmacy>(_newLivraisonMedicament);
    on<HistoriqueLivraisonMedicament>(_getLivraisonMedicamentUser);
    // on<DownloadFacture>(_downloadFacture);
    on<CalculFraisP>(_calculFraisDeLivraison);

    on<SelectPointLivraisonP>(_selectPointLivraison);
    on<ClearPointLivraisonMedoc>(clearPointLivraisonMedoc);
    on<MapValidatePointLivraisonPharmacie>(_mapValidatePointPharmacie);
  }

  Future<void> clearPointLivraisonMedoc(
      ClearPointLivraisonMedoc event, Emitter<PharmacyState> emit) async {
    emit(state.copyWith(
      selected_livraison_point: null,
      isMapSelectedPointLivraison: false,
    ));
  }

  Future<void> _findMedicament(
      FindMedicament event, Emitter<PharmacyState> emit) async {
    try {
      emit(state.copyWith(isLoadedMedicament: 0));
      print('debut get findMedicament event');
      Response response = await pharmacyRepo.findMedicament(event.search);
      if (response.data != null) {
        if (response.data['data'].length != 0) {
          emit(state.copyWith(
              isLoadedMedicament: 1,
              listMedicament: (response.data['data'] as List)
                  .map((e) => MedicamentModel.fromJson(e))
                  .toList()));
        } else {
          emit(state.copyWith(listMedicament: []));
        }
      } else {
        emit(state.copyWith(isLoadedMedicament: 2));
      }
    } catch (e) {
      emit(state.copyWith(isLoadedMedicament: 2));
    }
  }

  Future<void> _chooseMedicament(
      ChooseMedicament event, Emitter<PharmacyState> emit) async {
    List<MedicamentModel> _pendingMedicamenty = [];
    _pendingMedicamenty.addAll(state.listMedicamentChoose!);
    print('----------------000');
    final medicamentFind = state.listMedicamentChoose?.firstWhere(
      (e) => e.id == event.medicament.id,
      orElse: () => MedicamentModel(
          id: -1, libelle: '', status: false, description: '', quantite: 0),
    );
    if (medicamentFind!.id == -1) {
      _pendingMedicamenty.add(event.medicament);
      emit(state.copyWith(listMedicamentChoose: _pendingMedicamenty));
    } else {
      final updatedlistMedicamentChoose = state.listMedicamentChoose
          ?.where(
            (medicament) => medicament.id != event.medicament.id,
          )
          .toList();

      if (updatedlistMedicamentChoose != null) {
        final newState =
            state.copyWith(listMedicamentChoose: updatedlistMedicamentChoose);
        emit(newState);
      }
    }
  }

  Future<void> _closeListMedicament(
      CloseListMedicament event, Emitter<PharmacyState> emit) async {
    emit(state.copyWith(
        listMedicament: [],
        searchMedicamentController: new TextEditingController()));
  }

  verifyContains(medicament) {
    print('${medicament.id}-----------');
    final medicamentFind = state.listMedicamentChoose?.firstWhere(
      (e) => e.id == medicament.id,
      orElse: () => MedicamentModel(
          id: -1, libelle: '', status: false, description: '', quantite: 0),
    );

    return medicamentFind!.id != -1;
  }

  Future<void> _setQuantiteMedicament(
      SetQuantiteMedicament event, Emitter<PharmacyState> emit) async {
    final medicamentUpdate = state.listMedicamentChoose?.firstWhere(
      (medicament) => medicament.id == event.medicament.id,
      orElse: () => MedicamentModel(
          id: -1, libelle: '', status: false, description: '', quantite: 0),
    );
    if (medicamentUpdate!.id != -1) {
      medicamentUpdate.quantite = event.quantite;

      final updatedListMedicamentChoose = state.listMedicamentChoose
          ?.map((colis) =>
              colis.id == medicamentUpdate.id ? medicamentUpdate : colis)
          .toList();
      if (updatedListMedicamentChoose != null) {
        final newState =
            state.copyWith(listMedicamentChoose: updatedListMedicamentChoose);
        emit(newState);
      }
    }
  }

  Future<void> _deleteMedicament(
      DeleteMedicament event, Emitter<PharmacyState> emit) async {
    final updatedlistMedicamentChoose = state.listMedicamentChoose
        ?.where(
          (medicament) => medicament.id != event.medicament.id,
        )
        .toList();

    if (updatedlistMedicamentChoose != null) {
      final newState =
          state.copyWith(listMedicamentChoose: updatedlistMedicamentChoose);
      emit(newState);
    }
  }

  Future<void> _mapValidatePointLivraison(
      MapValidatePointLivraisonP event, Emitter<PharmacyState> emit) async {
    // PointLivraisonModel _point = new PointLivraisonModel(
    //     id: 0,
    //     libelle: event.libelle,
    //     quartier: event.quartier,
    //     ville: state.selectedVIlle!.libelle,
    //     longitude: state.position!.longitude,
    //     latitude: state.position!.latitude);

    // emit(state.copyWith(
    //   selected_livraison_point: _point,
    //   errorVille: false,
    //   errorPointRecuperation: false,
    //   isMapSelectedPointRecuperation: true,
    // ));
  }

  // Future<void> _setLongLat(SetLogLat event, Emitter<PharmacyState> emit) async {
  //   emit(state.copyWith(
  //     position: event.latLng,
  //     // quartier_recuperation_point: event.quartier_recuperation_point,
  //   ));
  // }

  Future<void> noValidate(
      NoValidateP event, Emitter<PharmacyState> emit) async {
    final newState = state.copyWith(isRequest: 0);
    emit(newState);
  }

  Future<void> _mapValidatePointPharmacie(
      MapValidatePointLivraisonPharmacie event,
      Emitter<PharmacyState> emit) async {
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
      isMapSelectedPointLivraison: true,
    ));
  }

  Future<void> _selectPointLivraison(
      SelectPointLivraisonP event, Emitter<PharmacyState> emit) async {
    emit(state.copyWith(
      selected_livraison_point: event.point_livraison,
    ));
  }

  Future<void> _calculFraisDeLivraison(
      CalculFraisP event, Emitter<PharmacyState> emit) async {
    var data = {
      'service': 1,
      'description': 'description.text',
      'quantite': 'quantite.text',
      'valeurColis': 'valeurColis.text',
      'category': 'categorySelect.id',
    };
    emit(state.copyWith(isRequest: 1));

    await pharmacyRepo.calculFraisLivraison(data).then((response) {
      print(response.data);

      if (response.statusCode == 200) {
        print(response.data);

        emit(state.copyWith(
            isRequest: 2, frais: double.parse(response.data['frais'])));
      } else {
        emit(state.copyWith(isRequest: 3));
        // fn.snackBar('Calcul des frais', response.body['message'], false);
      }
    }).onError((e, s) {
      emit(state.copyWith(isRequest: 3));
    });
  }

  Future<void> _newLivraisonMedicament(
      NewLivraisonPharmacy event, Emitter<PharmacyState> emit) async {
    emit(state.copyWith(isRequest: 4));
    emit(state.copyWith(paiement_url: ''));

    var data = await createFormData();

    await pharmacyRepo.newLivraisonMedicament(data).then((response) {
      print(response.data);

      if (response.statusCode == 201) {
        if (response.data != null) {
          print(' emit(state.copyWith(isRequest: --------------5))');
          emit(state.copyWith(
              isRequest: 5,
              isDownloadFacture: 0,
              paiement_url: response.data[
                  'paiement_url'] /*     urlFacture: response.data['facture'] */
              ));
          add(HistoriqueLivraisonMedicament());

          _cleanData(emit);
          print('00 emit(state.copyWith(isRequest: --------------5))');
        }
      } else {
        emit(state.copyWith(isRequest: 3));
      }
    }).onError((e, s) {
      emit(state.copyWith(isRequest: 3));
    });
  }

  List<int> _medicaments = [];
  convertMedicament() {
    state.listMedicamentChoose!.forEach((e) {
      _medicaments.add(e.id);
    });

    return jsonEncode(_medicaments);
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
      'libelle': state.libelle?.text,
      'service': 1,
      'montant': state.frais,
      'contactLivraison': state.contactRecepteur?.text,
      'description': state.descriptionEmplacement?.text,
      'ville': state.selectedVIlle?.id,
      'medicaments': convertMedicament(),
    };
    print(data);
    FormData formData = FormData.fromMap(data);

    print(formData);

    return formData;
  }

  Future<void> _cleanData(Emitter<PharmacyState> emit) async {
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

  Future<void> _getLivraisonMedicamentUser(
      HistoriqueLivraisonMedicament event, Emitter<PharmacyState> emit) async {
    emit(state.copyWith(
      isLoadedHistoriqueLivraison: 0,
    ));
    var key = await database.getKey();
    await pharmacyRepo.getHistoryLivraisonsMedicaments(key).then((response) {
      if (response.data != null) {
        emit(state.copyWith(
            isLoadedHistoriqueLivraison: 1,
            userLivraisonMedicamentList: (response.data['data'] as List)
                .map((e) => LivraisonMedicamentModel.fromJson(e))
                .toList()));
      } else {
        emit(state.copyWith(
          isLoadedHistoriqueLivraison: 2,
        ));
      }
    }).onError((e, s) {
      emit(state.copyWith(
        isLoadedHistoriqueLivraison: 2,
      ));
    });
  }

  @override
  Future<void> close() async {
    await super.close();
  }
}
