import 'dart:convert';

import 'package:captin_app/DataAccesslayer/Clients/order_client.dart';
import 'package:captin_app/DataAccesslayer/Models/order.dart';
import 'package:captin_app/DataAccesslayer/Models/order_state.dart';

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

  Future<List<OrderState>> getOrderStates() async {
    var response = await client.getOrderStates();
    if (response != "") {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed
          .map<OrderState>((json) => OrderState.fromJson(json))
          .toList();
    }
    return [];
  }

  Future<Order?> changeOrderStatus(orderId, statusId) async {
    var response = await client.changeOrderStatus(orderId, statusId);
    if (response != "") {
      final parsed = json.decode(response);
      return Order.fromMap(parsed);
    }
    return null;
  }
}
