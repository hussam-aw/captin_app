import 'package:captin_app/Constants/ui_colors.dart';
import 'package:captin_app/Constants/ui_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBars {
  static void showSuccess(message) {
    Get.rawSnackbar(
        padding: const EdgeInsets.symmetric(vertical: 15),
        messageText: Text(
          message,
          style: UITextStyle.body,
          textAlign: TextAlign.center,
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: UIColors.lightDeepBlue);
  }

  static void showError(message) {
    Get.rawSnackbar(
        padding: const EdgeInsets.symmetric(vertical: 15),
        messageText: Text(
          message,
          style: UITextStyle.body,
          textAlign: TextAlign.center,
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: UIColors.red);
  }

  static void showWarning(message) {
    Get.rawSnackbar(
        padding: const EdgeInsets.symmetric(vertical: 15),
        messageText: Text(
          message,
          style: UITextStyle.body,
          textAlign: TextAlign.center,
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: UIColors.darkGrey);
  }
}
