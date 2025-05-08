class ConversationColisModel {
  ConversationColisModel({
    required this.urlRecuperation,
    required this.dateRecuperation,
    required this.urlLivraison,
    required this.dateLivraison,
  });
  late final String urlRecuperation;
  late final String dateRecuperation;
  late final String urlLivraison;
  late final String dateLivraison;

  ConversationColisModel.fromJson(Map<String, dynamic> json) {
    urlRecuperation = json['urlRecuperation'];
    dateRecuperation = json['dateRecuperation'];
    urlLivraison = json['urlLivraison'];
    dateLivraison = json['dateLivraison'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['urlRecuperation'] = urlRecuperation;

    _data['dateRecuperation'] = dateRecuperation;
    _data['urlLivraison'] = urlLivraison;
    _data['dateLivraison'] = dateLivraison;

    return _data;
  }
}
