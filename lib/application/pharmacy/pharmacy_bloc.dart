import 'package:BananaExpress/application/pharmacy/repositories/pharmacy_repository.dart';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:BananaExpress/presentation/components/exportcomponent.dart';

import '../export_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'pharmacy_event.dart';
part 'pharmacy_state.dart';
part 'pharmacy_bloc.freezed.dart';

class PharmacyBloc extends Bloc<PharmacyEvent, PharmacyState> {
  final PharmacyRepo pharmacyRepo;

  PharmacyBloc({required this.pharmacyRepo}) : super(PharmacyState.initial()) {
    on<VerifyFormChooseMedicamentEvent>((event, emit) async {
      emit(state.copyWith(
        index: 1,
      ));
    });
    on<FindMedicament>(_findMedicament);
    on<ChooseMedicament>(_chooseMedicament);
    on<CloseListMedicament>(_closeListMedicament);
    on<SetQuantiteMedicament>(_setQuantiteMedicament);
    on<DeleteMedicament>(_deleteMedicament);
  }

  Future<void> _findMedicament(
      FindMedicament event, Emitter<PharmacyState> emit) async {
    try {
      print('debut get findMedicament event');
      Response response = await pharmacyRepo.findMedicament(event.search);
      if (response.data != null) {
        if (response.data['data'].length != 0) {
          emit(state.copyWith(
              listMedicament: (response.data['data'] as List)
                  .map((e) => MedicamentModel.fromJson(e))
                  .toList()));
        } else {
          emit(state.copyWith(listMedicament: []));
        }
      }
    } catch (e) {}
  }

  Future<void> _chooseMedicament(
      ChooseMedicament event, Emitter<PharmacyState> emit) async {
    List<MedicamentModel> _pendingMedicamenty = [];
    _pendingMedicamenty.addAll(state.listMedicamentChoose!);
    print('----------------000');

    _pendingMedicamenty.add(event.medicament);
    emit(state.copyWith(listMedicamentChoose: _pendingMedicamenty));
  }

  Future<void> _closeListMedicament(
      CloseListMedicament event, Emitter<PharmacyState> emit) async {
    emit(state.copyWith(
        listMedicament: [],
        searchMedicamentController: new TextEditingController()));
  }

  Future<void> _setQuantiteMedicament(
      SetQuantiteMedicament event, Emitter<PharmacyState> emit) async {
    final medicamentUpdate = state.listMedicamentChoose?.firstWhere(
      (medicament) => medicament.id == event.medicament.id,
      orElse: () => MedicamentModel(
          id: -1, libelle: '', status: false, description: '', quantite: 0),
    );
    if (medicamentUpdate!.id != -1) {
      medicamentUpdate.quantite = event.quantite;

      final updatedListMedicamentChoose = state.listMedicamentChoose
          ?.map((colis) =>
              colis.id == medicamentUpdate.id ? medicamentUpdate : colis)
          .toList();
      if (updatedListMedicamentChoose != null) {
        final newState =
            state.copyWith(listMedicamentChoose: updatedListMedicamentChoose);
        emit(newState);
      }
    }
  }

  Future<void> _deleteMedicament(
      DeleteMedicament event, Emitter<PharmacyState> emit) async {
    final updatedlistMedicamentChoose = state.listMedicamentChoose
        ?.where(
          (medicament) => medicament.id != event.medicament.id,
        )
        .toList();

    if (updatedlistMedicamentChoose != null) {
      final newState =
          state.copyWith(listMedicamentChoose: updatedlistMedicamentChoose);
      emit(newState);
    }
  }

  @override
  Future<void> close() async {
    await super.close();
  }
}
