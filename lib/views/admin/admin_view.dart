import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smackpack/controllers/controller_exporter.dart';
import 'package:smackpack/core/styles.dart';
import 'package:smackpack/views/admin/edit_product.dart';

import '../../widgets/widgets_export.dart';

class AdminView extends GetView<AdminController> {
  const AdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(gradient: mainGradient),
        ),
        Obx(() => controller.doneLoading
            ? Scaffold(
                backgroundColor: Colors.transparent,
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: ElevatedButton(
                  onPressed: () => Get.toNamed('/add_product_view'),
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      side: const BorderSide(color: mainStrokeColor, width: 2),
                      elevation: 10,
                      padding: const EdgeInsets.all(20),
                      primary: Colors.transparent),
                  child: const GetSmackedButton(
                    topLabel: 'add',
                    bottomLabel: 'product',
                  ),
                ),
                body: CustomScrollView(slivers: <Widget>[
                  SliverAppBar(
                    // forceElevated: true,
                    leadingWidth: 50.w,
                    leading: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 0),
                      child: GestureDetector(
                        onTap: () => controller.exit(),
                        child: const SmackText(
                          text: 'sign out',
                          strokeColor: mainStrokeColor,
                          textColor: smackYellow,
                          size: 16,
                        ),
                      ),
                    ),
                    shadowColor: Colors.black,
                    elevation: 20,
                    // centerTitle: true,
                    backgroundColor: Colors.transparent,
                    pinned: true,
                    snap: false,
                    floating: true,
                    expandedHeight: 20.h,
                    flexibleSpace: const FlexibleSpaceBar(
                      // background: SizedBox(),
                      title: SmackText(
                          text: 'admin',
                          strokeColor: mainStrokeColor,
                          textColor: smackYellow,
                          size: 40),
                      centerTitle: true,
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        GestureDetector(
                          onLongPress: () => controller.deleteProduct(
                              context, controller.products[index]),
                          onTap: () => Get.to(() => EditProductView(
                              product: controller.products[index])),
                          child: ProductTile(
                            product: controller.products[index],
                            isAdmin: true,
                            iconAction: (v) => controller.toggleStock(
                                controller.products[index], v),
                          ),
                        ),
                        SizedBox(
                          height: .5.h,
                        )
                      ],
                    );
                  }, childCount: controller.products.length))
                ]))
            : loader)
      ],
    );
  }

  final loader = const Center(
    child: CircularProgressIndicator.adaptive(),
  );
}
