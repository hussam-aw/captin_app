import 'package:captin_app/BussinessLayer/Controllers/orders_controller.dart';
import 'package:captin_app/Constants/get_routes.dart';
import 'package:captin_app/DataAccesslayer/Models/user_notification.dart';
import 'package:captin_app/DataAccesslayer/Repositories/notification_repo.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController {
  NotificationRepo repo = NotificationRepo();
  List<UserNotification> notifications = [];
  var isLoadingNotifications = false.obs;
  final ordersController = Get.find<OrdersController>();

  Future<void> getNotifications() async {
    isLoadingNotifications.value = true;
    notifications = await repo.getNotifications();
    isLoadingNotifications.value = false;
  }

  void navigateBasedOnNotificationType(UserNotification notification) {
    if (notification.type == 'order') {
      Get.toNamed(AppRoutes.orderInfoScreen, arguments: notification.data);
    } else if (notification.type == 'captain') {
      Get.toNamed(AppRoutes.captainScreen, arguments: notification.data);
    }
  }

  @override
  void onInit() {
    getNotifications();
    super.onInit();
  }
}
