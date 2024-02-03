part of 'pharmacy_bloc.dart';

@freezed
class PharmacyEvent with _$PharmacyEvent {
  const factory PharmacyEvent.updatePharmacyImage() = UpdatePharmacyImage;
  const factory PharmacyEvent.verifyFormChooseMedicamentEvent() =
      VerifyFormChooseMedicamentEvent;

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
}
