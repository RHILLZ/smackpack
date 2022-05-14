import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smackpack/core/styles.dart';
import 'package:smackpack/widgets/widgets_export.dart';

class Levels extends StatelessWidget {
  const Levels({super.key, required String thcLevel, required String cbdLevel})
      : _thcLevel = thcLevel,
        _cbdLevel = cbdLevel;

  final String _thcLevel, _cbdLevel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [thc(), cbd()],
    );
  }

  Widget thc() => Row(
        children: [
          thcIcon,
          SizedBox(
            width: 2.w,
          ),
          thcText()
        ],
      );
  Widget cbd() => Row(
        children: [
          cbdIcon,
          SizedBox(
            width: 2.w,
          ),
          cbdText()
        ],
      );

  Widget thcText() => SmackText(
      text: 'THC $_thcLevel%',
      strokeColor: mainStrokeColor,
      strokeWidth: 2,
      textColor: mainTextColor,
      size: 16);
  Widget cbdText() => SmackText(
      text: 'CBD $_cbdLevel%',
      strokeColor: mainStrokeColor,
      strokeWidth: 2,
      textColor: mainTextColor,
      size: 16);
}
