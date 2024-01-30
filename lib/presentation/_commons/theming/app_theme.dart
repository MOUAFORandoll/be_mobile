import '../../components/exportcomponent.dart';   

ThemeData darkTheme = ThemeData(
  primaryColor: ColorsApp.primary,
  dividerColor: ColorsApp.primary,
  textTheme: TextTheme(
    bodyMedium: TextStyle(fontFamily: 'Lato', color: ColorsApp.primary),
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
            fontFamily: 'Lato',
            height: 1.4,
            fontSize: kBasics + 1,
            color: ColorsApp.primary,
            fontWeight: FontWeight.w700),
      ),
      disabledColor: ColorsApp.primary,
      dividerColor: Colors.white54,
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontFamily: 'Lato',
          height: 1.4,
          fontSize: kBasics,
          color: ColorsApp.primary,
        ),
        displayLarge: TextStyle(
          fontFamily: 'Lato',
          height: 1.4,
          fontWeight: FontWeight.bold,
          fontSize: kBasics,
          color: ColorsApp.primary,
        ),
        displayMedium: TextStyle(
          fontFamily: 'Lato',
          height: 1.4,
          fontSize: kBasics,
          color: ColorsApp.primary,
        ),
        displaySmall: TextStyle(
          fontFamily: 'Lato',
          height: 1.4,
          fontSize: kBasics,
          color: ColorsApp.primary,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Lato',
          height: 1.4,
          fontSize: kBasics,
          color: ColorsApp.primary,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Lato',
          height: 1.4,
          fontSize: kBasics,
          color: ColorsApp.primary,
        ),
        titleLarge: TextStyle(
          fontFamily: 'Lato',
          height: 1.4,
          fontSize: kBasics,
          color: ColorsApp.primary,
        ),
        titleMedium: TextStyle(
          fontFamily: 'Lato',
          height: 1.4,
          fontSize: kBasics,
          color: ColorsApp.primary,
        ),
        titleSmall: TextStyle(
          fontFamily: 'Lato',
          height: 1.4,
          fontSize: kBasics,
          color: ColorsApp.primary,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Lato',
          height: 1.4,
          fontSize: kBasics,
          color: ColorsApp.primary,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Lato',
          height: 1.4,
          fontSize: kBasics,
          color: ColorsApp.primary,
        ),
        labelLarge: TextStyle(
          fontFamily: 'Lato',
          height: 1.4,
          fontSize: kBasics,
          color: ColorsApp.primary,
        ),
        labelSmall: TextStyle(
          fontFamily: 'Lato',
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
