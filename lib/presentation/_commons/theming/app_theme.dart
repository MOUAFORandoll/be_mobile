import '../../components/exportcomponent.dart';


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
    fontSize: kBasics,
  );
  final blargeTextStyle = TextStyle(
      fontFamily: 'Lato',
      color: ColorsApp.primary,
      fontSize: kBasics,
      fontWeight: FontWeight.w600);
}

ThemeData darkTheme = ThemeData(
  primaryColor: ColorsApp.white,
  fontFamily: 'Lato',
  dividerColor: ColorsApp.white,
  textTheme: TextTheme(
    bodyMedium: TextStyle(fontFamily: 'Lato', color: ColorsApp.primary),
  ),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.grey,
    brightness: Brightness.dark,
  ).copyWith(background: const Color(0xFF212121)),
);

ThemeData lightTheme(context) => ThemeData(
      fontFamily: 'Lato',
      primaryColor: ColorsApp.primary,
      iconTheme: IconThemeData(
        color: ColorsApp.primary,
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
            fontFamily: 'Lato',
            fontSize: kBasics + 2,
            color: ColorsApp.primary,
            fontWeight: FontWeight.w700),
      ),
      disabledColor: ColorsApp.primary,
      dividerColor: Colors.white54,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.grey,
        brightness: Brightness.light,
      ).copyWith(background: ColorsApp.white).copyWith(
            secondary: ColorsApp.primary,
          ),
    );
