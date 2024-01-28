 
class SocketDepotModel {
  final String message;
  final bool status;

  SocketDepotModel({
    required this.message,
    required this.status,
  });

  factory SocketDepotModel.fromJson(Map<String, dynamic> json) =>
      SocketDepotModel(
        status: json['status'] == null ? null : json['status'],
        message: json['message'] == null ? null : json['message'],
      );

  Map<String, dynamic> toJson() => {
        'status':   status,
        'message':  message,
      };
}
