// ignore_for_file: must_be_immutable

import 'package:captin_app/Constants/ui_colors.dart';
import 'package:captin_app/DataAccesslayer/Models/order.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/ord_appbar.dart';
import 'package:captin_app/PresentationLayer/Widgets/Public/ord_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class OrderLocationScreen extends StatelessWidget {
  OrderLocationScreen({super.key});

  Order order = Get.arguments;

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
              Expanded(
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(order.lat, order.long),
                    zoom: 10,
                    interactiveFlags:
                        InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: LatLng(order.lat, order.long),
                          builder: (context) {
                            return const Icon(
                              FontAwesomeIcons.locationDot,
                              color: UIColors.red,
                              size: 35,
                            );
                          },
                        ),
                      ],
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
