import 'package:captin_app/Constants/get_routes.dart';
import 'package:captin_app/PresentationLayer/Private/captain_screen.dart';
import 'package:captin_app/PresentationLayer/Private/confirm_order_screen.dart';
import 'package:captin_app/PresentationLayer/Private/notifications_screen.dart';
import 'package:captin_app/PresentationLayer/Private/order_info_screen.dart';
import 'package:captin_app/PresentationLayer/Private/order_location_screen.dart.dart';
import 'package:captin_app/PresentationLayer/Private/orders_screen.dart';
import 'package:captin_app/PresentationLayer/Private/profile_screen.dart';
import 'package:captin_app/PresentationLayer/Public/login_screen.dart';
import 'package:captin_app/PresentationLayer/Public/splash_screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> getPages = [
  GetPage(
    name: AppRoutes.splashScreen,
    page: () => SplashScreen(),
  ),
  GetPage(
    name: AppRoutes.loginScreen,
    page: () => LoginScreen(),
  ),
  GetPage(
    name: AppRoutes.ordersScreen,
    page: () => OrdersScreen(),
  ),
  GetPage(
    name: AppRoutes.orderInfoScreen,
    page: () => OrderInfoScreen(),
  ),
  GetPage(
    name: AppRoutes.orderLocationScreen,
    page: () => OrderLocationScreen(),
  ),
  GetPage(
    name: AppRoutes.notificationsScreen,
    page: () => NotificationsScreen(),
  ),
  GetPage(
    name: AppRoutes.profileScreen,
    page: () => ProfileScreen(),
  ),
  GetPage(
    name: AppRoutes.captainScreen,
    page: () => CaptainScreen(),
  ),
  GetPage(
    name: AppRoutes.confirmOrderScreen,
    page: () => ConfirmOrderScreen(),
  ),
];
