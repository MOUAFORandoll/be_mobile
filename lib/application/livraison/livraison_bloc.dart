import 'dart:convert';
import 'dart:io';

import 'package:BananaExpress/application/database/database_cubit.dart';
import 'package:BananaExpress/application/livraison/repositories/livraisonRepo.dart';
import 'package:BananaExpress/application/model/exportmodel.dart';
import 'package:BananaExpress/core.dart';
import 'package:BananaExpress/infrastructure/_commons/network/env_config.dart';

import 'package:BananaExpress/presentation/components/exportcomponent.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

part 'livraison_event.dart';
part 'livraison_state.dart';
part 'livraison_bloc.freezed.dart';

class LivraisonBloc extends Bloc<LivraisonEvent, LivraisonState> {
  final LivraisonRepo livraisonRepo;
  final DatabaseCubit database;
  LivraisonBloc({required this.livraisonRepo, required this.database})
      : super(LivraisonState.initial()) {
    on<BackIndexEvent>((event, emit) async {
      print('BackIndexEvent');
      emit(state.copyWith(index: 0));
    });
    on<VerifyFormLivraisonEvent>((event, emit) async {
      // emit(state.copyWith(
      //     index: 1, errorVille: false, errorPointRecuperation: false));
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
        print('VerifyFormLivraisonEvent');

        if (state.selectedVIlle != null &&
            state.selected_recuperation_point != null &&
            state.contactEmetteur!.text.length != 0 &&
            state.libelle!.text.length != 0) {
          emit(state.copyWith(
              index: 1, errorVille: false, errorPointRecuperation: false));
        }
      }
    });
    on<GetVilleAndCategoryEvent>(_getVilleAndCategory);
    on<GetRecupPointEvent>(_getpointLocalisation);
    on<SelectedVille>((event, emit) async {
      emit(state.copyWith(
        selectedVIlle: event.ville,
      ));
    });
    on<SetLogLat>(_setLongLat);
    on<SelectPointRecuperation>(_selectPointRecuperation);
    on<MapValidatePoint>(_mapValidatePoint);
    on<MapValidatePointLivraison>(_mapValidatePointLivraison);
    on<MapSelected>(_mapSelected);
    on<StartLogLat>(_setStartLongLat);
    on<SearchPointEvent>(_searchPointRecuperationPointLivraison);

    // Gestion de Colis

    on<AddColis>(addColis);
    on<GetImageColisAppareil>(getImageColisAppareil);
    on<GetImageColisGalerie>(getImageColisGalerie);
    on<UpdateColis>(updateColis);
    on<DeleteColis>(deleteColis);
    on<AddImageColisAppareil>(addImageColisAppareil);
    on<RemoveImageFromColis>(removeImageFromColis);
    on<UpdateImageInColis>(updateImageInColis);
    on<SelectedCategory>(_selectCategory);
    on<SelectColis>(_selectColis);
    on<SelectPointLivraisonColis>(_selectPointLivraison);
    on<ManageQte>(_mamageQte);
    on<CalculFrais>(_calculFraisDeLivraison);

    on<NewLivraison>(_newLivraison);
    on<ListLivraison>(_getLivraisonUser);
    on<DownloadFacture>(_downloadFacture);
  }

  Future<void> _selectPointRecuperation(
      SelectPointRecuperation event, Emitter<LivraisonState> emit) async {
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

  Future<void> _mapValidatePointLivraison(
      MapValidatePointLivraison event, Emitter<LivraisonState> emit) async {
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
      state.copyWith(list_search_point_localisation: []),
    );
    if (searchPointRecuperationText.isEmpty) {
      emit(state.copyWith(
        list_search_point_localisation: state.list_localisation_point,
      ));
    } else {
      var point = state.list_localisation_point!
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
        state.copyWith(list_search_point_localisation: point),
      );
      print('----texte---${state.list_search_point_localisation!.length}');
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

  Future<void> _getVilleAndCategory(
      GetVilleAndCategoryEvent event, Emitter<LivraisonState> emit) async {
    emit(state.copyWith(
      isLoadedVille: 0,
      isLoadedVCategory: 0,
    ));
    try {
      print('debut get ville event');
      Response response = await livraisonRepo.getVille();
      if (response.data != null) {
        if (response.data['data'].length != 0) {
          emit(state.copyWith(
              isLoadedVille: 1,
              villeList: (response.data['data'] as List)
                  .map((e) => VilleModel.fromJson(e))
                  .toList()));
          print('-----------state.villeList.length');
          print(state.villeList!.length);
        } else {
          emit(state.copyWith(
            isLoadedVille: 2,
          ));
        }
      }
      Response response0 = await livraisonRepo.getCategory();
      if (response0.data != null) {
        if (response0.data['data'].length != 0) {
          emit(state.copyWith(
              isLoadedVCategory: 1,
              list_category_colis: (response0.data['data'] as List)
                  .map((e) => CategoryModel.fromJson(e))
                  .toList()));
          print('-----------state.CategoryModel.length');
          print(state.list_category_colis!.length);
        } else {}
      }
    } catch (e) {
      emit(state.copyWith(
        isLoadedVille: 2,
        isLoadedVCategory: 2,
      ));
    }
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
              list_localisation_point: (response.data['data'] as List)
                  .map((e) => PointLivraisonModel.fromJson(e))
                  .toList()));
        } else {}
      }
    } catch (e) {}
  }

// Gestion de Colis

  Future<void> getImageColisAppareil(
      GetImageColisAppareil event, Emitter<LivraisonState> emit) async {
    try {
      print('----------***********-----adding');
      var image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 100,
        maxHeight: 500,
        maxWidth: 500,
      );

      if (image != null) {
        List<File> updatedImageColis = List.from(state.imageColis as Iterable)
          ..add(File(image.path));
        emit(state.copyWith(imageColis: updatedImageColis));
      }
    } catch (e) {
      // Handle the error, e.g., log it or show a message
      print('Error getting image: $e');
    }
  }

  Future<void> getImageColisGalerie(
      GetImageColisGalerie event, Emitter<LivraisonState> emit) async {
    try {
      print('----------***********-----adding');
      var image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
        maxHeight: 500,
        maxWidth: 500,
      );

      if (image != null) {
        List<File> updatedImageColis = List.from(state.imageColis as Iterable)
          ..add(File(image.path));
        emit(state.copyWith(imageColis: updatedImageColis));
      }
    } catch (e) {
      // Handle the error, e.g., log it or show a message
      print('Error getting image: $e');
    }
  }

  Future<void> updateColis(
      UpdateColis event, Emitter<LivraisonState> emit) async {
    final colisToUpdate = state.listColis?.firstWhere(
      (colis) => colis.id == event.idColis,
      orElse: () => Colis(
        nom: '',
        id: -1,
        quantite: '',
        contactRecepteur: '',
        valeurColis: '',
        countImage: 0,
        category: 0,
        listImgColis: [],
      ),
    );

    if (colisToUpdate?.id != -1) {
      colisToUpdate!.nom = state.nomColis!.text;
      colisToUpdate.quantite = state.quantiteColis!.text;
      colisToUpdate.contactRecepteur = state.contactRecepteur!.text;
      colisToUpdate.valeurColis = state.valeurColis!.text;
      final updatedListColis = state.listColis
          ?.map((colis) => colis.id == colisToUpdate.id ? colisToUpdate : colis)
          .toList();

      if (updatedListColis != null) {
        final newState = state.copyWith(listColis: updatedListColis);
        emit(newState);
      }
    }
  }

  Future<void> deleteColis(
      DeleteColis event, Emitter<LivraisonState> emit) async {
    final updatedListColis =
        state.listColis?.where((colis) => colis.id != event.idColis).toList();

    if (updatedListColis != null) {
      final newState = state.copyWith(listColis: updatedListColis);
      emit(newState);
    }
  }

  Future<void> addImageColisAppareil(
      AddImageColisAppareil event, Emitter<LivraisonState> emit) async {
    try {
      var image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 100,
        maxHeight: 500,
        maxWidth: 500,
      );

      final newImage = File(image?.path ?? '');

      final colisId = event.idColis;
      Colis colisToUpdate = state.listColis!.firstWhere(
        (colis) => colis.id == colisId,
        orElse: () => Colis(
          nom: '',
          id: -1,
          quantite: '',
          contactRecepteur: '',
          valeurColis: '',
          countImage: 0,
          category: 0,
          listImgColis: [],
        ),
      );

      if (colisToUpdate.id != -1) {
        final updatedListImgColis = [...colisToUpdate.listImgColis, newImage];
        colisToUpdate.listImgColis = updatedListImgColis;
        final updatedColis = colisToUpdate;
        final updatedListColis = state.listColis!.map((colis) {
          return colis.id == colisId ? updatedColis : colis;
        }).toList();

        final newState = state.copyWith(listColis: updatedListColis);
        emit(newState);
      }
    } catch (e) {
      // Handle exceptions
    }
  }

  Future<void> addImageColisGalerie(
      AddImageColisGalerie event, Emitter<LivraisonState> emit) async {
    try {
      var image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
        maxHeight: 500,
        maxWidth: 500,
      );

      final newImage = File(image?.path ?? '');

      final colisId = event.idColis;
      Colis colisToUpdate = state.listColis!.firstWhere(
        (colis) => colis.id == colisId,
        orElse: () => Colis(
          nom: '',
          id: -1,
          quantite: '',
          contactRecepteur: '',
          valeurColis: '',
          countImage: 0,
          category: 0,
          listImgColis: [],
        ),
      );

      if (colisToUpdate.id != -1) {
        final updatedListImgColis = [...colisToUpdate.listImgColis, newImage];
        colisToUpdate.listImgColis = updatedListImgColis;
        final updatedColis = colisToUpdate;
        final updatedListColis = state.listColis!.map((colis) {
          return colis.id == colisId ? updatedColis : colis;
        }).toList();

        final newState = state.copyWith(listColis: updatedListColis);
        emit(newState);
      }
    } catch (e) {
      // Handle exceptions
    }
  }

  Future<void> removeImageFromColis(
      RemoveImageFromColis event, Emitter<LivraisonState> emit) async {
    Colis colisToUpdate = state.listColis!.firstWhere(
      (colis) => colis.id == event.idColis,
      orElse: () => Colis(
        nom: '',
        id: -1,
        quantite: '',
        contactRecepteur: '',
        valeurColis: '',
        countImage: 0,
        category: 0,
        listImgColis: [],
      ),
    );

    if (colisToUpdate.id != -1 &&
        event.position >= 0 &&
        event.position < colisToUpdate.listImgColis.length) {
      print('-------------sssssssssssss');
      colisToUpdate.listImgColis.removeAt(event.position);
      colisToUpdate.countImage--;

      int index = state.listColis!.indexOf(colisToUpdate);
      if (index != -1) {
        print('-----------${index}--sssssssssssss');

        final updatedListColis = state.listColis!.map((colis) {
          return colis.id == event.idColis ? colisToUpdate : colis;
        }).toList();
        final newState = state.copyWith(listColis: updatedListColis);
        emit(newState);
      }
    }
  }

  Future<void> addColis(AddColis event, Emitter<LivraisonState> emit) async {
    bool isOk = true;
    if (state.categoryColis == null) {
      emit(state.copyWith(errorCategory: true));
      isOk = false;
    } else {
      emit(state.copyWith(errorCategory: false));
      isOk = true;
    }
    if (state.selected_livraison_point == null) {
      emit(state.copyWith(errorPointLivraison: true));
      isOk = false;
    } else {
      emit(state.copyWith(errorPointLivraison: false));
      isOk = true;
    }

    if (state.imageColis!.isEmpty) {
      emit(state.copyWith(errorImage: true));
      isOk = false;
    } else {
      emit(state.copyWith(errorImage: false));
      isOk = true;
    }
    if (state.formKeyColis!.currentState!.validate()) {
      if (isOk) {
        List<MultipartFile> imageFiles = [];

        for (int j = 0; j < state.imageColis!.length; j++) {
          File imageFile = state.imageColis![j];
          imageFiles.add(await MultipartFile.fromFile(
            imageFile.path,
            filename: 'Image$j.jpg',
          ));
        }

        Colis newColis = Colis(
          id: state.idColis!,
          nom: state.nomColis!.text,
          quantite: state.quantiteColis!.text,
          contactRecepteur: state.contactRecepteur!.text,
          valeurColis: state.valeurColis!.text,
          category: state.categoryColis!.id!,
          libelleLocalisation: state.selected_livraison_point!.libelle,
          quartier: state.selected_livraison_point!.quartier,
          longitude: state.selected_livraison_point!.longitude,
          latitude: state.selected_livraison_point!.latitude,
          idPointLivraisonColis: state.selected_livraison_point != null
              ? state.selected_livraison_point!.id
              : 0,
          listImgColis: state.imageColis!,
          countImage: state.imageColis!.length,
        );
        final listColis = [...state.listColis!, newColis];
        final newState = state.copyWith(
            idColis: state.idColis! + 1,
            listColis: listColis); // Update other properties
        emit(newState);
      }
    }
  }

  Future<void> _selectCategory(
      SelectedCategory event, Emitter<LivraisonState> emit) async {
    emit(state.copyWith(
      categoryColis: event.categoryColis,
    ));
  }

  Future<void> _mamageQte(ManageQte event, Emitter<LivraisonState> emit) async {
    final quantite = event.state
        ? check(int.parse(state.quantiteColis!.text) + 1)
        : check(int.parse(state.quantiteColis!.text) - 1);
    emit(state.copyWith(
      quantiteColis: TextEditingController(text: quantite),
    ));
  }

  check(val) {
    return val < 1 ? '1' : val.toString();
  }

  Future<void> _selectPointLivraison(
      SelectPointLivraisonColis event, Emitter<LivraisonState> emit) async {
    emit(state.copyWith(
      selected_livraison_point: event.point_livraison,
    ));
  }

  Future<void> _selectColis(
      SelectColis event, Emitter<LivraisonState> emit) async {
    emit(state.copyWith(
      nomColis: TextEditingController(text: event.colis.nom),
      quantiteColis: TextEditingController(text: event.colis.quantite),
      contactRecepteur:
          TextEditingController(text: event.colis.contactRecepteur),
      valeurColis: TextEditingController(text: event.colis.valeurColis),
      // categoryColis: event.colis.category,
    ));
  }

  Future<void> _calculFraisDeLivraison(
      CalculFrais event, Emitter<LivraisonState> emit) async {
    var data = {
      'service': 1,
      'description': 'description.text',
      'quantite': 'quantite.text',
      'valeurColis': 'valeurColis.text',
      'category': 'categorySelect.id',
    };
    emit(state.copyWith(isRequest: 1));

    await livraisonRepo.calculFraisLivraison(data).then((response) {
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

  Future<void> _newLivraison(
      NewLivraison event, Emitter<LivraisonState> emit) async {
    emit(state.copyWith(isRequest: 4));

    var data = await createFormData();
    print('debut get getLivraisonPointByVille event');
    await livraisonRepo.newLivraison(data).then((response) {
      print(response.data);

      if (response.statusCode == 200) {
        if (response.data != null) {
          print(' emit(state.copyWith(isRequest: --------------5))');
          emit(state.copyWith(
              isRequest: 5,
              isDownloadFacture: 0,
              urlFacture: response.data['facture']));
          print('00 emit(state.copyWith(isRequest: --------------5))');
        }
      }
    }).onError((e, s) {
      emit(state.copyWith(isRequest: 3));
    });
  }

  List<Map<String, dynamic>> convertListToJson(List<Colis> colisList) {
    return colisList.map((colis) => colis.toJson()).toList();
  }

  Future<FormData> createFormData() async {
    var key = await database.getKey();
    var data = {
      'keySecret': key,
      'idPointRecuperation': state.selected_recuperation_point?.id ?? 0,
      'libelleLocalisation': state.selected_recuperation_point?.libelle,
      'quartier': state.selected_recuperation_point?.quartier,
      'longitude': state.selected_recuperation_point?.longitude,
      'latitude': state.selected_recuperation_point?.latitude,
      'libelle': state.libelle?.text,
      'service': 1,
      'contactEmetteur': state.contactEmetteur?.text,
      'description': state.description?.text,
      'ville': state.selectedVIlle?.id,
      'colis': jsonEncode(convertListToJson(state.listColis!)),
    };
    print(data);
    FormData formData = FormData.fromMap(data);

    for (int i = 0; i < state.listColis!.length; i++) {
      Colis colis = state.listColis![i];
      for (int j = 0; j < colis.listImgColis.length; j++) {
        var file = colis.listImgColis[j];
        var fileKey = 'colis${i}${j}';
        formData.files.add(
          MapEntry(
            fileKey,
            await MultipartFile.fromFile(file.path,
                filename: 'Image${i}${j}.jpg'),
          ),
        );
      }
    }
    print(formData);

    return formData;
  }

  Future<void> _getLivraisonUser(
      ListLivraison event, Emitter<LivraisonState> emit) async {
    var key = await database.getKey();
    await livraisonRepo.getHistoryLivraisons(key).then((response) {
      if (response.data != null) {
        emit(state.copyWith(
            isLoadedPLivraison: 1,
            userLivraisonList: (response.data['data'] as List)
                .map((e) => LivraisonModel.fromJson(e))
                .toList()));
        print('-----------state.userLivraisonList.length');
        print(state.villeList!.length);
      } else {
        emit(state.copyWith(
          isLoadedPLivraison: 2,
        ));
      }
    }).onError((e, s) {
      emit(state.copyWith(
        isLoadedPLivraison: 2,
      ));
    });
  }

  _downloadFacture(DownloadFacture event, Emitter<LivraisonState> emit) async {
    try {
      await requestPermission();
      DateTime now = DateTime.now(); // ProgressDialog progress;
      emit(state.copyWith(
        isDownloadFacture: 3,
      ));
      final file = File(
          '/storage/emulated/0/Download/facture_${now.hour}_${now.minute}_${now.second}.pdf');

      await Dio().download(
        '${EnvManager().getBaseUrl()}' + state.urlFacture!,
        file.path,
        onReceiveProgress: (rec, total) {
          print(rec);
          print(total);
          if (rec == total) {
            emit(state.copyWith(
              isDownloadFacture: 1,
            ));
            // fn.snackBar(
            //     'Facture',
            //     'Une facture de la livraison a ete enregistre dans votre portable',
            //     true);
          }
          // progressDowloading =
          //     ((rec / total) * 100).toStringAsFixed(0) + '%';
          // print(progressDowloading);
          // progress.update(message: 'svp veillez patienter ');
        },
        // ignore: body_might_complete_normally_catch_error
      ).catchError((e) {
        print(e);
        emit(state.copyWith(
          isDownloadFacture: 2,
        ));
      });

      // progress.hide();
    } catch (e) {
      print(e);
      emit(state.copyWith(
        isDownloadFacture: 2,
      ));
    }
  }

  Future<void> updateImageInColis(
      UpdateImageInColis event, Emitter<LivraisonState> emit) async {}
}
  // context.read<LivraisonBloc>().add(GetImageColisGalerie()) 