class MapPlaceInfoModel {
  MapPlaceInfoModel({
    required this.ville,
    required this.quartier,
  });
  late final String ville;
  late final String quartier;

  MapPlaceInfoModel.fromJson(Map<String, dynamic> json) {
    ville = json['ville'];
    quartier = json['quartier'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['ville'] = ville;

    _data['quartier'] = quartier;

    return _data;
  }
}
