class PlaceModel {
  PlaceModel({
    required this.type,
    required this.libelle,
  });
  late final int type;
  late final String libelle;

  PlaceModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    libelle = json['libelle'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['libelle'] = libelle;
    return _data;
  }
}
