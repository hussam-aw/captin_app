// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:captin_app/Constants/ui_colors.dart';
import 'package:captin_app/Constants/ui_styles.dart';
import 'package:captin_app/Constants/ui_text_styles.dart';
import 'package:captin_app/DataAccesslayer/Models/order_item.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/spacer_height.dart';
import 'package:flutter/material.dart';

class OrderItemBox extends StatelessWidget {
  OrderItemBox({super.key, required this.orderItem});

  final OrderItem orderItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: const BoxDecoration(
        color: UIColors.lightDeepBlue,
        borderRadius: raduis20,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              orderItem.mealName,
              style: UITextStyle.body,
            ),
            spacerHeight(height: 12),
            RichText(
              text: TextSpan(
                style: UITextStyle.xsmall,
                children: [
                  TextSpan(text: 'العدد: ${orderItem.qty}'),
                  const TextSpan(text: ' - '),
                  TextSpan(text: 'الافرادي: ${orderItem.price}'),
                  const TextSpan(text: ' - '),
                  TextSpan(text: 'الاجمالي: ${orderItem.total}\$'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
