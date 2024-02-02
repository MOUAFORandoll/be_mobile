import '../../components/exportcomponent.dart';

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
        bodyMedium: TextStyle(
          fontFamily: 'Lato', // Assure que Lato est utilisé partout
          fontSize:
              kBasics, // Remplacez 16 par votre taille de texte par défaut souhaitée
          color:
              Colors.black, // La couleur par défaut du texte, peut être ajustée
        ),
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
