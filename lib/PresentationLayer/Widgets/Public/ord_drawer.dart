import 'package:captin_app/BussinessLayer/Controllers/auth_controller.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/drawer_list_tile.dart';
import 'package:captin_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/get_routes.dart';
import '../../../Constants/ui_colors.dart';
import '../../../Constants/ui_text_styles.dart';

class OrdDrawer extends StatelessWidget {
  OrdDrawer({super.key});

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: UIColors.lightDeepBlue,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: UIColors.red,
            ),
            accountName: Text(
              MyApp.appUser!.name,
              style: UITextStyle.title,
            ),
            accountEmail: Text(
              MyApp.appUser!.phone,
              style: UITextStyle.xsmall,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: UIColors.lightGrey,
              backgroundImage: AssetImage(
                'assets/images/logo.png',
              ),
            ),
          ),
          if (MyApp.appUser != null)
            DrawerListTile(
              title: 'الملف الشخصي',
              iconData: Icons.people,
              onTap: () {
                //Get.toNamed(AppRoutes.profileScreen);
              },
            ),
          DrawerListTile(
            title: 'الطلبات',
            iconData: Icons.shopping_cart,
            onTap: () {
              Get.toNamed(AppRoutes.ordersScreen);
            },
          ),
          if (MyApp.appUser != null)
            DrawerListTile(
              title: 'تسجيل الخروج',
              iconData: Icons.exit_to_app,
              onTap: () async {
                await authController.logout();
              },
            ),
        ],
      ),
    );
  }
}
