import 'package:captin_app/BussinessLayer/Controllers/user_controller.dart';
import 'package:captin_app/Constants/get_routes.dart';
import 'package:captin_app/DataAccesslayer/Clients/box_client.dart';
import 'package:captin_app/main.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  BoxClient boxClient = BoxClient();
  final userController = Get.put(UserController());

  Future<void> checkAuthed() async {
    bool authed = await boxClient.getAuthState();
    if (authed == true) {
      MyApp.appUser = await boxClient.getAuthedUser();
      MyApp.isAvailable = await userController.getCaptainAvailability();
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
