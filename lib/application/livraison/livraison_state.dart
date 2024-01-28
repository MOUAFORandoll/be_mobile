part of 'livraison_bloc.dart';

@freezed
class LivraisonState with _$LivraisonState {
  const factory LivraisonState({
    bool? errorVille,
    bool? errorPointRecuperation,
    required bool isMapSelectedPointRecuperation,
    required int index,
    // double? longitudeRecuperation,
    PointLivraisonModel? selected_recuperation_point,
    String? quartier_recuperation_point,
    List<VilleModel>? villeList,
    List<PointLivraisonModel>? list_recuperation_point,
    List<PointLivraisonModel>? list_search_recuperation_point,
    VilleModel? selectedVIlle,
    TextEditingController? phone,
    TextEditingController? libelle,
    TextEditingController? contactEmetteur,
    TextEditingController? description,
    GlobalKey<FormState>? formKeyLivraison,
    LatLng? position,
  }) = _LivraisonState;

  factory LivraisonState.initial() => LivraisonState(
        formKeyLivraison: GlobalKey<FormState>(),
        isMapSelectedPointRecuperation: false,
        errorVille: false,
        errorPointRecuperation: false,
        index: 0,
        list_recuperation_point: [],
        list_search_recuperation_point: [],
        villeList: [],
        phone: TextEditingController(),
        libelle: TextEditingController(),
        contactEmetteur: TextEditingController(),
        description: TextEditingController(),
      );
}
