// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';
import 'package:smackpack/data/models/product.dart';

import '../core/styles.dart';
import '../widgets/widgets_export.dart';

class DetailView extends StatelessWidget {
  DetailView({super.key, required Product product}) : _product = product;

  final Product _product;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: const BoxDecoration(gradient: productGradient),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: TypeHeader(type: _product.strainType),
              ),
              SizedBox(
                height: 5.h,
              ),
              SmackText(
                  text: _product.strainName,
                  strokeColor: mainStrokeColor,
                  textColor: smackYellow,
                  showShimmer: true,
                  size: 40),
              SizedBox(
                height: 3.h,
              ),
              EffectLevelIndicator(
                level: _product.effectLevel,
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: 50.h,
                width: 100.w,
                child: _product.strainImageURL != null
                    ? CachedNetworkImage(
                        imageUrl: _product.strainImageURL!,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator.adaptive(),
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/logos/cover_logo.png',
                        fit: BoxFit.cover,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Levels(
                    thcLevel: _product.thcLevel, cbdLevel: _product.cbdLevel),
              ),
              QuarterPriceButton(price: _product.quarterPrice),
              SizedBox(
                height: 2.h,
              ),
              PriceOptions(
                  halfPrice: _product.halfPrice, ozPrice: _product.ozPrice)
            ],
          ),
        ),
      ),
    ]);
  }
}
