import 'package:captin_app/BussinessLayer/Helpers/firebase_helper.dart';
import 'package:captin_app/BussinessLayer/Helpers/local_notification_helper.dart';
import 'package:captin_app/Constants/get_pages.dart';
import 'package:captin_app/Constants/ui_themes.dart';
import 'package:captin_app/DataAccesslayer/Models/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessagingHelper.initialize();
  await GetStorage.init();
  await LocalNotificationHelper.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static User? appUser;
  static bool isAvailable = false;
  static int bottomSelectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: getPages,
      theme: darkTheme,
      title: 'Captin App',
    );
  }
}
