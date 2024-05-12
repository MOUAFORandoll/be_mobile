class MessageModel {
  MessageModel({
    required this.id,
    required this.is_emetteur,
    required this.message,
  });
  late final int id;
  late final bool is_emetteur;
  late final String message;
  late final String dateSend;
  late final String heureSend;
  late final String dateRead;
  late final String heureRead;

  MessageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    is_emetteur = json['is_emetteur'];
    message = json['message'];
    dateSend = json['dateSend'];
    heureSend = json['heureSend'];
    dateRead = json['dateRead'];
    heureRead = json['heureRead'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['is_emetteur'] = is_emetteur;
    _data['message'] = message;
    _data['dateSend'] = dateSend;
    _data['heureSend'] = heureSend;
    _data['dateRead'] = dateRead;
    _data['heureRead'] = heureRead;

    return _data;
  }
}
