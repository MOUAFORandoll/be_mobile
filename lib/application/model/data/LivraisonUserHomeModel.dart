class LivraisonUserHomeModel {
  final int id;
  final String libelle;
  final String description;
  final String montant;
  final String status;
  final int? status_int;
  final String ville;

  LivraisonUserHomeModel({
    required this.id,
    required this.libelle,
    required this.description,
    required this.montant,
    required this.status,
    required this.status_int,
    required this.ville,
  });

  factory LivraisonUserHomeModel.fromJson(Map<String, dynamic> json) {
    return LivraisonUserHomeModel(
      id: json['id'],
      libelle: json['libelle'],
      ville: json['ville'],
      description: json['description'],
      montant: json['montant'].toString(),
      status: json['status'],
      status_int: json['status_int'],
    );
  }
}
