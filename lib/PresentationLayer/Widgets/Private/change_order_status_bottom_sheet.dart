import 'package:captin_app/BussinessLayer/Controllers/orders_controller.dart';
import 'package:captin_app/Constants/ui_colors.dart';
import 'package:captin_app/Constants/ui_styles.dart';
import 'package:captin_app/Constants/ui_text_styles.dart';
import 'package:captin_app/DataAccesslayer/Models/order.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/spacer_height.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeOrderStatusBottomSheet extends StatelessWidget {
  ChangeOrderStatusBottomSheet({super.key, required this.order});

  final ordersController = Get.find<OrdersController>();
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: Get.width * .8,
        decoration: const BoxDecoration(
          borderRadius: raduis32Top,
          color: UIColors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: Column(
            children: [
              Expanded(
                child: Text(
                  ':اختر الحالة',
                  style: UITextStyle.heading.copyWith(
                    color: UIColors.lightDeepBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              spacerHeight(height: 20),
              Expanded(
                flex: 3,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        ordersController.changeOrderStatus(
                          order.id,
                          ordersController.orderStates[index].id,
                        );
                      },
                      child: Text(
                        ordersController.orderStates[index].name,
                        textAlign: TextAlign.center,
                        style: UITextStyle.medium.copyWith(
                          color: UIColors.lightGrey,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      spacerHeight(height: 30),
                  itemCount: ordersController.orderStates.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
