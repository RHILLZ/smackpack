// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sizer/sizer.dart';
import 'package:smackpack/controllers/controller_exporter.dart';
import 'package:smackpack/core/styles.dart';

import '../widgets/widgets_export.dart';

class EnterAppView extends GetView<AppController> {
  const EnterAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/logos/cover_logo.png"), // <-- BACKGROUND IMAGE
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
              SizedBox(
                height: 8.h,
              ),
              Container(
                height: 55.h,
                width: 100.w,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/logos/yellow_logo.png',
                        ),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 8.h,
              ),
              LargebuttonWidget(
                  label: 'enter app', action: () => controller.enterApp()),
              SizedBox(
                height: 2.h,
              ),
              Consent()
            ],
          ),
        ),
      )
    ]);
  }
}
