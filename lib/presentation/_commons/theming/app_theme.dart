import 'app_color.dart';
import 'dimension.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: ColorsApp.primary,
  dividerColor: ColorsApp.primary,
  textTheme: TextTheme(
    bodyMedium: TextStyle(fontFamily: 'Montserrat', color: ColorsApp.primary),
  ),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.grey,
    brightness: Brightness.dark,
  ).copyWith(background: const Color(0xFF212121)),
);

ThemeData lightTheme(BuildContext context) => ThemeData(
      primaryColor: Colors.white,
      iconTheme: IconThemeData(
        color: ColorsApp.primary,
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
            fontFamily: 'Montserrat',
            height: 1.4,
            fontSize: kBasics + 1,
            color: ColorsApp.primary,
            fontWeight: FontWeight.w700),
      ),
      
      disabledColor: ColorsApp.primary,
      dividerColor: Colors.white54,
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontFamily: 'Montserrat',
          height: 1.4,
          fontSize: kBasics,
          color: ColorsApp.primary,
        ),
        displayLarge: TextStyle(
          fontFamily: 'Montserrat',
          height: 1.4,
          fontWeight: FontWeight.bold,
          fontSize: kBasics,
          color: ColorsApp.primary,
        ),
        displayMedium: TextStyle(
          fontFamily: 'Montserrat',
          height: 1.4,
          fontSize: kBasics,
          color: ColorsApp.primary,
        ),
        displaySmall: TextStyle(
          fontFamily: 'Montserrat',
          height: 1.4,
          fontSize: kBasics,
          color: ColorsApp.primary,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Montserrat',
          height: 1.4,
          fontSize: kBasics,
          color: ColorsApp.primary,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Montserrat',
          height: 1.4,
          fontSize: kBasics,
          color: ColorsApp.primary,
        ),
        titleLarge: TextStyle(
          fontFamily: 'Montserrat',
          height: 1.4,
          fontSize: kBasics,
          color: ColorsApp.primary,
        ),
        titleMedium: TextStyle(
          fontFamily: 'Montserrat',
          height: 1.4,
          fontSize: kBasics,
          color: ColorsApp.primary,
        ),
        titleSmall: TextStyle(
          fontFamily: 'Montserrat',
          height: 1.4,
          fontSize: kBasics,
          color: ColorsApp.primary,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Montserrat',
          height: 1.4,
          fontSize: kBasics,
          color: ColorsApp.primary,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Montserrat',
          height: 1.4,
          fontSize: kBasics,
          color: ColorsApp.primary,
        ),
        labelLarge: TextStyle(
          fontFamily: 'Montserrat',
          height: 1.4,
          fontSize: kBasics,
          color: ColorsApp.primary,
        ),
        labelSmall: TextStyle(
          fontFamily: 'Montserrat',
          height: 1.4,
          fontSize: kBasics,
          color: ColorsApp.primary,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.grey,
        brightness: Brightness.light,
      ).copyWith(background: ColorsApp.white).copyWith(
            secondary: ColorsApp.primary,
          ),
    );
