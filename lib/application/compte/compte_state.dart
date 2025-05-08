part of 'compte_bloc.dart';

@freezed
class CompteState with _$CompteState {
  const factory CompteState(
      {int? isLoadingDepot,
      int? isLoadingRetrait,
      int? isLoadTrans,
      required TextEditingController montantTransaction,
      required TextEditingController phone,
      required TextEditingController password,
      List<TransactionModel>? transactionList,
      // TextEditingController? contactEmetteur,
      String? paiement_url}) = _CompteState;

  factory CompteState.initial() => CompteState(
      phone: TextEditingController(),
      password: TextEditingController(),
      montantTransaction: TextEditingController(text: '500'),
      isLoadTrans: 0,
      isLoadingDepot: null,
      isLoadingRetrait: null,
      paiement_url: '',
      transactionList: []);
}
