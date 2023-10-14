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

  Future<bool> updateCaptainAvailability(state) async {
    var data = await client.updateCaptainAvailability(state);
    if (data != null) {
      return true;
    }
    return false;
  }

  Future<int?> getCaptainAvailability() async {
    var data = await client.getCaptainAvailability();
    if (data != null) {
      return int.parse(data);
    }
    return null;
  }

  Future<User?> updateUserInfo(userName, mobilePhone, password, avatar) async {
    var response =
        await client.updateUserInfo(userName, mobilePhone, password, avatar);
    if (response != null) {
      final parsed = json.decode(response);
      return User.fromJson(parsed);
    }
    return null;
  }
}
