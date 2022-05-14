// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smackpack/controllers/controller_exporter.dart';
import 'package:smackpack/core/styles.dart';
import 'package:smackpack/data/models/product.dart';
import 'package:smackpack/widgets/widgets_export.dart';

class EffectSlider extends StatelessWidget {
  EffectSlider(
      {super.key, required AdminController controller, Product? product})
      : _controller = controller,
        _product = product;

  final AdminController _controller;
  final Product? _product;
  final GlobalKey _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          width: 95.w,
          child: Column(
            children: [
              effectLabel(_product),
              Slider.adaptive(
                  key: _key,
                  activeColor: smackBlue,
                  thumbColor: smackPink,
                  value: _product != null
                      ? _product!.effectLevel
                      : _controller.effectLevel,
                  onChanged: (v) {
                    if (_product != null) {
                      _controller.updatedEffectLevel = v;
                    } else {
                      _controller.effectLevel = v;
                      _controller.validateForm();
                    }
                  }),
            ],
          ),
        ));
  }

  Widget effectLabel(Product? product) => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SmackText(
              text: 'relaxing',
              strokeColor: mainStrokeColor,
              textColor: smackGreen,
              size: 16),
          SmackText(
              text: product != null ? 'effect level' : 'set effect level',
              strokeColor: mainStrokeColor,
              textColor: smackPink,
              size: 22),
          const SmackText(
              text: 'energizing',
              strokeColor: smackPink,
              textColor: smackBlue,
              size: 16),
        ],
      );
}
