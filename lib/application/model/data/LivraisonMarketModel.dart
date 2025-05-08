import 'package:BabanaExpress/application/model/exportmodel.dart';

class LivraisonMarketModel {
  int id;
  String libelle;
  String description;
  String contactEmetteur;
  String ville;
  String lienDeLivraison;
  int quantite;
  String montant;
  int status;
  List<ProduitModel> produits;
  String initiatedUser;
  int? service_id;
  String service;
  String date;
  Livreur? livreur;

  LivraisonMarketModel({
    required this.id,
    required this.libelle,
    required this.description,
    required this.contactEmetteur,
    required this.ville,
    required this.lienDeLivraison,
    required this.quantite,
    required this.montant,
    required this.status,
    required this.produits,
    required this.initiatedUser,
    required this.service_id,
    required this.service,
    required this.date,
    this.livreur,
  });

  factory LivraisonMarketModel.fromJson(Map<String, dynamic> json) {
    List<ProduitModel> produits = List<ProduitModel>.from(
      json['produits'].map((produit) => ProduitModel.fromJson(produit)),
    );

    return LivraisonMarketModel(
      id: json['id'],
      libelle: json['libelle'],
      description: json['description'],
      contactEmetteur: json['contactEmetteur'],
      ville: json['ville'],
      lienDeLivraison: json['lienDeLivraison'],
      quantite: json['quantite'],
      montant: json['montant'].toString(),
      status: json['status'],
      produits: produits,
      initiatedUser: json['initiatedUser'],
      service_id: json['service_id'],
      service: json['service'],
      date: json['date'],
      livreur:
          json['livreur'] == null ? null : Livreur.fromJson(json['livreur']),
    );
  }
}
