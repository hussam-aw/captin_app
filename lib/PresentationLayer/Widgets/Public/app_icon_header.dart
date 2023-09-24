import 'package:flutter/material.dart';

class AppIconHeader extends StatelessWidget {
  const AppIconHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(
        'assets/images/logo.png',
      ),
    );
  }
}
