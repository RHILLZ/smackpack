import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smackpack/controllers/admin_controller.dart';
import 'package:smackpack/core/styles.dart';
import 'package:smackpack/widgets/widgets_export.dart';

class AddProductView extends GetView<AdminController> {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isProcessing
        ? loader
        : Scaffold(
            bottomNavigationBar: GestureDetector(
              onTap: controller.isValidated ? () => controller.submit() : null,
              child: Container(
                height: 8.h,
                width: 100.w,
                decoration: BoxDecoration(color: smackPink, boxShadow: [
                  BoxShadow(
                      color: smackBlue.withOpacity(.5),
                      offset: const Offset(0, -5),
                      blurRadius: 4.6),
                ]),
                child: Center(
                  child: SmackText(
                      text: 'Sumbit',
                      showShimmer: controller.isValidated,
                      strokeColor: mainStrokeColor,
                      textColor: smackGreen,
                      size: 30),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 6.h,
                  ),
                  Center(
                    child: SmackTextInput(
                        isPassword: false,
                        hintText: 'Strain Name',
                        action: (v) {
                          controller.strainName = v;
                          controller.validateForm();
                        }),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    width: 95.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ImagePickerButton(
                            controller: controller, label: 'select image'),
                        SmackTextInput(
                          isPassword: false,
                          action: (v) {
                            controller.strainType = v;
                            controller.validateForm();
                          },
                          initialValue: controller.strainType ?? 'Hybrid',
                          icon: StrainTypeSelector(
                            controller: controller,
                          ),
                          width: 40,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  ImageContainer(controller: controller),
                  SizedBox(
                    height: 4.h,
                  ),
                  EffectSlider(controller: controller),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SmackTextInput(
                          isPassword: false,
                          width: 25,
                          hintText: 'Qt Price',
                          action: (v) {
                            controller.quarterDonation = v;
                            controller.validateForm();
                          }),
                      SmackTextInput(
                          isPassword: false,
                          width: 25,
                          hintText: 'Half Price',
                          action: (v) {
                            controller.halfDonation = v;
                            controller.validateForm();
                          }),
                      SmackTextInput(
                          isPassword: false,
                          width: 25,
                          hintText: 'Oz Price',
                          action: (v) {
                            controller.ozDonation = v;
                            controller.validateForm();
                          }),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SmackTextInput(
                          isPassword: false,
                          width: 45,
                          hintText: 'THC Level',
                          action: (v) {
                            controller.thcLevel = v;
                            controller.validateForm();
                          }),
                      SmackTextInput(
                          isPassword: false,
                          width: 45,
                          hintText: 'CBD Level',
                          action: (v) {
                            controller.cbdLevel = v;
                            controller.validateForm();
                          }),
                    ],
                  ),
                ],
              ),
            )));
  }

  final Widget loader = const Center(
      child: SpinKitDoubleBounce(
    color: smackPink,
  ));
}
