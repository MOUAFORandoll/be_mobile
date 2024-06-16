part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required User? user,
    required int index,
    required int indexHistory,
    required int? isLoadedLivraison,
    required int? service_id,
    required bool? recupMailStatus,
    List<LivraisonUserHomeModel>? userHomeLivraisonList,
    dynamic livraison,
    required bool? noOpen,
    required int isLoadedHomeStateLivraison,
  }) = _HomeState;

  factory HomeState.initial() => HomeState(
      user: null,
      isLoadedHomeStateLivraison: 0,
      index: 0,
      service_id: 1,
      userHomeLivraisonList: [],
      livraison: null,
      indexHistory: 0,
      isLoadedLivraison: null,
      recupMailStatus: true,
      noOpen: false);
}
