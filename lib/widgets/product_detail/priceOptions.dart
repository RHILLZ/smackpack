// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smackpack/core/styles.dart';
import 'package:smackpack/widgets/widgets_export.dart';

class PriceOptions extends StatelessWidget {
  const PriceOptions(
      {super.key, required String halfPrice, required String ozPrice})
      : _halfPrice = halfPrice,
        _ozPrice = ozPrice;

  final String _halfPrice, _ozPrice;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65.w,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          halfPrice(),
          _pike,
          ozPrice(),
        ],
      ),
    );
  }

  Widget halfPrice() => SmackText(
      text: '\$$_halfPrice (14.g)',
      strokeColor: mainStrokeColor,
      textColor: smackYellow,
      size: 24);
  Widget ozPrice() => SmackText(
      text: '\$$_ozPrice (28.g)',
      strokeColor: mainStrokeColor,
      textColor: smackYellow,
      size: 24);
  final Widget _pike = const Text(
    '|',
    style: textStyle1,
  );
}
