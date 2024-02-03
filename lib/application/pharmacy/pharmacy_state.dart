part of 'pharmacy_bloc.dart';

@freezed
class PharmacyState with _$PharmacyState {
  const factory PharmacyState(
      {required int index,
      int? isLoading,
      TextEditingController? searchMedicamentController,
      List<MedicamentModel>? listMedicament,
      List<MedicamentModel>? listMedicamentChoose}) = _PharmacyState;

  factory PharmacyState.initial() => PharmacyState(
      searchMedicamentController: TextEditingController(),
      index: 0,
      isLoading: 0,
      listMedicament: [],
      listMedicamentChoose: []);
}
