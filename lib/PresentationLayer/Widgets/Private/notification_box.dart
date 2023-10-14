import 'package:captin_app/BussinessLayer/Helpers/date_helper.dart';
import 'package:captin_app/Constants/ui_colors.dart';
import 'package:captin_app/Constants/ui_styles.dart';
import 'package:captin_app/Constants/ui_text_styles.dart';
import 'package:captin_app/DataAccesslayer/Models/user_notification.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/spacer_height.dart';
import 'package:flutter/material.dart';

class NotificationBox extends StatelessWidget {
  const NotificationBox({
    super.key,
    required this.notification,
    required this.onTap,
  });

  final UserNotification notification;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: raduis22,
          color: UIColors.lightDeepBlue,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: UITextStyle.title,
                ),
                spacerHeight(),
                Text(
                  notification.subtitle,
                  style: UITextStyle.medium,
                ),
                spacerHeight(),
                Text(
                  notification.date,
                  style: UITextStyle.body.copyWith(
                    color: UIColors.lightGrey,
                  ),
                ),
                spacerHeight(),
                Text(
                  DateHelper.getDateString(notification.createdAt),
                  style: UITextStyle.body.copyWith(
                    color: UIColors.lightGrey,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
