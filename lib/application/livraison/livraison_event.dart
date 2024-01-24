import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../old/model/data/VilleModel.dart';

abstract class LivraisonEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class VerifyFormEvent extends LivraisonEvent {
  final int? index;
  final bool? isVille;
  final bool? isPointRecuperation;

  VerifyFormEvent({
    this.index,
    this.isVille,
    this.isPointRecuperation,
  });

  @override
  List<Object?> get props => [index, isVille, isPointRecuperation];
}

class BackIndexEvent extends LivraisonEvent {}

class GetVilleEvent extends LivraisonEvent {}

class SelectedVille extends LivraisonEvent {
  final VilleModel? ville;

  SelectedVille({required this.ville});

  List<Object?> get props => [ville];
}

class SelectedPointLocalisation extends LivraisonEvent {
  final point_recup;

  SelectedPointLocalisation({required this.point_recup});

  List<Object?> get props => [point_recup];
}

class SetLogLat extends LivraisonEvent {
  final LatLng latLng;

  SetLogLat({required this.latLng});
  
  List<Object?> get props => [latLng];
}

class GetRecupPointEvent extends LivraisonEvent {
  final int ville;
  
  GetRecupPointEvent({required this.ville});
  
  List<Object?> get props => [ville];
}
