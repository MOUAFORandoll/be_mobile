import 'dart:convert';

MedicamentModel MedicamentModelFromJson(String str) =>
    MedicamentModel.fromJson(json.decode(str));

String MedicamentModelToJson(MedicamentModel data) =>
    json.encode(data.toJson());

class MedicamentModel {
  MedicamentModel({
    required this.id,
    required this.libelle,
    required this.description,
    required this.status,
    required this.quantite,
  });

  final int id;
  final String libelle;
  final String description;
  final bool status;
  int quantite;

  factory MedicamentModel.fromJson(Map<String, dynamic> json) =>
      MedicamentModel(
        id: json['id'] == null ? null : json['id'],
        libelle: json['libelle'] == null ? null : json['libelle'],
        description: json['description'] == null ? null : json['description'],
        status: json['status'] == null ? null : json['status'],
        quantite: 1,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'libelle': libelle,
        'description': description,
        'status': status,
      };
}
