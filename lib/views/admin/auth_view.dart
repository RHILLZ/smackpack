import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smackpack/controllers/auth_controller.dart';
import 'package:smackpack/core/styles.dart';
import 'package:smackpack/widgets/widgets_export.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SmackText(
                text: 'admin',
                strokeColor: mainStrokeColor,
                textColor: smackGreen,
                size: 40),
            SizedBox(
              height: 4.h,
            ),
            SmackTextInput(
              isPassword: false,
              hintText: 'email',
              action: (v) => controller.email = v,
              width: 90,
            ),
            SizedBox(
              height: 2.h,
            ),
            SmackTextInput(
              isPassword: true,
              hintText: 'password',
              action: (v) => controller.password = v,
              width: 90,
            ),
            SizedBox(
              height: 4.h,
            ),
            LargebuttonWidget(
                label: 'Sign in', action: () => controller.signInWithEmail()),
            SizedBox(
              height: 4.h,
            ),
            GestureDetector(
                onTap: () => Get.offAllNamed('/main_view'),
                child: const SmackText(
                  text: 'back to app',
                  strokeColor: mainStrokeColor,
                  textColor: smackYellow,
                  size: 25,
                  showShimmer: true,
                ))
          ],
        ),
      ),
    );
  }
}
