part of 'livraison_bloc.dart';

@freezed
class LivraisonState with _$LivraisonState {
  const factory LivraisonState(
      {required bool isVille,
      required bool isPointRecuperation,
      required int index,
      // double? longitudeRecuperation,
      PointLivraisonModel? selected_recuperation_point,
      String? quartier_recuperation_point,
      List<VilleModel>? villeList,
      List<PointLivraisonModel>? list_recuperation_point,
      List<PointLivraisonModel>? list_search_recuperation_point,
      VilleModel? selectedVIlle,
      LatLng? position}) = _LivraisonState;
  
  factory LivraisonState.initial() => LivraisonState(
        isVille: false,
        isPointRecuperation: false,
        index: 0,
        list_recuperation_point: [],
        list_search_recuperation_point: [],
        villeList: [],
      );
}
