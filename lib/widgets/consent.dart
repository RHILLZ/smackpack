import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smackpack/core/styles.dart';
import 'package:smackpack/widgets/smackText.dart';

import '../controllers/controller_exporter.dart';

class Consent extends StatelessWidget {
  Consent({Key? key}) : super(key: key);
  final _controller = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() => Checkbox(
              value: _controller.isVerified,
              onChanged: (val) => _controller.verifyAge(val!),
              activeColor: smackYellow,
              checkColor: smackBlue,
              fillColor: MaterialStateProperty.all(smackYellow),
            )),
        SizedBox(
          width: 6.w,
        ),
        const SmackText(
            text: 'I Am 21+',
            strokeColor: mainStrokeColor,
            textColor: smackGreen,
            size: 20),
      ],
    );
  }
}


// SmackText(
//           text: 'I Am 21+',
//           strokeColor: mainStrokeColor,
//           textColor: smackGreen,
//           size: 20),