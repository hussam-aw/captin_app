import 'package:captin_app/DataAccesslayer/Models/order.dart';
import 'package:captin_app/PresentationLayer/Widgets/Private/order_info_item.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/spacer_height.dart';
import 'package:captin_app/main.dart';
import 'package:flutter/material.dart';

class OrderInfoBox extends StatelessWidget {
  const OrderInfoBox({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrderInfoItem(
          title: 'رقم الطلب   ',
          value: '${order.id}#',
        ),
        spacerHeight(),
        OrderInfoItem(
          title: 'رقم الزبون   ',
          value: MyApp.appUser!.phone,
        ),
        spacerHeight(),
        OrderInfoItem(
          title: 'إجمالي الطلب   ',
          value: order.total.toString(),
        ),
        spacerHeight(),
        OrderInfoItem(
          title: 'أجرة التوصيل   ',
          value: order.deliveryFee.toString(),
        ),
      ],
    );
  }
}
