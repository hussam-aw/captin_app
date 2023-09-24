import 'package:captin_app/Constants/ui_colors.dart';
import 'package:captin_app/Constants/ui_text_styles.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/loading_item.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AcceptButton extends StatelessWidget {
  AcceptButton({
    super.key,
    required this.text,
    this.backgroundColor = UIColors.red,
    this.textStyle = UITextStyle.medium,
    required this.onPressed,
    this.isLoading = false,
  });

  final String text;
  final Color backgroundColor;
  final TextStyle textStyle;
  final Function()? onPressed;
  bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? () {} : onPressed,
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: MaterialStatePropertyAll<Color>(backgroundColor),
          ),
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isLoading) loadingItem(isWhite: true),
            Text(
              text,
              textAlign: TextAlign.center,
              softWrap: true,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
