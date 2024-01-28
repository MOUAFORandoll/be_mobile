import 'package:flutter/material.dart';
import 'package:get/get.dart';

final kWidthShort = Get.width / 2;
final kHeightShort = Get.height / 5;

final designSize = 414.0;
double proportion = MediaQuery.textScaleFactorOf(
    Get.context!); //  screenSize.width / designSize;
// final proportion = designSize / screenSize.width;
 
final kMarginBottom = 10;
final kMarginLeft = 10;
final kMarginRight = 10;
final kMarginX = 12.0;
final kMarginY = 10.0;

final kPaddingTop = 10;
final kPaddingBottom = 10;
final kPaddingLeft = 10;
final kPaddingRight = 10;
final kPaddingX = 10;
final kPaddingY = 10;
 

final kTitle = 14.0 /* * proportion */;
final kDescription = 9.0 /* * proportion */;
final kBasics = 10.0 /* * proportion */;
final kMin = 7.0;
final kLgText = kTitle;

final kSmIcon = 28.0;
final kMdIcon = 30.0;
final kLgIcon = 32.0;
final kXlIcon = 34.0;
