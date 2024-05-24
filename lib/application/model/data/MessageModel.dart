class MessageModel {
  int id;
  bool isEmetteur;
  String message;
  String dateSend;
  String heureSend;
  String? dateRead; // Optional since it can be null
  String? heureRead; // Optional since it can be null

  MessageModel({
    required this.id,
    required this.isEmetteur,
    required this.message,
    required this.dateSend,
    required this.heureSend,
    this.dateRead,
    this.heureRead,
  });

  // Convert a JSON map to an instance of MessageModel
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      isEmetteur: json['is_emetteur'],
      message: json['message'],
      dateSend: json['dateSend'],
      heureSend: json['heureSend'],
      dateRead: json['dateRead'],
      heureRead: json['heureRead'],
    );
  }

  // Convert an instance of MessageModel to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'is_emetteur': isEmetteur,
      'message': message,
      'dateSend': dateSend,
      'heureSend': heureSend,
      'dateRead':
          dateRead, // No need to check for null because Dart's JSON encoder handles it
      'heureRead': heureRead,
    };
  }
}
