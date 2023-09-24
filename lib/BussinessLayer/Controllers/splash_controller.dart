import 'package:captin_app/Constants/get_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Future<void> checkAuthed() async {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Get.offAndToNamed(AppRoutes.loginScreen));
  }

  @override
  void onInit() {
    checkAuthed();
    super.onInit();
  }
}
