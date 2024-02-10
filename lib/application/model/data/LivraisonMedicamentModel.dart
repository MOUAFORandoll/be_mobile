import 'package:BabanaExpress/application/model/exportmodel.dart';

class LivraisonMedicamentModel {
  int id;
  String libelle;
  String description;
  String contactEmetteur;
  String ville;
  String lienDeLivraison;
  int quantite;
  String montant;
  int status;
  List<Medicament> medicaments;
  String initiatedUser;
  String service;
  String date;
  Livreur? livreur;

  LivraisonMedicamentModel({
    required this.id,
    required this.libelle,
    required this.description,
    required this.contactEmetteur,
    required this.ville,
    required this.lienDeLivraison,
    required this.quantite,
    required this.montant,
    required this.status,
    required this.medicaments,
    required this.initiatedUser,
    required this.service,
    required this.date,
    this.livreur,
  });

  factory LivraisonMedicamentModel.fromJson(Map<String, dynamic> json) {
    List<Medicament> medicaments = List<Medicament>.from(
      json['medicaments'].map((medicament) => Medicament.fromJson(medicament)),
    );

    return LivraisonMedicamentModel(
      id: json['id'],
      libelle: json['libelle'],
      description: json['description'],
      contactEmetteur: json['contactEmetteur'],
      ville: json['ville'],
      lienDeLivraison: json['lienDeLivraison'],
      quantite: json['quantite'],
      montant: json['montant'],
      status: json['status'],
      medicaments: medicaments,
      initiatedUser: json['initiatedUser'],
      service: json['service'],
      date: json['date'],
      livreur:
          json['livreur'] == null ? null : Livreur.fromJson(json['livreur']),
    );
  }
}

class Medicament {
  int id;
  String libelle;
  String description;
  bool status;

  Medicament({
    required this.id,
    required this.libelle,
    required this.description,
    required this.status,
  });

  factory Medicament.fromJson(Map<String, dynamic> json) {
    return Medicament(
      id: json['id'],
      libelle: json['libelle'],
      description: json['description'],
      status: json['status'],
    );
  }
}
