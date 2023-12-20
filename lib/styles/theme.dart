import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:flutter/material.dart';

class TexteStyle {
  final errorStyle = TextStyle(
    fontFamily: 'Lato',
    fontSize: kBasics,
    color: ColorsApp.second,
  );

  final primaryTextStyle = TextStyle(
    fontFamily: 'Lato',
    color: ColorsApp.primary,
    fontSize: kBasics,
  );
  final primaryBigTextStyle = TextStyle(
    fontFamily: 'Lato',
    color: ColorsApp.primary,
    fontSize: kBasics,
  );
  final bprimaryBigTextStyle = TextStyle(
      fontFamily: 'Lato',
      color: ColorsApp.primary,
      fontSize: kBasics,
      fontWeight: FontWeight.w600);
  final bprimaryTextStyle = TextStyle(
      fontFamily: 'Lato',
      color: ColorsApp.primary,
      fontSize: kBasics,
      fontWeight: FontWeight.w600);
  final secondaryTextStyle = TextStyle(
    fontFamily: 'Lato',
    color: ColorsApp.primary,
    fontSize: kBasics,
  );
  final bsecondaryTextStyle = TextStyle(
      fontFamily: 'Lato',
      color: ColorsApp.primary,
      fontSize: kBasics,
      fontWeight: FontWeight.w600);
  final largeTextStyle = TextStyle(
    fontFamily: 'Lato',
    color: ColorsApp.primary,
    fontSize: kTitle,
  );
  final blargeTextStyle = TextStyle(
      fontFamily: 'Lato',
      color: ColorsApp.primary,
      fontSize: kTitle,
      fontWeight: FontWeight.w600);
}

class ThemeStyle {
  final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: ColorsApp.primary,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    dividerColor: ColorsApp.grey,
    textTheme: TextTheme(
      bodyText2: TextStyle(fontFamily: 'Lato', color: ColorsApp.primary),
    ),
  );

  final lightTheme = ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.light,
    // Couleur du texte principal
    backgroundColor: ColorsApp.bg,

    primaryTextTheme: TextTheme(headline6: TexteStyle().primaryTextStyle),

    // Couleur du bouton pour autoriser la localisation
    // Couleur du bouton pour refuser la localisation
    disabledColor: ColorsApp.grey,
    dividerColor: Colors.white54,

    textTheme: TextTheme(
      bodyLarge: TexteStyle().largeTextStyle,
      displayLarge: TexteStyle().largeTextStyle,
      displayMedium: TexteStyle().secondaryTextStyle,
      displaySmall: TexteStyle().primaryTextStyle,
      headlineMedium: TexteStyle().secondaryTextStyle,
      headlineSmall: TexteStyle().primaryTextStyle,
      bodyMedium: TexteStyle().largeTextStyle,
      bodySmall: TexteStyle().primaryTextStyle,
      labelLarge: TexteStyle().largeTextStyle,
      labelSmall: TexteStyle().primaryTextStyle,
      titleLarge: TexteStyle().largeTextStyle,
      titleMedium: TexteStyle().secondaryTextStyle,
      titleSmall: TexteStyle().largeTextStyle,
    ),
    appBarTheme: const AppBarTheme(
        foregroundColor: ColorsApp.bg, backgroundColor: ColorsApp.second),

    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
        .copyWith(background: ColorsApp.bg)
        .copyWith(
          secondary: ColorsApp.primary,
        ),
  );
}
