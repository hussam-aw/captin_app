import 'package:captin_app/Constants/ui_colors.dart';
import 'package:captin_app/Constants/ui_styles.dart';
import 'package:flutter/material.dart';

class OrdIconButton extends StatelessWidget {
  const OrdIconButton({
    super.key,
    required this.icon,
    this.backgroundColor = UIColors.white,
    this.borderRadius = raduis12,
    this.circleShape = false,
    required this.onPressed,
  });

  final Icon icon;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final bool circleShape;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: circleShape
          ? ShapeDecoration(
              color: backgroundColor,
              shape: const CircleBorder(),
            )
          : BoxDecoration(
              color: backgroundColor,
              borderRadius: borderRadius,
              border: Border.all(
                color: UIColors.veryDarkGrey,
              ),
            ),
      child: Center(
        child: IconButton(onPressed: onPressed, icon: icon),
      ),
    );
  }
}
