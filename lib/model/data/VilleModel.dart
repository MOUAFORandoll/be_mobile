// To parse this JSON data, do
//
//     final VilleModel = VilleModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class VilleModel {
  VilleModel({
    required this.id,
    required this.libelle,
  });

  final int id;
  final String libelle;

  factory VilleModel.fromJson(Map<String, dynamic> json) => VilleModel(
        id: json["id"] == null ? null : json["id"],
        libelle: json["libelle"] == null ? null : json["libelle"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "libelle": libelle == null ? null : libelle,
      };
}
