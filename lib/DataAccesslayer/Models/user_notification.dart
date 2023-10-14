import 'package:captin_app/DataAccesslayer/Models/order.dart';
import 'package:captin_app/DataAccesslayer/Models/user.dart';

class UserNotification {
  int id;
  String title;
  String subtitle;
  String type;
  dynamic data;
  String date;
  int userId;
  DateTime createdAt;

  UserNotification({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.data,
    required this.date,
    required this.userId,
    required this.createdAt,
  });

  factory UserNotification.fromJson(Map<String, dynamic> json) =>
      UserNotification(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        type: json["type"],
        data: json["type"] == 'order'
            ? Order.fromMap(json["data"])
            : User.fromJson(json["data"]),
        date: json["date"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "type": type,
        "data": data,
        "date": date,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
      };
}
