// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smackpack/core/styles.dart';
import 'package:smackpack/widgets/widgets_export.dart';

class QuarterPriceButton extends StatelessWidget {
  const QuarterPriceButton({super.key, required String price}) : _price = price;

  final String _price;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed('/contact_view'),
      child: Container(
        width: 75.w,
        height: 7.h,
        decoration: BoxDecoration(
            borderRadius: buttonBorderRadius,
            color: smackBlue.withOpacity(.4),
            boxShadow: const [buttonBoxShadow]),
        child: Center(child: price()),
      ),
    );
  }

  Widget price() => SmackText(
      text: '\$$_price (7.g)',
      strokeColor: mainStrokeColor,
      textColor: smackGreen,
      showShimmer: true,
      size: 40);
}
