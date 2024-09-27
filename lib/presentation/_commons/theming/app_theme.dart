import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ThemeApp {
  static const Color green = Color(0xFF00bec5);
  static const Color primary = Color(0xFF1D1D1B);
  static const Color primary_second = Color(0xFF061D25);
  static const Color black = Color(0xFF1D1D1B);
  static const Color second_second = Color(0xFF0BBC5C);
  static const Color second = Color(0xFF009FE3);
  static const Color tird = Color(0xFFFFC107);
  static const Color bg = Color.fromARGB(255, 248, 250, 250);

  static const Color grey = Color(0xFFb2b2b2);
  static const greyNew =
      Color.fromARGB(255, 238, 238, 238); // Color(0xFFe5e5e5);
  static const Color white = Color(0xFFFFFFFF);

  static const Color orange = Color(0xffF29F05);
  static const Color red = Color.fromARGB(255, 243, 102, 102);

  static const Color secondaryLight = Color(0xFF745B0B);
  static const Color tertiary = Color(0xFF904A42);
  static const Color errorRed = Color(0xFFFF0000);
  static const Color disabledGrey = Color(0xFFDDDEE1);
  static const Color disabledGreySurface = Color(0xFFF5F5F5);
  static const Color scaffoldBackground = Color(0xFFFBFCF5);
  static const Color lightText = Color(0xFFA5ACB8);
  static const Color disabledText = Color(0xFF75788B);
  static const Color boldText = Color(0xFF202C39);

  static TextTheme _textTheme(BuildContext context) {
    final baseTextTheme = Theme.of(context).textTheme;
    final robotoTextTheme = GoogleFonts.robotoTextTheme(baseTextTheme);

    return robotoTextTheme.copyWith(
      displayLarge: robotoTextTheme.displayLarge?.copyWith(
        color: black,
        fontSize: 56.0,
        height: 6.4,
        letterSpacing: -0.25,
      ),
      displayMedium: robotoTextTheme.displayMedium?.copyWith(
        color: black,
        fontSize: 45.0,
        height: 5.2,
        letterSpacing: 0.0,
      ),
      displaySmall: robotoTextTheme.displaySmall?.copyWith(
        color: black,
        fontSize: 36.0,
        fontWeight: FontWeight.bold,
        height: 4.4,
        letterSpacing: 0.0,
      ),
      headlineLarge: robotoTextTheme.headlineLarge?.copyWith(
        color: black,
        fontSize: 32.0,
        height: 4.0,
        letterSpacing: 0.0,
      ),
      headlineMedium: robotoTextTheme.headlineMedium?.copyWith(
        color: black,
        fontSize: 28.0,
        height: 3.6,
        letterSpacing: 0.0,
      ),
      headlineSmall: robotoTextTheme.headlineSmall?.copyWith(
        color: black,
        fontSize: 24.0,
        height: 3.2,
        letterSpacing: 0.0,
      ),
      titleLarge: robotoTextTheme.titleLarge?.copyWith(
          color: black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 0,
          height: 2.8),
      titleMedium: robotoTextTheme.titleMedium?.copyWith(
        color: black,
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        // height: 2.4,
        letterSpacing: 0.0,
      ),
      titleSmall: robotoTextTheme.titleSmall?.copyWith(
        color: black,
        fontSize: 14.0,
        height: 2.0,
        letterSpacing: 0.0,
      ),
      bodyLarge: robotoTextTheme.bodyLarge?.copyWith(
        color: black,
        fontSize: 16.0,
        // fontWeight: FontWeight.bold,
        height: 2.4,
        letterSpacing: 0.5,
      ),
      bodyMedium: robotoTextTheme.bodyMedium?.copyWith(
        color: black,
        fontSize: 14.0,
        height: 2.0,
        letterSpacing: 0.25,
      ),
      bodySmall: robotoTextTheme.bodySmall?.copyWith(
        color: black,
        fontSize: 12.0,
        height: 1.6,
        letterSpacing: 0.4,
      ),
      labelLarge: robotoTextTheme.labelLarge?.copyWith(
          color: black, fontSize: 14.0, letterSpacing: 0.1, height: 2.0),
      labelMedium: robotoTextTheme.labelMedium?.copyWith(
        color: black,
        fontSize: 12.0,
        height: 1.6,
        letterSpacing: 0.5,
      ),
      labelSmall: robotoTextTheme.labelSmall?.copyWith(
        color: black,
        fontSize: 11.0,
        height: 1.6,
        letterSpacing: 0.0,
      ),
    );
  }

  static ThemeData _baseTheme(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = _textTheme(context);

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: second,
        primary: second,
        primaryContainer: second,
        secondary: secondaryLight,
        tertiary: tertiary,
        error: errorRed,
        surfaceVariant: disabledGreySurface,
      ),
      primaryColor: second,
      disabledColor: disabledGrey,
      scaffoldBackgroundColor: white,
      appBarTheme: theme.appBarTheme.copyWith(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        titleTextStyle: textTheme.titleSmall?.copyWith(color: white),
        toolbarTextStyle:
            textTheme.titleLarge?.copyWith(color: theme.colorScheme.onSurface),
        elevation: 0,
        iconTheme: const IconThemeData(color: black),
        systemOverlayStyle:
            const SystemUiOverlayStyle(systemNavigationBarColor: white),
      ),
      bottomNavigationBarTheme:
          theme.bottomNavigationBarTheme.copyWith(backgroundColor: white),
      bottomSheetTheme: theme.bottomSheetTheme.copyWith(
        clipBehavior: Clip.antiAlias,
        backgroundColor: white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.0))),
      ),
      cardTheme: theme.cardTheme.copyWith(
        elevation: 1,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      // subtitle1 :
      checkboxTheme: theme.checkboxTheme.copyWith(
        fillColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected) ? second : null),
      ),
      dividerColor: theme.colorScheme.onSurfaceVariant,
      dialogTheme: DialogTheme(contentTextStyle: textTheme.bodyLarge),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: second,
          foregroundColor: black,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          elevation: 0,
          foregroundColor: black,
          padding: const EdgeInsets.only(bottom: 16.0),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: black,
        focusColor: black,
        hoverColor: black,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: theme.disabledColor),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        hintStyle: textTheme.bodyLarge
            ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        labelStyle: textTheme.bodySmall
            ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        suffixIconColor: black,
        prefixIconColor: black,
        iconColor: black,
        floatingLabelStyle: textTheme.bodySmall?.copyWith(color: black),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: black,
        // selectionColor: black.withOpacity(0.3),
        selectionHandleColor: Color.fromARGB(255, 32, 23, 23),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: second,
          side: const BorderSide(color: second),
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          textStyle: textTheme.labelMedium!.copyWith(color: white),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: second,
          padding: const EdgeInsets.symmetric(horizontal: 56.0, vertical: 8.0),
          shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(100.0)),
          elevation: 0,
          side: BorderSide.none,
          textStyle: textTheme.labelMedium!.copyWith(color: white),
          minimumSize: const Size.fromHeight(40.0),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: Colors.white,
        selectedColor: second,
        labelStyle: textTheme.labelLarge,
        // padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        shape: RoundedRectangleBorder(
            side: BorderSide.none, borderRadius: BorderRadius.circular(100.0)),
        side: BorderSide.none,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: second,
        foregroundColor: black,
        elevation: 4,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: second,
        contentTextStyle: textTheme.bodyMedium?.copyWith(color: white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        behavior: SnackBarBehavior.floating,
      ),
      listTileTheme:
          theme.listTileTheme.copyWith(titleTextStyle: textTheme.titleSmall),
      popupMenuTheme:
          theme.popupMenuTheme.copyWith(textStyle: textTheme.labelSmall),
      switchTheme: theme.switchTheme.copyWith(
        thumbColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected) ? second : null),
      ),
      textTheme: textTheme,
    );
  }

  static ThemeData lightTheme(BuildContext context) => _baseTheme(context);
}
