// To parse this JSON data, do
//
//     final PointLivraisonModel = PointLivraisonModelFromJson(jsonString);

class PointLivraisonModel {
  PointLivraisonModel({
    this.id,
    required this.libelle,
    required this.ville,
    required this.quartier,
    this.image,
    this.longitude,
    this.latitude,
  });

  final int? id;
  final String libelle;
  final String ville;
  final String quartier;
  final String? image;
  final longitude;
  final latitude;

  factory PointLivraisonModel.fromJson(Map<String, dynamic> json) =>
      PointLivraisonModel(
        id: json['id'] == null ? null : json['id'],
        latitude: json['latitude'] == null
            ? null
            : double.parse(json['latitude'].toString()),
        longitude: json['longitude'] == null
            ? null
            : double.parse(json['longitude'].toString()),
        libelle: json['libelle'] == null ? null : json['libelle'],
        ville: json['ville'] == null ? null : json['ville'],
        quartier:
            (json['quartier'] == null ? null : json['quartier']).toString(),
        image: json['image'] == null ? null : json['image'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'ville': ville,
        'libelle': libelle,
        'quartier': quartier,
        'image': image,
        'latitude': latitude,
        'longitude': longitude,
      };
}
