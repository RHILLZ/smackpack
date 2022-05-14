import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smackpack/core/styles.dart';
import 'package:smackpack/data/models/product.dart';

import 'package:smackpack/views/detailView.dart';
import 'package:smackpack/widgets/widgets_export.dart';

class ProductTile extends StatelessWidget {
  const ProductTile(
      {Key? key,
      required Product product,
      required Function iconAction,
      required bool isAdmin})
      : _product = product,
        _isAdmin = isAdmin,
        _iconAction = iconAction,
        super(key: key);

  final Product _product;
  final Function _iconAction;
  final bool _isAdmin;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      width: 95.w,
      decoration: BoxDecoration(
        borderRadius: buttonBorderRadius,
        boxShadow: const [priceBoxShadow],
        gradient: _product.isInStock ? productTileGradient : outOfStockGradient,
        // color: smackBlue.withOpacity(.5)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FittedBox(fit: BoxFit.fitWidth, child: strainName()),
              strainType()
            ],
          ),
          price(),
          _isAdmin
              ? toggleSwitch(_product)
              : IconButton(
                  onPressed: () => _goToDetails(_product), icon: infoIcon)
        ],
      ),
    );
  }

  Widget strainName() => SmackText(
      text: _product.strainName,
      strokeColor: mainStrokeColor,
      textColor: mainTextColor,
      size: 26);
  Widget strainType() => SmackText(
      text: _product.strainType,
      strokeColor: smackGreen,
      textColor: smackBlue,
      size: 18);
  Widget price() => SmackText(
      text: '\$${_product.quarterPrice}',
      strokeColor: mainStrokeColor,
      textColor: mainTextColor,
      size: 40);

  _goToDetails(Product product) {
    Get.to(DetailView(product: product));
  }

  Widget toggleSwitch(Product product) => Switch.adaptive(
      inactiveTrackColor: errorColor,
      value: product.isInStock,
      onChanged: (v) => _iconAction(v));
}
