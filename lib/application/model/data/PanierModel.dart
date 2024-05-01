// To parse this JSON data, do
//
//     final produitModel = produitModelFromJson(jsonString);

// ignore_for_file: unnecessary_null_comparison
 

import 'ProduitModel.dart';
 
class PanierModel {
  PanierModel({
    required this.id,
    required this.produit,
    required this.quantite,
  });

  final int id;
  final int quantite;
  final ProduitModel produit;
}
