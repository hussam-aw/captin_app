import 'package:captin_app/BussinessLayer/Helpers/local_notification_helper.dart';
import 'package:captin_app/DataAccesslayer/Clients/box_client.dart';
import 'package:captin_app/DataAccesslayer/Repositories/user_repo.dart';
import 'package:captin_app/main.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  UserRepo userRepo = UserRepo();
  BoxClient boxClient = BoxClient();

  bool getCounterCaptainAvailability(int state) {
    if (state == 1) {
      return true;
    }
    return false;
  }

  Future<void> updateCaptainAvailability(state) async {
    int counterState = state == true ? 1 : 0;
    bool isStateUpdated =
        await userRepo.updateCaptainAvailability(counterState);
    if (isStateUpdated) {
      MyApp.isAvailable = state;
      update();
      if (state) {
        await LocalNotificationHelper.showNotification(
          0,
          'Captain App',
          'الكابتن جاهز لاستلام الطلبات',
        );
      }
    }
  }

  Future<bool> getCaptainAvailability() async {
    int? state = await userRepo.getCaptainAvailability();
    if (state != null) {
      return getCounterCaptainAvailability(state);
    }
    return false;
  }
}
