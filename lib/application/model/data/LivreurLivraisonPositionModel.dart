class LivreurLivraisonPositionModel {
  final int livraison_id;
  final List<PositionLiveur> positionLiveur;

  LivreurLivraisonPositionModel({
    required this.livraison_id,
    required this.positionLiveur,
  });

  factory LivreurLivraisonPositionModel.fromJson(Map<String, dynamic> json) {
    return LivreurLivraisonPositionModel(
      livraison_id: json['livraison_id'],
      positionLiveur: List<PositionLiveur>.from(json['positionLiveur']
          .map((positionLiveur) => PositionLiveur.fromJson(positionLiveur))),
    );
  }
}

class PositionLiveur {
  final double longitude;
  final double latitude;

  PositionLiveur({
    required this.longitude,
    required this.latitude,
  });

  factory PositionLiveur.fromJson(Map<String, dynamic> json) {
    return PositionLiveur(
      longitude: json['longitude'],
      latitude: json['latitude'],
    );
  }
}
