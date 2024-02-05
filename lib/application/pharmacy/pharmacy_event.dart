part of 'pharmacy_bloc.dart';

@freezed
class PharmacyEvent with _$PharmacyEvent {
  const factory PharmacyEvent.updatePharmacyImage() = UpdatePharmacyImage;
  const factory PharmacyEvent.verifyFormChooseMedicamentEvent() =
      VerifyFormChooseMedicamentEventP;

  const factory PharmacyEvent.findMedicament({required String search}) =
      FindMedicament;
  const factory PharmacyEvent.chooseMedicament(
      {required MedicamentModel medicament}) = ChooseMedicament;
  const factory PharmacyEvent.closeListMedicament() = CloseListMedicament;

  const factory PharmacyEvent.setQuantiteMedicament(
      {required MedicamentModel medicament,
      required int quantite}) = SetQuantiteMedicament;
  const factory PharmacyEvent.deleteMedicament({
    required MedicamentModel medicament,
  }) = DeleteMedicament;

  const factory PharmacyEvent.backIndexP() = BackIndexEventP;

  const factory PharmacyEvent.selectedVille({
    required VilleModel ville,
  }) = SelectedVilleP;

  const factory PharmacyEvent.searchpointevent({
    required String text,
  }) = SearchPointEventP;
  const factory PharmacyEvent.mapSelected({required bool status}) =
      MapSelectedP;
  const factory PharmacyEvent.mapValidatePoint({
    required String libelle,
    required String quartier,
  }) = MapValidatePointP;
  const factory PharmacyEvent.calculFrais() = CalculFraisP;

  const factory PharmacyEvent.mapValidatePointLivraison({
    required String libelle,
    required String quartier,
  }) = MapValidatePointLivraisonP;

  const factory PharmacyEvent.selectPointLivraisonP({
    required PointLivraisonModel point_livraison,
  }) = SelectPointLivraisonP;
  const factory PharmacyEvent.newLivraison() = NewLivraisonPharmacy;
  const factory PharmacyEvent.getLivraisonMedicament() =
      HistoriqueLivraisonMedicament;
  const factory PharmacyEvent.downloadFacture() = DownloadFactureP;
  const factory PharmacyEvent.noValidate() = NoValidateP;
  const factory PharmacyEvent.onStartEventP() = OnStartEventP;
}
