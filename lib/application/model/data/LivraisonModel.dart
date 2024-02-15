class LivraisonModel {
  final int id;
  final String libelle;
  final String description;
  final String contactEmetteur;
  final String lienDeLivraison;
  final int quantite;
  final String montant;
  final int status;
  final List<ColisUser> colis;
  final String initiatedUser;
  final String service;
  final String date;
  final Livreur? livreur;

  LivraisonModel({
    required this.id,
    required this.libelle,
    required this.description,
    required this.contactEmetteur,
    required this.lienDeLivraison,
    required this.quantite,
    required this.montant,
    required this.status,
    required this.colis,
    required this.initiatedUser,
    required this.service,
    required this.date,
    required this.livreur,
  });

  factory LivraisonModel.fromJson(Map<String, dynamic> json) {
    return LivraisonModel(
      id: json['id'],
      libelle: json['libelle'],
      description: json['description'],
      contactEmetteur: json['contactEmetteur'],
      lienDeLivraison: json['lienDeLivraison'],
      quantite: json['quantite'],
      montant: json['montant'].toString(),
      status: json['status'],
      colis: List<ColisUser>.from(
          json['colis'].map((colis) => ColisUser.fromJson(colis))),
      initiatedUser: json['initiatedUser'],
      service: json['service'],
      date: json['date'],
      livreur:
          json['livreur'] != null ? Livreur.fromJson(json['livreur']) : null,
    );
  }
}

class ColisUser {
  final String nom;
  final int valeurColis;
  final int statusLivraisonColis;
  final String category;
  final String contact_recepteur;
  final String code_recuperation_colis;
  final String code_livraison_colis;
  final int quantite;
  final List<ImageColis> images;

  ColisUser({
    required this.nom,
    required this.valeurColis,
    required this.statusLivraisonColis,
    required this.category,
    required this.contact_recepteur,
    required this.code_recuperation_colis,
    required this.code_livraison_colis,
    required this.quantite,
    required this.images,
  });

  factory ColisUser.fromJson(Map<String, dynamic> json) {
    return ColisUser(
      nom: json['nom'],
      valeurColis: json['valeurColis'],
      statusLivraisonColis: json['statusLivraisonColis'],
      category: json['category'],
      contact_recepteur: json['contact_recepteur'],
      code_recuperation_colis: json['code_recuperation_colis'].toString(),
      code_livraison_colis: json['code_livraison_colis'].toString(),
      quantite: json['quantite'],
      images: List<ImageColis>.from(
          json['images'].map((image) => ImageColis.fromJson(image))),
    );
  }
}

class ImageColis {
  final String src;

  ImageColis({
    required this.src,
  });

  factory ImageColis.fromJson(Map<String, dynamic> json) {
    return ImageColis(
      src: json['src'],
    );
  }
}

class Livreur {
  int id;
  String nom;
  String prenom;
  String? email;
  String phone;
  bool status;
  int typeUser;
  String dateCreated;

  Livreur({
    required this.id,
    required this.nom,
    required this.prenom,
    this.email,
    required this.phone,
    required this.status,
    required this.typeUser,
    required this.dateCreated,
  });

  factory Livreur.fromJson(Map<String, dynamic> json) {
    return Livreur(
      id: json['id'],
      nom: json['nom'],
      prenom: json['prenom'],
      email: json['email'],
      phone: json['phone'],
      status: json['status'],
      typeUser: json['typeUser'],
      dateCreated: json['dateCreated'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'phone': phone,
      'status': status,
      'typeUser': typeUser,
      'dateCreated': dateCreated,
    };
  }
}
