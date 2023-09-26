import 'package:captin_app/Constants/get_routes.dart';
import 'package:captin_app/DataAccesslayer/Clients/box_client.dart';
import 'package:captin_app/main.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  BoxClient boxClient = BoxClient();

  Future<void> checkAuthed() async {
    bool authed = await boxClient.getAuthState();
    if (authed == true) {
      MyApp.appUser = await boxClient.getAuthedUser();
      Future.delayed(const Duration(seconds: 3))
          .then((value) => Get.offAndToNamed(AppRoutes.ordersScreen));
    } else {
      Future.delayed(const Duration(seconds: 3))
          .then((value) => Get.offAndToNamed(AppRoutes.loginScreen));
    }
  }

  @override
  void onInit() {
    checkAuthed();
    super.onInit();
  }
}
