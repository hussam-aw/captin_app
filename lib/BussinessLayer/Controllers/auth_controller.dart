import 'package:captin_app/BussinessLayer/Controllers/user_controller.dart';
import 'package:captin_app/Constants/get_routes.dart';
import 'package:captin_app/DataAccesslayer/Clients/box_client.dart';
import 'package:captin_app/DataAccesslayer/Models/user.dart';
import 'package:captin_app/DataAccesslayer/Repositories/user_repo.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/snackbars.dart';
import 'package:captin_app/main.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserRepo userRepo = UserRepo();
  BoxClient boxClient = BoxClient();
  var logging = false.obs;
  final userController = Get.put(UserController());

  Future<void> login() async {
    logging.value = true;
    if (phoneNumberController.value.text.isNotEmpty &&
        passwordController.value.text.isNotEmpty) {
      User? user = await userRepo.login(
          phoneNumberController.value.text, passwordController.value.text);
      if (user != null) {
        MyApp.appUser = user;
        await boxClient.setAuthedUser(user);
        MyApp.isAvailable = await userController.getCaptainAvailability();
        SnackBars.showSuccess("${'أهلاً بك'}${user.name}");
        Get.toNamed(AppRoutes.ordersScreen);
      } else {
        SnackBars.showWarning('بياناتك لا تتطابق مع سجلاتنا');
      }
    } else {
      SnackBars.showWarning('يرجى تعبئة الحقول المطلوبة للمتابعة');
    }
    logging.value = false;
  }

  Future<void> logout() async {
    await boxClient.clearStorage();
    MyApp.appUser = null;
    Get.offAllNamed(AppRoutes.loginScreen);
  }
}
