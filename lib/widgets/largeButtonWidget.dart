// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smackpack/core/styles.dart';
import 'package:smackpack/widgets/smackText.dart';

class LargebuttonWidget extends StatelessWidget {
  const LargebuttonWidget(
      {Key? key,
      required String label,
      required Function action,
      Function? longPressAction})
      : _action = action,
        _label = label,
        _longPressAction = longPressAction,
        super(key: key);

  final Function _action;
  final String _label;
  final Function? _longPressAction;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onLongPress: () => _longPressAction!(),
      onTap: () {
        _action();
      },
      child: Center(
        child: Container(
          height: 10.h,
          width: 90.w,
          decoration: BoxDecoration(
              color: smackGreen,
              border: mainBorder,
              borderRadius: buttonBorderRadius,
              boxShadow: const [buttonBoxShadow]),
          child: Center(
            child: SmackText(
                text: _label,
                strokeColor: mainStrokeColor,
                strokeWidth: 4,
                textColor: mainTextColor,
                size: 30),
          ),
        ),
      ),
    );
  }
}
