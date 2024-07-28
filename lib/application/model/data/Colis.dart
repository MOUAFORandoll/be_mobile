import 'dart:io';

class Colis {
  String nom;
  String quantite;
  String? contactRecepteur;
  String valeurColis;
  int countImage;
  int id;
  int category;
  String? libelleLocalisation;
  String? quartier;
  double? longitude;
  double? latitude;
  int? idPointLivraisonColis;
  String? contactRecuperation;
  int? idPointRecuperation;
  List<File> listImgColis;

  Colis({
    required this.nom,
    required this.id,
    required this.quantite,
    this.contactRecepteur,
    required this.valeurColis,
    required this.countImage,
    required this.category,
    this.libelleLocalisation,
    this.quartier,
    this.longitude,
    this.latitude,
    this.idPointLivraisonColis,
    this.contactRecuperation,
    this.idPointRecuperation,
    required this.listImgColis,
  });

  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
      'libelleLocalisation': libelleLocalisation,
      'quartier': quartier,
      'longitude': longitude,
      'latitude': latitude,
      'quantite': quantite,
      'countImage': countImage,
      'contactRecepteur': contactRecepteur,
      'contactRecuperation': contactRecuperation,
      'idPointRecuperation': idPointRecuperation,
      'valeurColis': valeurColis,
      'category': category,
      'idPointLivraisonColis': idPointLivraisonColis,
    };
  }
}
