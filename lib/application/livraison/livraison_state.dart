import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../old/model/data/VilleModel.dart';

@immutable
class LivraisonState extends Equatable {
  final bool isVille;
  final bool isPointRecuperation;
  final int index;
  final double? longitudeRecuperation;
  final double? latitudeRecuperation;
  final double? selected_recuperation_point;
  List<VilleModel>? villeList;
  List? list_recuperation_point;
  VilleModel? selectedVIlle;

  LivraisonState(
      {required this.isVille,
      required this.isPointRecuperation,
      required this.index,
      this.villeList,
      this.longitudeRecuperation,
      this.selected_recuperation_point,
      this.latitudeRecuperation,
      this.list_recuperation_point,
      this.selectedVIlle});

  @override
  List<Object?> get props => [
        latitudeRecuperation,
        longitudeRecuperation,
        isVille,
        isPointRecuperation,
        list_recuperation_point,
        index,
        villeList,
        selectedVIlle,
        selected_recuperation_point
      ];

  LivraisonState copyWith({
    bool? isVille,
    bool? isPointRecuperation,
    int? index,
    double? longitudeRecuperation,
    double? latitudeRecuperation,
    List<VilleModel>? villeList,
    List? list_recuperation_point,
    VilleModel? selectedVIlle,
  }) {
    return LivraisonState(
      list_recuperation_point:
          list_recuperation_point ?? this.list_recuperation_point,
      isVille: isVille ?? this.isVille,
      isPointRecuperation: isPointRecuperation ?? this.isPointRecuperation,
      index: index ?? this.index,
      villeList: villeList ?? this.villeList,
      selectedVIlle: selectedVIlle ?? this.selectedVIlle,
      selected_recuperation_point:
          selected_recuperation_point ?? this.selected_recuperation_point,
      longitudeRecuperation:
          longitudeRecuperation ?? this.longitudeRecuperation,
      latitudeRecuperation: latitudeRecuperation ?? this.latitudeRecuperation,
    );
  }
}
