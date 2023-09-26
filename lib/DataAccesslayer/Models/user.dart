class User {
  int id;
  String name;
  String region;
  String phone;
  int roleId;
  DateTime createdAt;

  User({
    required this.id,
    required this.name,
    required this.region,
    required this.phone,
    required this.roleId,
    required this.createdAt,
  });

  factory User.fromApiJson(Map<String, dynamic> json) => User(
        id: json["user"]["id"],
        name: json["user"]["name"],
        region: json["user"]["region"],
        phone: json["user"]["phone"],
        roleId: json["user"]["role_id"],
        createdAt: DateTime.parse(json["user"]["created_at"]),
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        region: json["region"],
        phone: json["phone"],
        roleId: json["role_id"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "region": region,
        "phone": phone,
        "role_id": roleId,
        "created_at": createdAt.toIso8601String(),
      };
}
