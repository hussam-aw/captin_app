class User {
  int id;
  String name;
  String region;
  String phone;
  String address;
  int roleId;
  String avatar;
  DateTime createdAt;

  User({
    required this.id,
    required this.name,
    required this.region,
    required this.phone,
    required this.address,
    required this.roleId,
    required this.avatar,
    required this.createdAt,
  });

  factory User.fromApiJson(Map<String, dynamic> json) => User(
        id: json["user"]["id"],
        name: json["user"]["name"],
        region: json["user"]["region"],
        phone: json["user"]["phone"],
        address: json["user"]['address'] ?? '',
        roleId: json["user"]["role_id"],
        avatar: json["user"]["avatar"],
        createdAt: DateTime.parse(json["user"]["created_at"]),
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        region: json["region"] ?? '',
        phone: json["phone"],
        address: json['address'] ?? '',
        roleId: json["role_id"],
        avatar: json["avatar"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "region": region,
        "phone": phone,
        "address": address,
        "role_id": roleId,
        "avatar": avatar,
        "created_at": createdAt.toIso8601String(),
      };

  static bool getCounterCaptainAvailability(int state) {
    if (state == 1) {
      return true;
    }
    return false;
  }
}
