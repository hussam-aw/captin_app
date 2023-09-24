import 'package:captin_app/BussinessLayer/Controllers/splash_controller.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/app_icon_header.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/page_title.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/primary_line.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIconHeader(),
            PageTitle(
              alignment: Alignment.center,
              title: 'مطعم رواد حلب',
            ),
            SectionTitle(title: 'تطبيق الكابتن')
          ],
        ),
      ),
      bottomSheet: const PrimaryLine(),
    );
  }
}
