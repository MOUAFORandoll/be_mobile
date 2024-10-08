part of 'livraison_bloc.dart';

@freezed
class LivraisonEvent with _$LivraisonEvent {
  const factory LivraisonEvent.verifyForm() = VerifyFormLivraisonEvent;
  
  const factory LivraisonEvent.backIndex() = BackIndexEvent;

  const factory LivraisonEvent.getVilleAndCategory() = GetVilleAndCategoryEvent;

  const factory LivraisonEvent.selectedVille({
    required VilleModel ville,
  }) = SelectedVille;
  
  const factory LivraisonEvent.selectedCategory({
    required CategoryModel categoryColis,
  }) = SelectedCategory;
  
  const factory LivraisonEvent.selectPointRecuperation({
    required PointLivraisonModel point_recup,
  }) = SelectPointRecuperation;

  const factory LivraisonEvent.clearPointRecuperation() =
      ClearPointRecuperation;

  const factory LivraisonEvent.clearPoinLivraison() = ClearPointLivraison;

  const factory LivraisonEvent.Start(
      {required LatLng latLng,
      String? quartier_recuperation_point}) = SetLogLat;

  const factory LivraisonEvent.setStartLogLat() = StartLogLat;

  const factory LivraisonEvent.getRecupPoint({
    required int ville,
  }) = GetRecupPointEvent;

  const factory LivraisonEvent.searchpointevent({
    required String text,
  }) = SearchPointEvent;
  const factory LivraisonEvent.mapSelected({required bool status}) =
      MapSelected;
  const factory LivraisonEvent.mapValidatePoint({
    required String libelle,
    required String quartier,
  }) = MapValidatePoint;

  const factory LivraisonEvent.mapValidatePointLivraison({
    required String libelle,
    required String quartier,
  }) = MapValidatePointLivraison;

  const factory LivraisonEvent.addColis() = AddColis;

  const factory LivraisonEvent.updateColis({
    required int idColis,
  }) = UpdateColis;

  const factory LivraisonEvent.deleteColis({
    required int idColis,
  }) = DeleteColis;

  const factory LivraisonEvent.getImageColisAppareil() = GetImageColisAppareil;

  const factory LivraisonEvent.getImageColisGalerie() = GetImageColisGalerie;
  const factory LivraisonEvent.addImageColisAppareil({
    required int idColis,
  }) = AddImageColisAppareil;

  const factory LivraisonEvent.addImageColisGalerie({
    required int idColis,
  }) = AddImageColisGalerie;

  const factory LivraisonEvent.selectPointLivraisonColis({
    required PointLivraisonModel point_livraison,
  }) = SelectPointLivraisonColis;

  const factory LivraisonEvent.successLivraisonCreate() =
      SuccessLivraisonCreate;

  const factory LivraisonEvent.removeImageFromColis({
    required int idColis,
    required int position,
  }) = RemoveImageFromColis;
  const factory LivraisonEvent.updateImageInColis(
      {required int idColis,
      required int position,
      required File updatedImage}) = UpdateImageInColis;
  const factory LivraisonEvent.selectColis({required Colis colis}) =
      SelectColis;
  const factory LivraisonEvent.manageQte({required bool state}) = ManageQte;
  const factory LivraisonEvent.calculFrais() = CalculFrais;
  const factory LivraisonEvent.newLivraison() = NewLivraison;
  const factory LivraisonEvent.getLivraison() = HistoriqueUserLivraison;
  const factory LivraisonEvent.downloadFacture({required int id}) = DownloadFacture;
  const factory LivraisonEvent.noValidate() = NoValidate;
  const factory LivraisonEvent.onStartEvent() = OnStartEvent;
  const factory LivraisonEvent.getMapPlaceInfo() = GetMapPlaceInfo;
  const factory LivraisonEvent.onAutoComplet({required String text}) =
      OnAutoComplet;
  const factory LivraisonEvent.ongetPlaceData({required PlaceModel place}) =
      GetPlaceData;
  const factory LivraisonEvent.selectModePaiement({required ModePaiementModel modePaiement}) =
      SelectModePaiement;
}
