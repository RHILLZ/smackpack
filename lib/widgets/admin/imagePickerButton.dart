// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smackpack/controllers/controller_exporter.dart';
import 'package:smackpack/core/styles.dart';
import 'package:smackpack/widgets/widgets_export.dart';

class ImagePickerButton extends StatelessWidget {
  const ImagePickerButton(
      {super.key, required String label, required AdminController controller})
      : _controller = controller,
        _label = label;

  final String _label;
  final AdminController _controller;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shadowColor: mainStrokeColor,
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
            elevation: 12,
            fixedSize: Size(40.w, 6.h),
            primary: smackPink,
            side: const BorderSide(color: mainStrokeColor)),
        onPressed: () => _controller.selectImage(),
        child: SmackText(
            text: _label,
            strokeColor: mainStrokeColor,
            strokeWidth: 3,
            textColor: smackGreen,
            size: 18));
  }
}
