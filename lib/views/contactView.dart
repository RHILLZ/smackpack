// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smackpack/controllers/controller_exporter.dart';
import 'package:smackpack/core/styles.dart';

import '../widgets/widgets_export.dart';

class ContactView extends GetView<AppController> {
  ContactView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: const BoxDecoration(gradient: mainGradient),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 6.h,
                ),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: cashAppInfo(),
                ),
                SizedBox(
                  height: 5.h,
                ),
                ContactCard(
                  controller: controller,
                ),
                SizedBox(
                  height: 5.h,
                ),
                deliveryInfo(),
                SizedBox(
                  height: 5.h,
                ),
                pickUpInfo(),
                SizedBox(
                  height: 5.h,
                ),
                instagram
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  //cash app
  Widget cashAppInfo() => Column(
        children: [
          const SmackText(
              text: 'cash app preferred for donations',
              strokeColor: mainStrokeColor,
              textColor: mainTextColor,
              size: 25),
          SizedBox(
            height: 1.h,
          ),
          SmackText(
              text: '\$${controller.contact.cashAppTag}',
              strokeColor: mainStrokeColor,
              textColor: smackGreen,
              showShimmer: true,
              size: 45),
          SizedBox(
            height: 4.h,
          ),
          const SmackText(
              text: 'please have cash app installed and ready',
              strokeColor: mainStrokeColor,
              textColor: smackYellow,
              size: 25),
        ],
      );

  //delivery info
  Widget deliveryInfo() => Column(
        children: [
          SmackText(
              text: controller.contact.deliveryInfo,
              strokeColor: mainStrokeColor,
              textColor: mainTextColor,
              size: 24),
          SizedBox(
            height: 2.h,
          ),
          SmackText(
              text: 'delivery fee \$${controller.contact.deliveryFee}',
              strokeColor: mainStrokeColor,
              textColor: smackGreen,
              size: 24),
          SizedBox(
            height: 2.h,
          ),
          const SmackText(
              text: 'orders over \$200',
              strokeColor: mainStrokeColor,
              textColor: smackGreen,
              size: 24),
          const SmackText(
              text: 'free delivery',
              strokeColor: mainStrokeColor,
              textColor: smackGreen,
              size: 24),
        ],
      );

  // pick up info
  Widget pickUpInfo() => Column(
        children: [
          const SmackText(
              text: 'pick up location',
              strokeColor: mainStrokeColor,
              textColor: mainTextColor,
              size: 24),
          SmackText(
              text: controller.contact.pickUpLocation,
              strokeColor: mainStrokeColor,
              textColor: mainTextColor,
              size: 24),
        ],
      );

  final Widget instagram = Column(
    children: [
      SvgPicture.asset(
        'assets/logos/ig.svg',
        height: 65,
        width: 65,
        color: mainTextColor,
      ),
      SizedBox(
        height: 1.h,
      ),
      const SmackText(
        text: 'Follow us',
        strokeColor: smackBlue,
        textColor: smackPink,
        // strokeWidth: 2,
        size: 20,
        showShimmer: true,
      )
    ],
  );
}
