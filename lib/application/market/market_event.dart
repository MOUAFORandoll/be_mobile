part of 'market_bloc.dart';

@freezed
class MarketEvent with _$MarketEvent {
  const factory MarketEvent.started() = _Started;
  const factory MarketEvent.listProduits() = ListProduits;
  const factory MarketEvent.verifyForm() = VerifyFormMarketEvent;

  const factory MarketEvent.getProduits() = GetProduits;

  const factory MarketEvent.selectedVilleMarket({
    required VilleModel ville,
  }) = SelectedVilleMarket;

  const factory MarketEvent.selectedCategoryProduit({
    required CategoryModel categoryProduit,
  }) = SelectedCategoryProduit;
  const factory MarketEvent.onStartEventMarket() = OnStartEventMarket;

  const factory MarketEvent.mapSelectedMarket({required bool status}) =
      MapSelectedMarket;

  const factory MarketEvent.mapValidatePointLivraisonMarket({
    required String libelle,
    required String quartier,
  }) = MapValidatePointLivraisonMarket;
  
  const factory MarketEvent.selectPointLivraisonMarket({
    required PointLivraisonModel? point_livraison,
  }) = SelectPointLivraisonMarket;

  const factory MarketEvent.successLivraisonProduitCreate() =
      SuccessLivraisonProduitCreate;

  const factory MarketEvent.selectProduit({required ProduitModel colis}) =
      SelectProduit;

  const factory MarketEvent.calculFraisLivraisonProduit() =
      CalculFraisLivraisonProduit;
  const factory MarketEvent.newLivraisonProduit() = NewLivraisonProduit;
  const factory MarketEvent.getLivraisonProduit() = GetLivraisonProduit;

  const factory MarketEvent.selectModePaiementPanier(
      {required ModePaiementModel modePaiement}) = SelectModePaiementPanier;

  const factory MarketEvent.setCarouselCurrent({required int indexCarossel}) =
      SetCarouselCurrent;

  const factory MarketEvent.addProduitToPanier(
      {required ProduitModel produit}) = AddProduitToPanier;
  const factory MarketEvent.manageQteProduit(
      {required ProduitModel produit, required bool state}) = ManageQteProduit;

  const factory MarketEvent.removeProduitToPanier(
      {required ProduitModel produit}) = RemoveProduitToPanier;
}
