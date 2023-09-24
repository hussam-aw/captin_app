import 'package:captin_app/Constants/ui_colors.dart';
import 'package:captin_app/Constants/ui_text_styles.dart';
import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    super.key,
    required this.title,
    this.alignment = Alignment.centerRight,
    this.titleColor = UIColors.white,
  });

  final String title;
  final AlignmentGeometry alignment;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          softWrap: true,
          style: UITextStyle.heading.copyWith(
            color: titleColor,
          ),
        ),
      ),
    );
  }
}
