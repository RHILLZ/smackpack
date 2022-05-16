// ignore_for_file: file_names,

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smackpack/controllers/controller_exporter.dart';
import 'package:smackpack/core/styles.dart';

import '../widgets/widgets_export.dart';

class MainView extends GetView<AppController> {
  MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(gradient: gyGradient),
        ),
        Obx(() => controller.doneLoading
            ? Scaffold(
                backgroundColor: Colors.transparent,
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: ElevatedButton(
                  onPressed: () => Get.toNamed('/contact_view'),
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      side: const BorderSide(color: mainStrokeColor, width: 2),
                      elevation: 10,
                      padding: const EdgeInsets.all(20),
                      primary: Colors.transparent),
                  child: const GetSmackedButton(
                    topLabel: 'get',
                    bottomLabel: 'smack\'d',
                  ),
                ),
                body: CustomScrollView(slivers: <Widget>[
                  SliverAppBar(
                    // forceElevated: true,
                    shadowColor: Colors.black,
                    elevation: 20,
                    // centerTitle: true,
                    backgroundColor: Colors.transparent,
                    pinned: true,
                    snap: false,
                    floating: true,
                    expandedHeight: 20.h,
                    flexibleSpace: FlexibleSpaceBar(
                      title: const MenuBanner(),
                      background: backgroundImage,
                      centerTitle: true,
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        controller.products.isEmpty
                            ? reStocking
                            : ProductTile(
                                product: controller.products[index],
                                isAdmin: false,
                                iconAction: () {},
                              ),
                        SizedBox(
                          height: .5.h,
                        )
                      ],
                    );
                  },
                          childCount: controller.products.length == 0
                              ? 1
                              : controller.products.length))
                ]))
            : loader)
      ],
    );
  }

  final Widget backgroundImage = Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/logos/comic.png"), // <-- BACKGROUND IMAGE
        fit: BoxFit.cover,
      ),
    ),
  );

  final loader = const Center(
    child: CircularProgressIndicator.adaptive(),
  );

  final reStocking = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        height: 6.h,
      ),
      const SmackText(
        text: 'We are Restocking',
        strokeColor: mainStrokeColor,
        textColor: smackPink,
        size: 50,
        showShimmer: true,
      ),
      SizedBox(
        height: 3.h,
      ),
      const SmackText(
        text: 'check back soon....',
        strokeColor: mainStrokeColor,
        textColor: smackPink,
        size: 25,
      ),
    ],
  );
}
