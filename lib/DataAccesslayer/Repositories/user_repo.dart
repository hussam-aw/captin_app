import 'dart:convert';

import 'package:captin_app/DataAccesslayer/Clients/user_client.dart';
import 'package:captin_app/DataAccesslayer/Models/user.dart';

class UserRepo {
  UserClient client = UserClient();

  Future<User?> login(phone, password) async {
    var data = await client.login(phone, password);
    if (data != null) {
      return User.fromApiJson(jsonDecode(data));
    }
    return null;
  }
}
