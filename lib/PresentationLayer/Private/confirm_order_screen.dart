import 'package:captin_app/BussinessLayer/Controllers/orders_controller.dart';
import 'package:captin_app/Constants/ui_colors.dart';
import 'package:captin_app/Constants/ui_text_styles.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/accept_button.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/ord_appbar.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/ord_drawer.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/page_title.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/snackbars.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/spacer_height.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmOrderScreen extends StatelessWidget {
  ConfirmOrderScreen({super.key});

  final ordersController = Get.put(OrdersController());

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const PageTitle(title: 'هل تريد الموافقة على الطلب؟'),
              spacerHeight(height: 22),
              Expanded(
                child: Column(
                  children: [
                    Obx(() {
                      return AcceptButton(
                        text: 'موافقة',
                        onPressed: () {
                          ordersController.selectOrder(69);
                        },
                        isLoading: ordersController.isSelectingOrder.value,
                      );
                    }),
                    spacerHeight(),
                    AcceptButton(
                      text: 'رفض',
                      backgroundColor: UIColors.white,
                      textStyle: UITextStyle.medium.copyWith(
                        color: UIColors.red,
                      ),
                      onPressed: () {
                        Get.back();
                        SnackBars.showError('تم رفض الطلب');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
