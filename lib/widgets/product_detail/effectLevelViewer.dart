// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:smackpack/core/styles.dart';
import 'package:smackpack/widgets/widgets_export.dart';

class EffectLevelIndicator extends StatelessWidget {
  const EffectLevelIndicator({Key? key, required double level})
      : _level = level,
        super(key: key);

  final double _level;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: LinearPercentIndicator(
            width: 100.w,
            barRadius: const Radius.circular(50),
            lineHeight: 5.h,
            percent: _level,
            linearGradient: effectGradient,
            clipLinearGradient: true,
            backgroundColor: const Color.fromARGB(255, 236, 236, 236),
            padding: const EdgeInsets.symmetric(horizontal: 5),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
          child: Align(
            alignment: Alignment.centerLeft,
            child: relaxing,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
          child: Align(
            alignment: Alignment.centerRight,
            child: energizing,
          ),
        ),
      ],
    );
  }

  final Widget relaxing = const SmackText(
      text: 'relaxing',
      strokeColor: mainStrokeColor,
      textColor: smackGreen,
      strokeWidth: 3,
      size: 18);
  final Widget energizing = const SmackText(
      text: 'energizing',
      strokeColor: smackPink,
      strokeWidth: 3,
      textColor: smackBlue,
      size: 18);
}
