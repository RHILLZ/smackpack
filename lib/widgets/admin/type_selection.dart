import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smackpack/controllers/admin_controller.dart';
import 'package:smackpack/core/styles.dart';
import 'package:smackpack/data/models/product.dart';

class StrainTypeSelector extends StatelessWidget {
  const StrainTypeSelector(
      {super.key, required AdminController controller, Product? product})
      : _controller = controller,
        _product = product;

  final AdminController _controller;
  final Product? _product;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      width: 40.w,
      padding: EdgeInsets.only(left: 1.w),
      decoration: BoxDecoration(
          border: Border.all(width: 1), borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _product != null
                ? _product!.strainType
                : _controller.strainType ?? 'Hybird',
            style: const TextStyle(fontSize: 18),
          ),
          menu()
        ],
      ),
    );
  }

  Widget menu() => PopupMenuButton(
        constraints: BoxConstraints(minWidth: 39.w),
        icon: const Icon(
          Icons.arrow_drop_down_circle_outlined,
          color: smackPink,
        ),
        // padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
        itemBuilder: (context) => <PopupMenuEntry>[
          PopupMenuItem(
            child: const Text('Hybrid'),
            onTap: () => _controller.strainType = 'Hybrid',
          ),
          PopupMenuItem(
            child: const Text('Sativa'),
            onTap: () => _controller.strainType = 'Sativa',
          ),
          PopupMenuItem(
            child: const Text('Indica'),
            onTap: () => _controller.strainType = 'Indica',
          ),
        ],
        // onSelected: (value) => print('the value is...$value'),
      );
}
