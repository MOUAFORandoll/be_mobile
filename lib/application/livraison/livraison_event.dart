part of 'livraison_bloc.dart';

@freezed
class LivraisonEvent with _$LivraisonEvent {
  const factory LivraisonEvent.verifyForm({
    int? index,
    bool? isVille,
    bool? isPointRecuperation,
  }) = VerifyFormEvent;

  const factory LivraisonEvent.backIndex() = BackIndexEvent;

  const factory LivraisonEvent.getVille() = GetVilleEvent;

  const factory LivraisonEvent.selectedVille({
    required VilleModel ville,
  }) = SelectedVille;

  const factory LivraisonEvent.selectedPointLocalisation({
    required PointLivraisonModel point_recup,
  }) = SelectedPointLocalisation;
  
  const factory LivraisonEvent.Start({
    required LatLng latLng,String? quartier_recuperation_point
  }) = SetLogLat;
  
  const factory LivraisonEvent.setStartLogLat() = StartLogLat;
  
  const factory LivraisonEvent.getRecupPoint({
    required int ville,
  }) = GetRecupPointEvent;
    
  
  const factory LivraisonEvent.searchpointevent({
    required String text,
  }) = SearchPointEvent;
}
