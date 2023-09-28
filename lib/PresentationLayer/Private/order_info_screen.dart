import 'package:captin_app/Constants/ui_colors.dart';
import 'package:captin_app/Constants/ui_text_styles.dart';
import 'package:captin_app/DataAccesslayer/Models/order.dart';
import 'package:captin_app/PresentationLayer/Widgets/Private/change_order_status_bottom_sheet.dart';
import 'package:captin_app/PresentationLayer/Widgets/Private/order_info_box.dart';
import 'package:captin_app/PresentationLayer/Widgets/Private/order_item_box.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/accept_button.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/ord_appbar.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/ord_drawer.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/page_title.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/section_title.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/spacer_height.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class OrderInfoScreen extends StatelessWidget {
  OrderInfoScreen({super.key});

  final Order order = Get.arguments;

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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PageTitle(title: 'معلومات الطلب'),
                      const Divider(color: UIColors.veryDarkGrey),
                      spacerHeight(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            OrderInfoBox(order: order),
                            const Icon(FontAwesomeIcons.phone, size: 50),
                          ],
                        ),
                      ),
                      spacerHeight(),
                      const Divider(color: UIColors.veryDarkGrey),
                      spacerHeight(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SectionTitle(title: 'عنوان الطلب'),
                            spacerHeight(),
                            Text(
                              order.address,
                              style: UITextStyle.body,
                            ),
                            spacerHeight(),
                            AcceptButton(
                              text: 'موقع الطلب على الخريطة',
                              backgroundColor: UIColors.white,
                              textStyle: UITextStyle.body.copyWith(
                                color: UIColors.red,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      spacerHeight(),
                      const Divider(color: UIColors.veryDarkGrey),
                      spacerHeight(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SectionTitle(title: 'تفاصيل الطلب'),
                            spacerHeight(),
                            SizedBox(
                              height: 180,
                              child: ListView.separated(
                                itemBuilder: (contex, index) {
                                  return OrderItemBox(
                                      orderItem: order.details[index]);
                                },
                                separatorBuilder: (contex, index) =>
                                    spacerHeight(),
                                itemCount: order.details.length,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              spacerHeight(),
              Column(
                children: [
                  AcceptButton(
                    text: 'تم التوصيل',
                    onPressed: () {},
                  ),
                  spacerHeight(),
                  AcceptButton(
                    text: 'تغيير الحالة',
                    backgroundColor: UIColors.white,
                    textStyle: UITextStyle.body.copyWith(
                      color: UIColors.red,
                    ),
                    onPressed: () {
                      Get.bottomSheet(ChangeOrderStatusBottomSheet(
                        order: order,
                      ));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
