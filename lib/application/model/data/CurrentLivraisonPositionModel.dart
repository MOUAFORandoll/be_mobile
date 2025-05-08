class CurrentLivraisonPositionModel {
  final int livraison_id;
  final List<PositionColis> positionColis;

  CurrentLivraisonPositionModel({
    required this.livraison_id,
    required this.positionColis,
  });

  factory CurrentLivraisonPositionModel.fromJson(Map<String, dynamic> json) {
    return CurrentLivraisonPositionModel(
      livraison_id: json['livraison_id'],
      positionColis: List<PositionColis>.from(json['positionColis']
          .map((positionColis) => PositionColis.fromJson(positionColis))),
    );
  }
}

class PositionColis {
  final String libelle;
  final double longitude;
  final double latitude;

  PositionColis({
    required this.libelle,
    required this.longitude,
    required this.latitude,
  });

  factory PositionColis.fromJson(Map<String, dynamic> json) {
    return PositionColis(
      libelle: json['libelle'],
      longitude: json['longitude'],
      latitude: json['latitude'],
    );
  }
}
