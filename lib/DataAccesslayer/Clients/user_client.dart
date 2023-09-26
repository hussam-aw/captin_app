import 'dart:convert';

import 'package:captin_app/Constants/api_links.dart';
import 'package:http/http.dart' as http;

class UserClient {
  Future<dynamic> login(phone, password) async {
    var response = await http.post(Uri.parse("$baseUrl$loginLink"),
        body:
            jsonEncode(<String, dynamic>{"phone": phone, "password": password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
