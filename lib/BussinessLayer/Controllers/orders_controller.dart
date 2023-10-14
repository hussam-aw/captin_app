import 'package:captin_app/BussinessLayer/Controllers/meals_controller.dart';
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
  var orderDeliveredStatus = false.obs;
  var changingOrderStatus = false.obs;
  final mealsController = Get.put(MealsController());
  final isSelectingOrder = false.obs;

  Future<void> getOrderStates() async {
    orderStates = await orderRepo.getOrderStates();
  }

  Future<void> getOrders() async {
    isLoadingOrders.value = true;
    orders = await orderRepo.getOrders();
    isLoadingOrders.value = false;
  }

  Future<void> changeOrderStatus(orderId, statusId) async {
    changingOrderStatus.value = true;
    Get.back();
    Order? order = await orderRepo.changeOrderStatus(orderId, statusId);
    if (order != null) {
      await getOrders();
      changingOrderStatus.value = false;
      Get.back();
      SnackBars.showSuccess('تم تغيير حالة الطلب');
    } else {
      SnackBars.showError('حدث خطأ أثناء تغيير حالة الطلب');
    }
  }

  Future<void> changeOrderStatusToDelivered(orderId) async {
    orderDeliveredStatus.value = true;
    Order? order = await orderRepo.changeOrderStatusToDelivered(orderId);
    if (order != null) {
      await getOrders();
      orderDeliveredStatus.value = false;
      Get.back();
      SnackBars.showSuccess('تم توصيل الطلب');
    } else {
      SnackBars.showError('حدث خطأ أثناء تغيير حالة الطلب');
    }
  }

  Future<void> selectOrder(orderId) async {
    isSelectingOrder.value = true;
    bool isOrderSelected = await orderRepo.selectOrder(orderId);
    if (isOrderSelected) {
      await getOrders();
      isSelectingOrder.value = false;
      Get.back();
      SnackBars.showSuccess('تم قبول الطلب');
    } else {
      SnackBars.showError('حدث خطأ أثناء قبول الطلب الطلب');
    }
  }

  @override
  void onInit() async {
    await mealsController.getMeals();
    await getOrders();
    await getOrderStates();
    super.onInit();
  }
}
