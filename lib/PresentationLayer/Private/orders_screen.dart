import 'package:captin_app/BussinessLayer/Controllers/orders_controller.dart';
import 'package:captin_app/BussinessLayer/Controllers/user_controller.dart';
import 'package:captin_app/Constants/get_routes.dart';
import 'package:captin_app/Constants/ui_text_styles.dart';
import 'package:captin_app/PresentationLayer/Widgets/Private/order_box.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/loading_item.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/ord_appbar.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/ord_bottom_navigation_bar.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/ord_drawer.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/page_title.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/spacer_height.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/spacer_width.dart';
import 'package:captin_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});

  final ordersController = Get.put(OrdersController());
  final userController = Get.put(UserController());

  Widget buildOrdersList(orders) {
    return orders.isEmpty
        ? const Center(
            child: Text(
              'لا يوجد طلبات ',
              style: UITextStyle.medium,
            ),
          )
        : ListView.separated(
            itemBuilder: (context, index) {
              return OrderBox(
                order: orders[index],
                onTap: () {
                  Get.toNamed(AppRoutes.orderInfoScreen,
                      arguments: orders[index]);
                },
              );
            },
            separatorBuilder: (context, index) => spacerHeight(),
            itemCount: orders.length,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: ordAppBar(),
        drawer: OrdDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  GetBuilder<UserController>(
                      init: userController,
                      builder: (context) {
                        return Switch(
                          value: !MyApp.isAvailable,
                          onChanged: (value) {
                            userController.updateCaptainAvailability(!value);
                          },
                        );
                      }),
                  spacerWidth(),
                  const Text(
                    'غير جاهز لاستلام الطلبات',
                    style: UITextStyle.body,
                  ),
                ],
              ),
              const PageTitle(title: 'الطلبات'),
              spacerHeight(),
              Expanded(
                  child: RefreshIndicator(
                onRefresh: () => ordersController.getOrders(),
                child: Obx(() {
                  return ordersController.isLoadingOrders.value
                      ? Center(child: loadingItem(width: 100, isWhite: true))
                      : buildOrdersList(ordersController.orders);
                }),
              )),
            ],
          ),
        ),
        bottomNavigationBar: const OrdBottomNavigationBar(),
      ),
    );
  }
}
