// ignore_for_file: avoid_print
import 'package:captin_app/Constants/get_routes.dart';
import 'package:captin_app/Constants/ui_colors.dart';
import 'package:captin_app/Constants/ui_text_styles.dart';
import 'package:captin_app/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class OrdBottomNavigationBar extends StatelessWidget {
  const OrdBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedLabelStyle: UITextStyle.xsmall,
      unselectedLabelStyle: UITextStyle.xsmall,
      backgroundColor: UIColors.red,
      selectedItemColor: UIColors.white,
      unselectedItemColor: UIColors.white.withOpacity(.5),
      currentIndex: MyApp.bottomSelectedItem,
      type: BottomNavigationBarType.fixed,
      onTap: ((value) {
        MyApp.bottomSelectedItem = value;
        switch (value) {
          case 0:
            Get.toNamed(AppRoutes.ordersScreen);
            break;

          case 1:
            Get.toNamed(AppRoutes.notificationsScreen);
            break;

          case 2:
            Get.toNamed(AppRoutes.profileScreen);
            break;
        }
      }),
      items: const [
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: Icon(
              FontAwesomeIcons.fileInvoice,
              size: 24,
            ),
          ),
          label: 'الطلبات',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: Icon(
              FontAwesomeIcons.bell,
              size: 24,
            ),
          ),
          label: 'الإشعارات',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: Icon(
              FontAwesomeIcons.user,
              size: 24,
            ),
          ),
          label: 'الملف الشخصي',
        ),
      ],
    );
  }
}
