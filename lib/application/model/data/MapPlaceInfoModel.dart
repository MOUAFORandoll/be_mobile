class MapPlaceInfoModel {
  MapPlaceInfoModel({
    required this.ville,
    required this.quartier,
    this.longitude,
    this.latitude,
  });
  late final String ville;
  late final String quartier;
  var longitude;
  var latitude;

  MapPlaceInfoModel.fromJson(Map<String, dynamic> json) {
    ville = json['ville'];
    quartier = json['quartier'];
    latitude = json['latitude'] == null
        ? null
        : double.parse(json['latitude'].toString());
    longitude = json['longitude'] == null
        ? null
        : double.parse(json['longitude'].toString());
  }
MapPlaceInfoModel copyWith({
    String? ville,
    String? quartier,
    double? longitude,
    double? latitude,
  }) {
    return MapPlaceInfoModel(
      ville: ville ?? this.ville,
      quartier: quartier ?? this.quartier,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
    );
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['ville'] = ville;

    _data['quartier'] = quartier;

    return _data;
  }
}
