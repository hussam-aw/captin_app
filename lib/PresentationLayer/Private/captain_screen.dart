// ignore_for_file: must_be_immutable

import 'package:captin_app/Constants/ui_colors.dart';
import 'package:captin_app/Constants/ui_text_styles.dart';
import 'package:captin_app/DataAccesslayer/Models/user.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/ord_appbar.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/ord_drawer.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/page_title.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/spacer_height.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CaptainScreen extends StatelessWidget {
  CaptainScreen({super.key});

  User? user = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: ordAppBar(),
        drawer: OrdDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            children: [
              const PageTitle(title: 'الكابتن'),
              Expanded(
                flex: 8,
                child: Column(
                  children: [
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 150,
                            width: 150,
                            child: CircleAvatar(
                                backgroundColor: UIColors.lightGrey,
                                backgroundImage: user!.avatar.isNotEmpty
                                    ? NetworkImage(user!.avatar)
                                    : const AssetImage(
                                            'assets/images/person.png')
                                        as ImageProvider),
                          ),
                          spacerHeight(height: 30),
                          Text(
                            user!.name,
                            softWrap: true,
                            style: UITextStyle.heading.copyWith(
                              color: UIColors.lightGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
