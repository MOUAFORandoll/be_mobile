import 'package:BabanaExpress/application/model/exportmodel.dart';
import 'package:BabanaExpress/application/compte/repositories/compteRepo.dart';
import 'package:BabanaExpress/application/database/database_cubit.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart';

part 'compte_event.dart';
part 'compte_state.dart';
part 'compte_bloc.freezed.dart';

class CompteBloc extends Bloc<CompteEvent, CompteState> {
  final CompteRepo compteRepo;
  final DatabaseCubit database;
  CompteBloc({required this.compteRepo, required this.database})
      : super(CompteState.initial()) {
    on<CompteEvent>((event, emit) {});
    on<HistoriqueTransaction>(historiqueTransaction);
    on<CreditCompte>(creditCompte);
    on<RetraitCompte>(retraitCompte);
  }

  Future<void> historiqueTransaction(
      HistoriqueTransaction event, Emitter<CompteState> emit) async {
    var key = await database.getKey();
    var user = await database.getUser();
    emit(state.copyWith(
      isLoadedTrans: 0,
    ));
    emit(state.copyWith(
        phone: TextEditingController(
      text: user!.phone,
    )));
    await compteRepo.getListTransaction(key).then((response) {
      if (response.data != null) {
        emit(state.copyWith(
            isLoadedTrans: 1,
            transactionList: (response.data['data'] as List)
                .map((e) => TransactionModel.fromJson(e))
                .toList()));
      } else {
        emit(state.copyWith(
          isLoadedTrans: 2,
        ));
      }
    }).onError((e, s) {
      emit(state.copyWith(
        isLoadedTrans: 2,
      ));
    });
  }

  Future<void> creditCompte(
      CreditCompte event, Emitter<CompteState> emit) async {
    try {
      var key = await database.getKey();
      var user = await database.getUser();
      var data = {
        'keySecret': key,
        'montant': state.montantTransaction.text,
        'phone': state.phone.text,
        'nom': user!.nom,
        'prenom': user.prenom,
      };
      emit(state.copyWith(isLoadingDepot: 0, paiement_url: ''));

      print('debut credit event');
      print(data);
      Response response = await compteRepo.creditCompte(data);
      if (response.data != null) {
        emit(state.copyWith(
            isLoadingDepot: 1, paiement_url: response.data['paiement_url']));
        emit(state.copyWith(isLoadingDepot: null));
      } else {
        emit(state.copyWith(isLoadingDepot: 2));
      }
    } catch (e) {
      emit(state.copyWith(isLoadingDepot: 2));
    }
  }

  Future<void> retraitCompte(
      RetraitCompte event, Emitter<CompteState> emit) async {
    try {
      var data = {};

      // var data = {
      //   'keySecret': keySecret,
      //   'montant': montant.text,
      //   'numeroClient': phone.text,
      //   'nom': name,
      //   'prenom': prenom,
      //   'idModePaiement': mode
      // };
      emit(state.copyWith(isLoadingRetrait: 0, paiement_url: ''));

      print('debut    Retrait event');
      Response response = await compteRepo.retraitCompte(data);
      if (response.data != null) {
        emit(state.copyWith(
            isLoadingRetrait: 1, paiement_url: response.data['paiement_url']));
      } else {
        emit(state.copyWith(isLoadingRetrait: 2));
      }
    } catch (e) {
      emit(state.copyWith(isLoadingRetrait: 2));
    }
  }
}
