// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:smackpack/core/styles.dart';

import 'widgets_export.dart';

class GetSmackedButton extends StatelessWidget {
  const GetSmackedButton(
      {super.key, required String topLabel, required String bottomLabel})
      : _topLabel = topLabel,
        _bottonLabel = bottomLabel;

  final String _topLabel, _bottonLabel;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: const EdgeInsets.all(25),
        width: 100.w,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: smackGreen,
            boxShadow: [buttonBoxShadow]),
        foregroundDecoration:
            BoxDecoration(border: mainBorder, shape: BoxShape.circle),
        child: Shimmer.fromColors(
            baseColor: smackBlue,
            // highlightColor: Colors.white,
            highlightColor: smackPink,
            period: const Duration(milliseconds: 3000),
            child: getSmackedBackround()),
      ),
      Positioned(left: 0, right: 0, bottom: 0, top: 0, child: getSmacked()),
    ]);
  }

  Widget getSmacked() => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SmackText(
              text: _topLabel,
              strokeColor: mainStrokeColor,
              textColor: smackPink,
              size: 20,
              showShimmer: true),
          SmackText(
              text: _bottonLabel,
              strokeColor: mainStrokeColor,
              textColor: smackPink,
              size: 24,
              showShimmer: true),
        ],
      );
  Widget getSmackedBackround() => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SmackText(
              text: _topLabel,
              strokeColor: mainStrokeColor,
              textColor: smackYellow,
              size: 20,
              showShimmer: true),
          SmackText(
              text: _bottonLabel,
              strokeColor: mainStrokeColor,
              textColor: smackYellow,
              size: 24,
              showShimmer: true),
        ],
      );
}
