part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required User? user,
    required int index,
    required int indexHistory,
    required int? isLoadLivraison,
    required int? isLoadService,
    required int? service_id,
    required bool? recupMailStatus,
    List<LivraisonUserHomeModel>? userHomeLivraisonList,
    List<ServiceModel>? listServices,
    dynamic livraison,
    required bool? noOpen,
    required int isLoadHomeStateLivraison,
  }) = _HomeState;

  factory HomeState.initial() => HomeState(
      user: null,
      isLoadHomeStateLivraison: 0,
      index: 0,
      service_id: 1,
      userHomeLivraisonList: [],
      isLoadService: 0,
      listServices: [],
      livraison: null,
      indexHistory: 0,
      isLoadLivraison: null,
      recupMailStatus: true,
      noOpen: false);
}
