 
class VilleModel {
  VilleModel({
    required this.id,
    required this.libelle,
  });

  final int id;
  final String libelle;

  factory VilleModel.fromJson(Map<String, dynamic> json) => VilleModel(
        id: json['id'] == null ? null : json['id'],
        libelle: json['libelle'] == null ? null : json['libelle'],
      );

  Map<String, dynamic> toJson() => {
        'id':  id,
        'libelle':   libelle,
      };
}
