import 'package:captin_app/Constants/ui_colors.dart';
import 'package:captin_app/Constants/ui_text_styles.dart';
import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.iconData,
    required this.onTap,
  });

  final String title;
  final IconData iconData;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: UITextStyle.medium.apply(fontSizeFactor: .8),
      ),
      leading: Icon(
        iconData,
        color: UIColors.white,
        size: 25,
      ),
      onTap: onTap,
    );
  }
}
