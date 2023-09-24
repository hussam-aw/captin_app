import 'package:captin_app/Constants/ui_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrdTextFormField extends StatelessWidget {
  const OrdTextFormField({
    super.key,
    this.controller,
    this.hintText = '',
    this.keyboardType = TextInputType.name,
    this.obsecureText = false,
    this.style = UITextStyle.body,
    this.textAlign = TextAlign.center,
    this.autofocus = false,
    this.maxLines = 1,
    this.readOnly = false,
    this.formatters,
    this.suffix,
    this.onTap,
    this.onChanged,
  });

  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obsecureText;
  final TextStyle style;
  final TextAlign textAlign;
  final bool autofocus;
  final int maxLines;
  final bool readOnly;
  final List<TextInputFormatter>? formatters;
  final Widget? suffix;
  final Function()? onTap;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      autofocus: autofocus,
      inputFormatters: formatters,
      readOnly: readOnly,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obsecureText,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      decoration: (const InputDecoration())
          .applyDefaults(Theme.of(context).inputDecorationTheme)
          .copyWith(
            hintText: hintText,
          ),
      onChanged: onChanged,
    );
  }
}
