class LivraisonModel {
  int id;
  String libelle;
  String description;
  String contactEmetteur;
  String contactRecepteur;
  String lienDeLivraison;
  String valeur;
  String montant;
  String quantite;
  int status;
  List<Fichier> fichier;
  String categorie;
  String initiatedUser;
  String service;
  String date;
  dynamic livreur;

  LivraisonModel({
    required this.id,
    required this.libelle,
    required this.description,
    required this.contactEmetteur,
    required this.contactRecepteur,
    required this.lienDeLivraison,
    required this.valeur,
    required this.montant,
    required this.quantite,
    required this.status,
    required this.fichier,
    required this.categorie,
    required this.initiatedUser,
    required this.service,
    required this.date,
    required this.livreur,
  });

  factory LivraisonModel.fromJson(Map<String, dynamic> json) {
    return LivraisonModel(
      id: json['id'],
      libelle: json['libelle'],
      quantite: json['quantite']  .toString(),
      description: json['description'],
      contactEmetteur: json['contactEmetteur'],
      contactRecepteur: json['contactRecepteur'],
      lienDeLivraison: json['lienDeLivraison'],
      valeur: json['valeur'],
      montant: json['montant'],
      status: json['status'],
      fichier:
          List<Fichier>.from(json['fichier'].map((x) => Fichier.fromJson(x))),
      categorie: json['categorie'],
      initiatedUser: json['initiatedUser'],
      service: json['service'],
      date: json['date'],
      livreur: json['livreur'],
    );
  }
}

class Fichier {
  String src;

  Fichier({required this.src});

  factory Fichier.fromJson(Map<String, dynamic> json) {
    return Fichier(
      src: json['src'],
    );
  }
}
