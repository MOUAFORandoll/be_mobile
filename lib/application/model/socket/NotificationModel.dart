 
class NotificationModel {
  final int id;
  bool read;
  final String ? title;
  final String ? description;
  final String ? date;
  final String ? profile;
  final int ? type_notification;
  int short;

  NotificationModel({
    required this.id,
    required this.read,
    required this.title,
    required this.description,
    required this.profile,
    required this.date,
    required this.short,
    required this.type_notification,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json['id'] == null ? 0 : json['id'],
        read: json['read'] == null ? null : json['read'],
        title: json['title'] == null ? null : json['title'],
        description: json['description'] == null ? null : json['description'],
        profile: json['profile'] == null ? null : json['profile'],
        date: json['date'] == null ? null : json['date'],
        short: json['short'] == null ? 0 : json['short'],
        type_notification: json['type_notification'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'read': read,
        'title': title,
        'description': description,
        'profile': profile,
        'date': date,
        'short': short,
        'type_notification': type_notification,
      };
}
