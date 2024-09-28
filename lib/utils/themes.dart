import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart'; 

abstract class AppTheme {
  static const Color primaryYellow = Color(0xFFFFCC33);
  static const Color primaryGreen = Color.fromARGB(255, 77, 122, 77);
  static const Color primaryBlack = Color(0xFF090909);
  static const Color primaryRed = Color(0xFFE30613);
  static const Color mainText = primaryBlack;
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color secondaryLight = Color(0xFF745B0B);
  static const Color tertiary = Color(0xFF904A42);
  static const Color errorRed = Color(0xFFFF0000);
  static const Color disabledGrey = Color(0xFFDDDEE1);
  static const Color disabledGreySurface = Color(0xFFF5F5F5);
  static const Color grey = Color(0xFFD9D9D9);
  static const Color disabledText = Color(0xFF75788B);

  static TextTheme _textTheme(BuildContext context) {
    final baseTextTheme = Theme.of(context).textTheme;
    final robotoTextTheme = GoogleFonts.robotoTextTheme(baseTextTheme);
    final arco =
        Theme.of(context).textTheme.apply(fontFamily: 'ARCO');

    return robotoTextTheme.copyWith(
      displayLarge: robotoTextTheme.displayLarge?.copyWith(
        color: mainText,
        fontSize: 57.0,
      ),
      displayMedium: robotoTextTheme.displayMedium?.copyWith(
        color: mainText,
        fontSize: 45.0,
      ),
      displaySmall: arco.displaySmall?.copyWith(
        color: mainText,
        fontSize: 36.0,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: robotoTextTheme.headlineLarge?.copyWith(
        color: mainText,
        fontSize: 32.0,
      ),
      headlineMedium: robotoTextTheme.headlineMedium?.copyWith(
        color: mainText,
        fontSize: 28.0,
      ),
      headlineSmall: robotoTextTheme.headlineSmall?.copyWith(
        color: mainText,
        fontSize: 24.0,
      ),
      titleLarge: arco.titleLarge?.copyWith(
        color: mainText,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: robotoTextTheme.titleMedium?.copyWith(
        color: mainText,
        fontSize: 16.0,
      ),
      titleSmall: robotoTextTheme.titleSmall?.copyWith(
        color: mainText,
        fontSize: 14.0,
      ),
      bodyLarge: arco.bodyLarge?.copyWith(
        color: mainText,
        fontSize: 16.0,
      ),
      bodyMedium: arco.bodyMedium?.copyWith(
        color: mainText,
        fontSize: 14.0,
      ),
      bodySmall: arco.bodySmall?.copyWith(
        color: mainText,
        fontSize: 12.0,
      ),
      labelLarge: arco.labelLarge?.copyWith(
        color: mainText,
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: robotoTextTheme.labelMedium?.copyWith(
        color: mainText,
        fontSize: 12.0,
      ),
      labelSmall: robotoTextTheme.labelSmall?.copyWith(
        color: mainText,
        fontSize: 11.0,
      ),
    );
  }

  static ColorScheme _colorScheme([Brightness brightness = Brightness.light]) {
    return ColorScheme.fromSeed(
      seedColor: primaryYellow,
      primary: primaryYellow,
      secondary: primaryYellow,
      tertiary: primaryRed,
      brightness: brightness,
    );
  }

  static ThemeData _baseTheme(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = _colorScheme();
    final textTheme = _textTheme(context);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme.copyWith(
        surface: white
      ),
      primaryColor: primaryYellow,
      disabledColor: disabledGrey,
      appBarTheme: theme.appBarTheme.copyWith(
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: colorScheme.surface,
          systemNavigationBarDividerColor: colorScheme.surface,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark
        ),
      ),
      bottomNavigationBarTheme: theme.bottomNavigationBarTheme.copyWith(
        backgroundColor: white,
        selectedItemColor: black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          fontSize: 16,
          color: black,
        ),
        unselectedLabelStyle: const TextStyle(fontSize: 0),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        enableFeedback: true,
        mouseCursor: WidgetStateProperty.all(MouseCursor.defer),
        selectedIconTheme: const IconThemeData(
          color: black,
          size: 24,
        ),
        unselectedIconTheme: const IconThemeData(
          color: Color(0xFF4C4639),
          size: 24,
        ),
      ),
      bottomSheetTheme: theme.bottomSheetTheme.copyWith(
        clipBehavior: Clip.antiAlias,
        backgroundColor: white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.0))),
      ),
      cardTheme: theme.cardTheme.copyWith(
        color: Theme.of(context).colorScheme.surface,
        margin: const EdgeInsets.all(0.0),
        elevation: 1,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      checkboxTheme: theme.checkboxTheme.copyWith(
        fillColor: WidgetStateProperty.resolveWith((states) =>
            states.contains(WidgetState.selected) ? primaryYellow : null),
      ),
      dividerColor: theme.colorScheme.onSurfaceVariant,
      dialogTheme: DialogTheme(contentTextStyle: textTheme.bodyLarge),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryYellow,
          foregroundColor: mainText,
          shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(100.0)),
          elevation: 0,
          side: BorderSide.none,
          textStyle: textTheme.labelMedium,
          maximumSize: const Size.fromHeight(40.0),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          elevation: 0,
          foregroundColor: mainText,
          padding: const EdgeInsets.only(bottom: 16.0),
        ),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: mainText,
        unselectedLabelColor: disabledText,
        indicatorColor: primaryYellow,
        labelStyle: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        unselectedLabelStyle: textTheme.titleSmall,
        indicatorSize: TabBarIndicatorSize.tab,
        labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: colorScheme.surfaceContainerHighest,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        )
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: primaryYellow,
          side: const BorderSide(color: primaryYellow),
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          textStyle: textTheme.labelMedium,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: primaryYellow,
          padding: const EdgeInsets.symmetric(horizontal: 56.0, vertical: 8.0),
          shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(100.0)),
          elevation: 0,
          side: BorderSide.none,
          textStyle: textTheme.labelMedium,
          minimumSize: const Size.fromHeight(40.0),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: Colors.white,
        selectedColor: primaryYellow,
        labelStyle: Theme.of(context).textTheme.labelLarge,
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: black),
            borderRadius: BorderRadius.circular(100.0)),
        side: const BorderSide(color: black),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryYellow,
        foregroundColor: mainText,
        elevation: 4,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: primaryBlack,
        contentTextStyle: textTheme.bodyMedium?.copyWith(color: white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        behavior: SnackBarBehavior.floating,
      ),
      listTileTheme:
          theme.listTileTheme.copyWith(titleTextStyle: textTheme.titleSmall),
      popupMenuTheme:
          theme.popupMenuTheme.copyWith(textStyle: textTheme.labelMedium),
      switchTheme: theme.switchTheme.copyWith(
        thumbColor: WidgetStateProperty.resolveWith((states) =>
            states.contains(WidgetState.selected) ? primaryYellow : null),
      ),
      textTheme: textTheme,
    );
  }

  static ThemeData lightTheme(BuildContext context) => _baseTheme(context);

  static ThemeData primaryColorTheme(BuildContext context) {
    final baseTheme = lightTheme(context);

    return baseTheme.copyWith(
      scaffoldBackgroundColor: primaryYellow,
      appBarTheme: baseTheme.appBarTheme.copyWith(
        backgroundColor: primaryYellow,
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: primaryYellow,
          systemNavigationBarDividerColor: primaryYellow,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        )
      )
    );
  }

  static ThemeData fullBlackTheme(BuildContext context) {
    final baseTheme = _baseTheme(context);
    final colorScheme = _colorScheme(Brightness.dark);

    return baseTheme.copyWith(
      brightness: Brightness.dark,
      appBarTheme: baseTheme.appBarTheme.copyWith(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        iconTheme: baseTheme.appBarTheme.iconTheme?.copyWith(
          color: colorScheme.onSurface
        ),
        titleTextStyle: baseTheme.appBarTheme.titleTextStyle?.copyWith(
          color: colorScheme.onSurface
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: colorScheme.surface,
          systemNavigationBarDividerColor: colorScheme.surface,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light
        )
      ),
      scaffoldBackgroundColor: colorScheme.surface
    );
  }
}
