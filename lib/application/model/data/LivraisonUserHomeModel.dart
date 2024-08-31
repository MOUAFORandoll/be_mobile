class LivraisonUserHomeModel {
  final int id;
  final String libelle;
  final String description;
  final String ville;
  final int montant;
  final int statusInt;
  final DateTime date;
  final String status;
  final PointColis pointRecuperationColis;
  final List<PointLivraisonColis> pointLivraisonColis;

  LivraisonUserHomeModel({
    required this.id,
    required this.libelle,
    required this.description,
    required this.ville,
    required this.montant,
    required this.statusInt,
    required this.date,
    required this.status,
    required this.pointRecuperationColis,
    required this.pointLivraisonColis,
  });

  factory LivraisonUserHomeModel.fromJson(Map<String, dynamic> json) {
    return LivraisonUserHomeModel(
      id: json['id'],
      libelle: json['libelle'],
      description: json['description'],
      ville: json['ville'],
      montant: json['montant'],
      statusInt: json['status_int'],
      date: DateTime.parse(json['date']['date']),
      status: json['status'],
      pointRecuperationColis:
          PointColis.fromJson(json['point_recuperation_colis']),
      pointLivraisonColis: (json['point_livraison_colis'] as List)
          .map((item) => PointLivraisonColis.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'libelle': libelle,
      'description': description,
      'ville': ville,
      'montant': montant,
      'status_int': statusInt,
      'date': date.toIso8601String(),
      'status': status,
      'point_recuperation_colis': pointRecuperationColis.toJson(),
      'point_livraison_colis':
          pointLivraisonColis.map((item) => item.toJson()).toList(),
    };
  }
}

class PointColis {
  final String libellePoint;
  final double longitude;
  final double latitude;

  PointColis({
    required this.libellePoint,
    required this.longitude,
    required this.latitude,
  });

  factory PointColis.fromJson(Map<String, dynamic> json) {
    return PointColis(
      libellePoint: json['libelle_point'],
      longitude: double.parse(json['longitude'].toString()),
      latitude: double.parse(json['latitude'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'libelle_point': libellePoint,
      'longitude': longitude,
      'latitude': latitude,
    };
  }
}

class Livraison {
  final int id;
  final String libelle;
  final String description;
  final String ville;
  final int montant;
  final int statusInt;
  final DateTime date;
  final String status;
  final Point pointRecuperationColis;
  final List<PointLivraisonColis> pointLivraisonColis;

  Livraison({
    required this.id,
    required this.libelle,
    required this.description,
    required this.ville,
    required this.montant,
    required this.statusInt,
    required this.date,
    required this.status,
    required this.pointRecuperationColis,
    required this.pointLivraisonColis,
  });

  factory Livraison.fromJson(Map<String, dynamic> json) {
    return Livraison(
      id: json['id'],
      libelle: json['libelle'],
      description: json['description'],
      ville: json['ville'],
      montant: json['montant'],
      statusInt: json['status_int'],
      date: DateTime.parse(json['date']['date']),
      status: json['status'],
      pointRecuperationColis: Point.fromJson(json['point_recuperation_colis']),
      pointLivraisonColis: (json['point_livraison_colis'] as List)
          .map((item) => PointLivraisonColis.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'libelle': libelle,
      'description': description,
      'ville': ville,
      'montant': montant,
      'status_int': statusInt,
      'date': {
        'date': date.toIso8601String(),
        'timezone_type': 3,
        'timezone': 'UTC',
      },
      'status': status,
      'point_recuperation_colis': pointRecuperationColis.toJson(),
      'point_livraison_colis':
          pointLivraisonColis.map((item) => item.toJson()).toList(),
    };
  }
}

class Point {
  final String libellePoint;
  final double longitude;
  final double latitude;

  Point({
    required this.libellePoint,
    required this.longitude,
    required this.latitude,
  });

  factory Point.fromJson(Map<String, dynamic> json) {
    return Point(
      libellePoint: json['libelle_point'],
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'libelle_point': libellePoint,
      'longitude': longitude,
      'latitude': latitude,
    };
  }
}

class PointLivraisonColis {
  final List<ImageU> img;
  final String libelleColis;
  final String libellePoint;
  final double longitude;
  final double latitude;
  final int statusLivraisonColis;

  PointLivraisonColis({
    required this.img,
    required this.libelleColis,
    required this.libellePoint,
    required this.longitude,
    required this.latitude,
    required this.statusLivraisonColis,
  });

  factory PointLivraisonColis.fromJson(Map<String, dynamic> json) {
    return PointLivraisonColis(
      img: (json['img'] as List).map((item) => ImageU.fromJson(item)).toList(),
      libelleColis: json['libelle_colis'],
      libellePoint: json['libelle_point'],
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      statusLivraisonColis: json['statusLivraisonColis'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'img': img.map((item) => item.toJson()).toList(),
      'libelle_colis': libelleColis,
      'libelle_point': libellePoint,
      'longitude': longitude,
      'latitude': latitude,
      'statusLivraisonColis': statusLivraisonColis,
    };
  }
}

class ImageU {
  final String src;

  ImageU({required this.src});

  factory ImageU.fromJson(Map<String, dynamic> json) {
    return ImageU(
      src: json['src'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'src': src,
    };
  }
}
