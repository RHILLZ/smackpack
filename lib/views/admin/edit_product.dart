import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smackpack/controllers/controller_exporter.dart';
import 'package:smackpack/core/styles.dart';
import 'package:smackpack/data/models/product.dart';
import '../../widgets/widgets_export.dart';

class EditProductView extends GetView<AdminController> {
  const EditProductView({super.key, required Product product})
      : _product = product;

  final Product _product;
  @override
  Widget build(BuildContext context) {
    final prod = _product.toJson();
    return Obx(() => controller.isProcessing
        ? loader
        : Scaffold(
            bottomNavigationBar: GestureDetector(
              onTap: () => controller.updateProduct(Product.fromJson(prod)),
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
                      text: 'Update',
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
                        initialValue: _product.strainName,
                        hintText: 'Strain Name',
                        action: (v) {
                          prod['strainName'] = v;
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
                            controller: controller, label: 'change image'),
                        SmackTextInput(
                          isPassword: false,
                          action: (v) {
                            prod['strainType'] = v;
                          },
                          initialValue: _product.strainType,
                          icon: StrainTypeSelector(
                            controller: controller,
                            product: _product,
                          ),
                          width: 40,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  ImageContainer(
                    controller: controller,
                    product: _product,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  EffectSlider(
                    controller: controller,
                    product: _product,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SmackTextInput(
                          isPassword: false,
                          initialValue: _product.quarterPrice,
                          width: 25,
                          hintText: 'Qt Price',
                          action: (v) {
                            prod['quarterPrice'] = v;
                          }),
                      SmackTextInput(
                          isPassword: false,
                          initialValue: _product.halfPrice,
                          width: 25,
                          hintText: 'Half Price',
                          action: (v) {
                            prod['halfPrice'] = v;
                          }),
                      SmackTextInput(
                          isPassword: false,
                          initialValue: _product.ozPrice,
                          width: 25,
                          hintText: 'Oz Price',
                          action: (v) {
                            prod['ozPrice'] = v;
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
                          initialValue: _product.thcLevel,
                          width: 45,
                          hintText: 'THC Level',
                          action: (v) {
                            prod['thcLevel'] = v;
                          }),
                      SmackTextInput(
                          isPassword: false,
                          initialValue: _product.cbdLevel,
                          width: 45,
                          hintText: 'CBD Level',
                          action: (v) {
                            prod['cbdLevel'] = v;
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
