import '../../components/exportcomponent.dart';

class TexteStyle {
  final errorStyle = TextStyle(
    fontFamily: 'Helvetica',
    fontSize: kBasics,
    color: ColorsApp.black,
  );

  final primaryTextStyle = TextStyle(
    fontFamily: 'Helvetica',
    color: ColorsApp.black,
    fontSize: kBasics,
  );
  final primaryBigTextStyle = TextStyle(
    fontFamily: 'Helvetica',
    color: ColorsApp.black,
    fontSize: kBasics,
  );
  final bprimaryBigTextStyle = TextStyle(
      fontFamily: 'Helvetica',
      color: ColorsApp.black,
      fontSize: kBasics,
      fontWeight: FontWeight.w600);
  final bprimaryTextStyle = TextStyle(
      fontFamily: 'Helvetica',
      color: ColorsApp.black,
      fontSize: kBasics,
      fontWeight: FontWeight.w600);
  final secondaryTextStyle = TextStyle(
    fontFamily: 'Helvetica',
    color: ColorsApp.black,
    fontSize: kBasics,
  );
  final bsecondaryTextStyle = TextStyle(
      fontFamily: 'Helvetica',
      color: ColorsApp.black,
      fontSize: kBasics,
      fontWeight: FontWeight.w600);
  final largeTextStyle = TextStyle(
    fontFamily: 'Helvetica',
    color: ColorsApp.black,
    fontSize: kBasics,
  );
  final blargeTextStyle = TextStyle(
      fontFamily: 'Helvetica',
      color: ColorsApp.black,
      fontSize: kBasics,
      fontWeight: FontWeight.w600);
}

ThemeData darkTheme = ThemeData(
  primaryColor: ColorsApp.white,
  fontFamily: 'Helvetica',
  dividerColor: ColorsApp.white,
  textTheme: TextTheme(
    bodyMedium: TextStyle(fontFamily: 'Helvetica', color: ColorsApp.black),
  ),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.grey,
    brightness: Brightness.dark,
  ).copyWith(background: const Color(0xFF212121)),
);

ThemeData lightTheme(context) => ThemeData(
      fontFamily: 'Helvetica',
      primaryColor: ColorsApp.black,
      iconTheme: IconThemeData(
        color: ColorsApp.black,
      ),
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
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
            fontFamily: 'Helvetica',
            fontSize: kBasics,
            color: ColorsApp.black,
            fontWeight: FontWeight.w700),
      ),
      disabledColor: ColorsApp.black,
      dividerColor: Colors.white54,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.grey,
        brightness: Brightness.light,
      ).copyWith(background: ColorsApp.white).copyWith(
            secondary: ColorsApp.black,
          ),
    );
