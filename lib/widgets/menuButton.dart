// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:smackpack/core/styles.dart';
import 'package:smackpack/widgets/smackText.dart';

class MenuBanner extends StatelessWidget {
  const MenuBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => Get.offAllNamed('/auth_view'),
      child: Stack(alignment: Alignment.center, children: [
        Container(
          foregroundDecoration: BoxDecoration(
              borderRadius: buttonBorderRadius, border: mainBorder),
          child: Shimmer.fromColors(
            baseColor: smackBlue,
            // highlightColor: Colors.white,
            highlightColor: smackPink,
            period: const Duration(milliseconds: 3000),
            child: Container(
              height: 5.h,
              width: 60.w,
              decoration: BoxDecoration(
                  boxShadow: const [buttonBoxShadow],
                  border: thickBorder,
                  borderRadius: buttonBorderRadius,
                  color: smackGreen.withOpacity(.9)),
            ),
          ),
        ),
        const Positioned(
          child: SmackText(
              text: 'menu',
              strokeColor: mainStrokeColor,
              textColor: smackYellow,
              size: 28),
        ),
      ]),
    );
  }
}
