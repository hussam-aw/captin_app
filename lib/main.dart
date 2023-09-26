import 'package:captin_app/Constants/get_pages.dart';
import 'package:captin_app/Constants/ui_themes.dart';
import 'package:captin_app/DataAccesslayer/Models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static User? appUser;

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
