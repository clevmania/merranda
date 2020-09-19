import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double defaultSize;
  static Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    orientation = _mediaQueryData.orientation;
  }
}

double getProportionateScreenHeight(double height) {
  double scrHeight = SizeConfig.screenHeight;
  return (scrHeight / 812.0) * height;
}

double getProportionateScreenWidth(double width) {
  double scrWidth = SizeConfig.screenWidth;
  return (scrWidth / 375.0) * width;
}
