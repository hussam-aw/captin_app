import 'package:captin_app/DataAccesslayer/Models/order.dart';
import 'package:captin_app/DataAccesslayer/Models/order_state.dart';
import 'package:captin_app/DataAccesslayer/Repositories/order_repo.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/snackbars.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  OrderRepo orderRepo = OrderRepo();
  List<Order> orders = [];
  List<OrderState> orderStates = [];
  var isLoadingOrders = false.obs;
  var ordersReceivingState = true.obs;

  Future<void> getOrderStates() async {
    orderStates = await orderRepo.getOrderStates();
  }

  Future<void> getOrders() async {
    isLoadingOrders.value = true;
    orders = await orderRepo.getOrders();
    isLoadingOrders.value = false;
  }

  void toggleOrdersReceivingState() {
    ordersReceivingState.value = !ordersReceivingState.value;
  }

  Future<void> changeOrderStatus(orderId, statusId) async {
    Order? order = await orderRepo.changeOrderStatus(orderId, statusId);
    if (order != null) {
      await getOrders();
      Get.back(closeOverlays: true);
      SnackBars.showSuccess('تم تغيير حالة الطلب');
    } else {
      SnackBars.showError('حدث خطأ أثناء تغيير حالة الطلب');
    }
  }

  @override
  void onInit() async {
    await getOrders();
    await getOrderStates();
    super.onInit();
  }
}
