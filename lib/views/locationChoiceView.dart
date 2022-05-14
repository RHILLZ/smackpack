// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sizer/sizer.dart';
import 'package:smackpack/controllers/controller_exporter.dart';
import 'package:smackpack/core/styles.dart';
import 'package:smackpack/widgets/widgets_export.dart';

class LocationChoiceView extends GetView<AppController> {
  const LocationChoiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/logos/comic.png"), // <-- BACKGROUND IMAGE
            fit: BoxFit.cover,
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.black54,
        body: Container(
          padding: mainPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SmackText(
                text: 'Where you look\'n?',
                strokeColor: mainStrokeColor,
                textColor: smackYellow,
                size: 40,
                showShimmer: true,
              ),
              SizedBox(
                height: 6.h,
              ),
              LargebuttonWidget(
                  label: 'north jersey',
                  longPressAction: () {
                    controller.setLocation(Location.nj);
                    Get.toNamed('/auth_view');
                  },
                  action: () => controller.setLocation(Location.nj)),
              SizedBox(
                height: 3.h,
              ),
              LargebuttonWidget(
                  label: 'New york City',
                  longPressAction: () {
                    controller.setLocation(Location.nyc);
                    Get.toNamed('/auth_view');
                  },
                  action: () => controller.setLocation(Location.nyc)),
            ],
          ),
        ),
      )
    ]);
  }
}
