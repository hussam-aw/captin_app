import 'package:captin_app/BussinessLayer/Controllers/auth_controller.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/accept_button.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/app_icon_header.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/ord_text_form_field.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/page_title.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/primary_line.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/spacer_height.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
            child: Column(
              children: [
                const AppIconHeader(),
                const PageTitle(
                  alignment: Alignment.center,
                  title: 'تسجيل الدخول',
                ),
                spacerHeight(),
                Expanded(
                  flex: 3,
                  child: Form(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          OrdTextFormField(
                            controller: authController.phoneNumberController,
                            keyboardType: TextInputType.phone,
                            hintText: 'رقم الموبايل',
                          ),
                          spacerHeight(height: 22),
                          OrdTextFormField(
                            controller: authController.passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obsecureText: true,
                            hintText: 'كلمة المرور',
                          ),
                          spacerHeight(height: 22),
                          Obx(
                            () {
                              return AcceptButton(
                                onPressed: () {
                                  authController.login();
                                },
                                text: 'المتابعة',
                                isLoading: authController.logging.value,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomSheet: const PrimaryLine(),
      ),
    );
  }
}
