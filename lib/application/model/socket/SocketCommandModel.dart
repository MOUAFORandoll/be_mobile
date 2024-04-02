 
class SocketCommandModel {
  final int id;
  final String pdf;
  final String codeClient;
  final String codeCommande;
  final String date;
  final String message;
  final bool status;

  SocketCommandModel({
    required this.id,
    required this.pdf,
    required this.codeClient,
    required this.codeCommande,
    required this.date,
    required this.message,
    required this.status,
  });

  factory SocketCommandModel.fromJson(Map<String, dynamic> json) =>
      SocketCommandModel(
        id: json['id'] == null ? null : json['id'],
        pdf: json['pdf'] == null ? null : json['pdf'],
        codeClient: json['codeClient'] == null ? null : json['codeClient'],
        codeCommande:
            json['codeCommande'] == null ? null : json['codeCommande'],
        status: json['status'] == null ? null : json['status'],
        message: json['message'] == null ? null : json['message'],
        date: json['date'],
      );

  Map<String, dynamic> toJson() => {
        'id':  id,
        'pdf': pdf,
        'codeClient':  codeClient,
        'status':   status,
        'codeCommande':   codeCommande,
        'message':   message,
        'date': date,
      };
}
