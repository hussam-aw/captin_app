import 'package:captin_app/BussinessLayer/Controllers/notifications_controller.dart';
import 'package:captin_app/PresentationLayer/Widgets/Private/notification_box.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/loading_item.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/ord_appbar.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/ord_drawer.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/page_title.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/spacer_height.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});

  final notificationsController = Get.put(NotificationsController());

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PageTitle(title: 'الإشعارات'),
              spacerHeight(),
              Expanded(child: Obx(() {
                return notificationsController.isLoadingNotifications.value
                    ? Center(child: loadingItem(width: 100, isWhite: true))
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          return NotificationBox(
                            notification:
                                notificationsController.notifications[index],
                            onTap: () {
                              notificationsController
                                  .navigateBasedOnNotificationType(
                                      notificationsController
                                          .notifications[index]);
                            },
                          );
                        },
                        separatorBuilder: (context, index) => spacerHeight(),
                        itemCount: notificationsController.notifications.length,
                      );
              })),
            ],
          ),
        ),
      ),
    );
  }
}
