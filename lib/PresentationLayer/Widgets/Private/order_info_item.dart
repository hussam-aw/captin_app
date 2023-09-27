import 'package:captin_app/Constants/ui_colors.dart';
import 'package:captin_app/Constants/ui_text_styles.dart';
import 'package:flutter/material.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: UITextStyle.body,
        children: [
          TextSpan(text: title),
          TextSpan(
            text: value,
            style: UITextStyle.body.copyWith(
              color: UIColors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
