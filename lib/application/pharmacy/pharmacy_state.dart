part of 'pharmacy_bloc.dart';

@freezed
class PharmacyState with _$PharmacyState {
  const factory PharmacyState(
      {required int index,
      int? isLoading,
      GlobalKey<FormState>? formKeyLivraison,
      TextEditingController? searchMedicamentController,
      TextEditingController? libelle,
      TextEditingController? descriptionEmplacement,
      TextEditingController? contactRecepteur,
      List<MedicamentModel>? listMedicament,
      VilleModel? selectedVIlle,
      required bool isMapSelectedPointLivraison,
      int? isDownloadFacture,
      PointLivraisonModel? selected_livraison_point,
      int? isRequest,
      bool? errorPointLivraison,
      LatLng? position,
      int? isLoadedHistoriqueLivraison,
      List<LivraisonMedicamentModel>? userLivraisonMedicamentList,
      bool? errorVille,
      double? frais,
      String?paiement_url,
      List<MedicamentModel>? listMedicamentChoose}) = _PharmacyState;

  factory PharmacyState.initial() => PharmacyState(
      searchMedicamentController: TextEditingController(),
      index: 0,
      isLoadedHistoriqueLivraison: 0,
      libelle: TextEditingController(),
      isRequest: 0,
      errorPointLivraison: false,
      userLivraisonMedicamentList: [],
      frais: 0,
      descriptionEmplacement: TextEditingController(),
      isMapSelectedPointLivraison: false,
      errorVille: false,
      formKeyLivraison: GlobalKey<FormState>(),
      contactRecepteur: TextEditingController(),
      isLoading: 0,
      listMedicament: [],
      listMedicamentChoose: []);
}
