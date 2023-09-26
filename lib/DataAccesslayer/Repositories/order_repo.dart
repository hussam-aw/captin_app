import 'dart:convert';

import 'package:captin_app/DataAccesslayer/Clients/order_client.dart';
import 'package:captin_app/DataAccesslayer/Models/order.dart';

class OrderRepo {
  OrderClient client = OrderClient();

  Future<List<Order>> getOrders() async {
    var response = await client.getOrders();
    if (response != "") {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<Order>((json) => Order.fromMap(json)).toList();
    }
    return [];
  }
}
