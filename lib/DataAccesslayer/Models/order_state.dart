class OrderState {
  int id;
  String name;
  int order;
  DateTime createdAt;
  DateTime updatedAt;

  OrderState({
    required this.id,
    required this.name,
    required this.order,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderState.fromJson(Map<String, dynamic> json) => OrderState(
        id: json["id"],
        name: json["name"],
        order: json["order"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "order": order,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
