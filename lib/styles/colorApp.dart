import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ColorsApp {
  static const Color primary = Color(0xFF272D2F);
  static const Color second = Color(0xFFFE724C);
  static const Color tird = Color(0xFFFFC529);
  static const Color bg = Color.fromARGB(255, 241, 242, 242);

  static const Color grey = Color(0xffD7D7D7);
  static const Color white = Color(0xFFFFFFFF);

  static const Color orange = Color(0xffF29F05);
  static Color textColor =
      Get.isDarkMode ? Color(0xffB40001) : Color(0xFFF1F6FA);
}
