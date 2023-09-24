import 'package:captin_app/Constants/ui_colors.dart';
import 'package:captin_app/Constants/ui_styles.dart';
import 'package:captin_app/Constants/ui_text_styles.dart';
import 'package:flutter/material.dart';

var darkTheme = ThemeData(
  colorScheme: const ColorScheme(
    primary: UIColors.red,
    secondary: UIColors.red,
    background: UIColors.darkDeepBlue,
    error: UIColors.red,
    surface: UIColors.lightDeepBlue,
    brightness: Brightness.dark,
    onPrimary: UIColors.red,
    onSecondary: UIColors.red,
    onError: UIColors.red,
    onBackground: UIColors.darkDeepBlue,
    onSurface: UIColors.lightDeepBlue,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: UIColors.lightDeepBlue,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(17),
        borderSide: const BorderSide(color: UIColors.lightDeepBlue)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(17),
        borderSide: const BorderSide(color: UIColors.lightDeepBlue)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(17),
        borderSide: const BorderSide(color: UIColors.lightDeepBlue)),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(17),
      borderSide: const BorderSide(color: UIColors.red),
    ),
    hintStyle: UITextStyle.small.copyWith(
      color: UIColors.white.withOpacity(0.2),
    ),
  ),
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStatePropertyAll(0),
      backgroundColor: MaterialStatePropertyAll<Color>(UIColors.red),
      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: raduis22,
        ),
      ),
      minimumSize: MaterialStatePropertyAll<Size>(
        Size(double.infinity, 60),
      ),
    ),
  ),
);

var lightTheme = ThemeData();
