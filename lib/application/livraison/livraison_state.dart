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
    String? paiement_url,
    List<VilleModel>? villeList,
    int? idColis,
    List<Colis>? listColis,
    List<File>? imageColis,
    List<PointLivraisonModel>? list_localisation_point,
    List<PointLivraisonModel>? list_search_point_localisation,
    VilleModel? selectedVIlle,
    TextEditingController? phone,
    TextEditingController? libelle,
    TextEditingController? contactEmetteur,
    TextEditingController? description,
    GlobalKey<FormState>? formKeyLivraison,
    GlobalKey<FormState>? formKeyColis,
    TextEditingController? nomColis,
    TextEditingController? quantiteColis,
    TextEditingController? contactRecepteur,
    TextEditingController? valeurColis,
    CategoryModel? categoryColis,
    List<CategoryModel>? list_category_colis,
    required bool isMapSelectedPointLivraison,
    PointLivraisonModel? selected_livraison_point,
    bool? errorCategory,
    bool? errorPointLivraison,
    int? isRequest,
    double? frais,
    bool? errorQte,
    int? isDownloadFacture,
    bool? errorImage,
    int? isLoadedPLivraison,
    int? isLoadedLivraison,
    int? isLoadedVille,
    bool? isColisOK,
    bool? successLivraison,
    String? launchUrl,
    int? loadingMapPlaceInfo,
    MapPlaceInfoModel? mapPlaceInfo,
    int? isLoadedVCategory,
    String? urlFacture,
    List<LivraisonModel>? userLivraisonList,
    WebViewController? controller,
    LatLng? position,
    int? isLoadingPlaceSearch,
    int? isLoadingPlaceSearchInfo,
    List<PlaceModel>? list_search_place,
    LatLng? findedPlaceInfo,
    ModePaiementModel? selectedModePaiement,
  }) = _LivraisonState;

  factory LivraisonState.initial() => LivraisonState(
        formKeyLivraison: GlobalKey<FormState>(),
        formKeyColis: GlobalKey<FormState>(),
        loadingMapPlaceInfo: 0,
        selectedModePaiement: null,
        list_search_place: [],
        paiement_url: '',
        findedPlaceInfo: null,
        controller: null,
        mapPlaceInfo: null,
        isColisOK: false,
        isLoadingPlaceSearch: null,
        isLoadingPlaceSearchInfo: null,
        isLoadedLivraison: 0,
        successLivraison: false,
        isMapSelectedPointLivraison: false,
        isMapSelectedPointRecuperation: false,
        errorVille: false,
        isLoadedVille: 0,
        isLoadedVCategory: 0,
        errorImage: false,
        isDownloadFacture: null,
        isRequest: 0,
        urlFacture: '',
        isLoadedPLivraison: null,
        frais: 0,
        errorQte: false,
        errorPointRecuperation: false,
        errorCategory: false,
        errorPointLivraison: false,
        index: 0,
        idColis: 1,
        listColis: [],
        userLivraisonList: [],
        launchUrl: null,
        imageColis: [],
        list_category_colis: [],
        list_localisation_point: [],
        list_search_point_localisation: [],
        villeList: [],
        phone: TextEditingController(),
        libelle: TextEditingController(),
        contactEmetteur: TextEditingController(),
        description: TextEditingController(),
        nomColis: TextEditingController(),
        quantiteColis: TextEditingController(text: '1'),
        contactRecepteur: TextEditingController(),
        valeurColis: TextEditingController(),
      );
}
