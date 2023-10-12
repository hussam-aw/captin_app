import 'package:get_storage/get_storage.dart';
import '../Models/user.dart';

class BoxClient {
  var box = GetStorage();
  Future<bool> getAuthState() async {
    if (await box.read('ord_captain_authed') != null) {
      return true;
    }
    return false;
  }

  Future<User> getAuthedUser() async {
    return User.fromJson(await box.read('ord_captain_userdata'));
  }

  Future<void> setAuthedUser(User user) async {
    await box.write('ord_captain_authed', true);
    await box.write('ord_captain_userdata', user.toJson());
  }

  Future<void> removeUserData() async {
    await box.remove('ord_captain_authed');
    await box.remove('ord_captain_userdata');
  }

  Future<void> clearStorage() async {
    await removeUserData();
  }
}
