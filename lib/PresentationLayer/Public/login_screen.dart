import 'package:captin_app/PresentationLayer/Widgets/Public/accept_button.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/app_icon_header.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/ord_text_form_field.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/page_title.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/primary_line.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/spacer_height.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                spacerHeight(height: 22),
                Expanded(
                  flex: 3,
                  child: Form(
                    child: Column(
                      children: [
                        OrdTextFormField(
                          keyboardType: TextInputType.phone,
                          hintText: 'رقم الموبايل',
                        ),
                        spacerHeight(height: 22),
                        OrdTextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          hintText: 'كلمة المرور',
                        ),
                        spacerHeight(height: 22),
                        AcceptButton(
                          onPressed: () {},
                          text: 'المتابعة',
                        ),
                      ],
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
