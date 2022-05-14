// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smackpack/core/styles.dart';
import 'package:smackpack/widgets/widgets_export.dart';

class TypeHeader extends StatelessWidget {
  const TypeHeader({Key? key, required String type})
      : _type = type,
        super(key: key);

  final String _type;
  @override
  Widget build(BuildContext context) {
    Radius rad = const Radius.circular(20);
    return Container(
      height: 8.5.h,
      width: 75.w,
      decoration: BoxDecoration(
          border: mainBorder,
          borderRadius: BorderRadius.only(bottomLeft: rad, bottomRight: rad),
          color: smackGreen),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(alignment: Alignment.bottomCenter, child: type()),
      ),
    );
  }

  Widget type() => SmackText(
      text: _type, strokeColor: smackPink, textColor: smackBlue, size: 24);
}
