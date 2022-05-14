import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// App Colors
const Color smackGreen = Color(0xffABFF68);
const Color smackYellow = Color(0xffEDFF18);
const Color smackPink = Color(0xffF58EFE);
const Color smackBlue = Color(0xff4A33D4);

const Color errorColor = Colors.red;
const Color errorTextColor = Colors.white;

const LinearGradient mainGradient = LinearGradient(
    colors: [smackBlue, smackBlue, smackPink],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);
const LinearGradient gyGradient = LinearGradient(
    colors: [smackGreen, smackGreen, smackYellow],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);
const LinearGradient productTileGradient =
    LinearGradient(colors: [smackPink, smackYellow, smackGreen, smackBlue]);
const LinearGradient productGradient = LinearGradient(
    colors: [smackPink, smackYellow, smackGreen, smackBlue],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);
const LinearGradient outOfStockGradient = LinearGradient(
    colors: [Colors.black45, Colors.grey, Colors.black38, Colors.grey],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);
const LinearGradient effectGradient =
    LinearGradient(colors: [smackBlue, smackGreen]);

const Color mainTextColor = Colors.white;
const Color mainStrokeColor = Colors.black;

// Shadows
const BoxShadow buttonBoxShadow =
    BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 4);
const BoxShadow priceBoxShadow =
    BoxShadow(color: Colors.black87, offset: Offset(0, 4), blurRadius: 10);

// Border
BoxBorder thinBorder =
    Border.all(color: Colors.black, width: 1.0, style: BorderStyle.solid);
BoxBorder mainBorder =
    Border.all(color: Colors.black, width: 2.0, style: BorderStyle.solid);
BoxBorder thickBorder =
    Border.all(color: Colors.black, width: 3.0, style: BorderStyle.solid);

// Radius
const BorderRadius buttonBorderRadius = BorderRadius.all(Radius.circular(16));

// Padding
const EdgeInsets mainPadding = EdgeInsets.all(7);

//icons

const Icon infoIcon = Icon(
  Icons.info_outline,
  color: Colors.white,
  size: 40,
);

Icon thcIcon = Icon(
  Icons.diamond_rounded,
  size: 20.sp,
  color: smackYellow,
);
Icon cbdIcon = Icon(
  Icons.circle,
  size: 20.sp,
  color: smackPink,
);

//TextStyle

const TextStyle textStyle1 =
    TextStyle(fontSize: 16, color: mainTextColor, fontFamily: 'BadaBoom');
