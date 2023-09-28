import 'dart:convert';

import 'package:captin_app/Constants/api_links.dart';
import 'package:captin_app/main.dart';
import 'package:http/http.dart' as http;

class OrderClient {
  Future<dynamic> getOrders() async {
    var response =
        await http.get(Uri.parse('$baseUrl$ordersLink/${MyApp.appUser!.id}'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  Future<dynamic> getOrderStates() async {
    var response = await http.get(Uri.parse('$baseUrl$orderStatesLink'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  Future<dynamic> changeOrderStatus(orderId, statusId) async {
    var response = await http.post(Uri.parse('$baseUrl$editStatusOrderLink'),
        body: jsonEncode(<String, dynamic>{
          "status_id": statusId,
          "order_id": orderId,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 201) {
      return response.body;
    } else {
      return null;
    }
  }

  Future<dynamic> changeOrderStatusToDelivered(orderId) async {
    var response = await http.post(Uri.parse('$baseUrl$editStatusOrderLink'),
        body: jsonEncode(<String, dynamic>{
          "order_id": orderId,
          "is_done": 1,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (response.statusCode == 201) {
      return response.body;
    } else {
      return null;
    }
  }
}
