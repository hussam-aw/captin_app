class OrderItem {
  int mealId;
  int qty;
  num total;
  String? specialOrder;

  OrderItem({
    required this.mealId,
    required this.qty,
    required this.total,
    required this.specialOrder,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        mealId: json["product_id"],
        qty: json["quantity"],
        total: json['total_price'],
        specialOrder: json["special_order"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "product_id": mealId,
        "quantity": qty,
        "total_price": total,
        "special_order": specialOrder,
      };
}
