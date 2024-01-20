import 'package:flutter/cupertino.dart';

import 'colorApp.dart';

import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._(); // this basically makes it so you can instantiate this class

  static final ThemeData themeData = new ThemeData(
    // primarySwatch:  ColorsApp.primary,
    fontFamily: "Raleway",
    useMaterial3: true, appBarTheme: const AppBarTheme(elevation: 0),
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 17.0, horizontal: 20),
      labelStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      floatingLabelStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      errorStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: ColorsApp.red,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: ColorsApp.grey,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: ColorsApp.red,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: ColorsApp.primary,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: ColorsApp.grey,
        ),
      ),
    ),
  );

  static final CupertinoThemeData iosthemeData = new CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: ColorsApp.white,
  );

  static final ThemeData themeDataDark = ThemeData(
    // fontFamily: FontFamily.productSans,
    useMaterial3: true, brightness: Brightness.dark,
    primaryColor: ColorsApp.black,
  );

  static final kTitleStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'CM Sans Serif',
    fontSize: 26.0,
    height: 1.5,
  );

  static final kSubtitleStyle = TextStyle(
    color: Colors.white,
    fontSize: 18.0,
    height: 1.2,
  );
}
