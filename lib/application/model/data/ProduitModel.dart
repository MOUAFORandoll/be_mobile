// To parse this JSON data, do
//
//     final produitModel = produitModelFromJson(jsonString);

// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'ImageModel.dart';

ProduitModel produitModelFromJson(String str) =>
    ProduitModel.fromJson(json.decode(str));

String produitModelToJson(ProduitModel data) => json.encode(data.toJson());

class ProduitModel {
  ProduitModel({
    required this.id,
    required this.market,
    required this.description,
    required this.titre,
    required this.prix,
    required this.status,
    required this.images,
  });

  final String market;
  final String description;
  final String titre;
  final int id;
  final int prix;
  final bool status;
  final List<ImageModel> images;

  factory ProduitModel.fromJson(Map<String, dynamic> json) => ProduitModel(
        id: json['id'] == null ? null : json['id'],
        market: json['market'] == null ? null : json['market'],
        description: json['description'] == null ? null : json['description'],
        titre: json['titre'] == null ? null : json['titre'],
        prix: json['prix'] == null ? null : json['prix'],
        status: json['status'] == null ? null : json['status'],
        images: json['images'] == null
            ? []
            : List<ImageModel>.from(
                json['images'].map((x) => ImageModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'id': id == null ? null : id,
        'market': market == null ? null : market,
        'description': description == null ? null : description,
        'titre': titre == null ? null : titre,
        'prix': prix == null ? null : prix,
        'status': status == null ? null : status,
        'images': images == null
            ? null
            : List<dynamic>.from(images.map((x) => x.toJson())),
      };
}
