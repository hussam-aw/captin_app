import 'dart:convert';

import 'package:captin_app/Constants/api_links.dart';
import 'package:captin_app/main.dart';
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

  Future<dynamic> updateCaptainAvailability(state) async {
    var response =
        await http.post(Uri.parse("$baseUrl$updateAvailableStateLink"),
            body: jsonEncode(<String, dynamic>{
              "available": state,
              "user_id": MyApp.appUser!.id,
            }),
            headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  Future<dynamic> getCaptainAvailability() async {
    var response = await http
        .get(Uri.parse('$baseUrl$getAvailableStateLink/${MyApp.appUser!.id}'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  Future<dynamic> updateUserInfo(
      userName, mobilePhone, password, avatar) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('$baseUrl$updateProfileLink'));
    request.fields.addAll({
      'name': userName.toString(),
      'phone': mobilePhone.toString(),
      'password': password.toString(),
      'user_id': MyApp.appUser!.id.toString(),
    });

    if (avatar.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath('avatar', avatar));
    }

    http.StreamedResponse response = await request.send();
    //print(await response.stream.bytesToString());
    if (response.statusCode == 201) {
      return await response.stream.bytesToString();
    } else {
      return null;
    }
  }
}
