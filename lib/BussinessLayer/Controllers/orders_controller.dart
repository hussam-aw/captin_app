import 'package:captin_app/DataAccesslayer/Models/order.dart';
import 'package:captin_app/DataAccesslayer/Repositories/order_repo.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  OrderRepo orderRepo = OrderRepo();
  List<Order> orders = [];
  var isLoadingOrders = false.obs;
  var ordersReceivingState = true.obs;

  Future<void> getOrders() async {
    isLoadingOrders.value = true;
    orders = await orderRepo.getOrders();
    isLoadingOrders.value = false;
  }

  void toggleOrdersReceivingState() {
    ordersReceivingState.value = !ordersReceivingState.value;
  }

  @override
  void onInit() async {
    await getOrders();
    super.onInit();
  }
}
