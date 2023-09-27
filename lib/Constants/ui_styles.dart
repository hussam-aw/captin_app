// Input Styles
import 'package:captin_app/Constants/ui_colors.dart';
import 'package:captin_app/Constants/ui_text_styles.dart';
import 'package:flutter/material.dart';

// ElevatedButton Styles
const acceptButtonStyle = ButtonStyle(
  elevation: MaterialStatePropertyAll(0),
  backgroundColor: MaterialStatePropertyAll<Color>(UIColors.red),
  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: raduis22,
    ),
  ),
  minimumSize: MaterialStatePropertyAll<Size>(
    Size(double.infinity, 40),
  ),
);

//Input Decoration
final customTextFieldStyle = InputDecoration(
  filled: true,
  fillColor: UIColors.lightDeepBlue,
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(17),
      borderSide: const BorderSide(color: UIColors.lightDeepBlue)),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(17),
      borderSide: const BorderSide(color: UIColors.lightDeepBlue)),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      width: 1,
      color: UIColors.red,
    ),
    borderRadius: BorderRadius.circular(17),
  ),
  hintStyle: UITextStyle.small.copyWith(
    color: UIColors.lightGrey,
  ),
);

final normalTextFieldStyle = InputDecoration(
  filled: true,
  fillColor: UIColors.white,
  hintStyle: UITextStyle.body.copyWith(color: UIColors.lightGrey),
  border: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(17),
      borderSide: const BorderSide(color: UIColors.lightDeepBlue)),
  focusedBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(17),
      borderSide: const BorderSide(color: UIColors.lightDeepBlue)),
  enabledBorder: const UnderlineInputBorder(
    borderSide: BorderSide(
      color: UIColors.lightDeepBlue,
    ),
  ),
);

//Border Radius
const raduis12 = BorderRadius.all(Radius.circular(12));
const raduis20 = BorderRadius.all(Radius.circular(20));
const raduis22 = BorderRadius.all(Radius.circular(22));
const raduis32Top = BorderRadius.only(
  topLeft: Radius.circular(32),
  topRight: Radius.circular(32),
);
const raduis54Bottom = BorderRadius.only(
  bottomLeft: Radius.circular(54),
  bottomRight: Radius.circular(54),
);
