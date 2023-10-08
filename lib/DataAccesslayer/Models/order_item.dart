class OrderItem {
  int mealId;
  int qty;
  num price;
  num total;
  String? specialOrder;

  OrderItem({
    required this.mealId,
    required this.qty,
    required this.price,
    required this.total,
    required this.specialOrder,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        mealId: json["meal"],
        qty: json["quantity"],
        price: json["price"],
        total: json['total_price'],
        specialOrder: json["special_order"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "meal": mealId,
        "quantity": qty,
        "price": price,
        "total_price": total,
        "special_order": specialOrder,
      };
}
