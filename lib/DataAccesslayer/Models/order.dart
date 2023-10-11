import 'package:captin_app/DataAccesslayer/Models/order_item.dart';

class Order {
  final int id;
  final num total;
  final String status;
  double lat;
  double long;
  final String address;
  List<OrderItem> details;
  final num deliveryFee;
  final String createdAt;

  Order({
    required this.id,
    required this.total,
    required this.status,
    required this.lat,
    required this.long,
    required this.address,
    required this.details,
    required this.deliveryFee,
    required this.createdAt,
  });

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] as int,
      total: map['total'] != "" ? map['total'] : 0.0,
      status: map['status'] ?? '',
      lat: map['lat'].toDouble(),
      long: map['long'].toDouble(),
      address: map['address'] ?? "",
      details: getDetailsList(map['details']),
      deliveryFee: map['delivery_fee'] ?? 0,
      createdAt: map['created_at'] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'status': status,
      'address': address,
      'delivery_fee': deliveryFee,
    };
  }

  static List<OrderItem> getDetailsList(details) {
    List<OrderItem> result = [];
    if (details != null) {
      for (int i = 0; i < details.length; i++) {
        result.add(OrderItem.fromJson(details[i]));
      }
    }
    return result;
  }
}
