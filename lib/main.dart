import 'package:BananaExpress/styles/app_theme.dart';
import 'package:BananaExpress/ui/user/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'styles/colorApp.dart';
import 'styles/textStyle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:generated/l10n.dart';
import 'utils/Services/routes.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() {
  runApp(MyApp());
}

final _darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: ColorsApp.primary,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  dividerColor: ColorsApp.primary,
  textTheme: TextTheme(
    bodyText2: TextStyle(fontFamily: 'Montserrat', color: ColorsApp.primary),
  ),
);

final _lightTheme = ThemeData(
  // primaryColor: Colors.white,
  brightness: Brightness.light,
  iconTheme: IconThemeData(
    color: ColorsApp.primary,
  ),
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: kBasics + 1,
        color: ColorsApp.primary,
        fontWeight: FontWeight.w700),
  ),
  dividerColor: Colors.white54,
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kBasics,
      color: ColorsApp.primary,
    ),
    displayLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      fontSize: kBasics,
      color: ColorsApp.primary,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kBasics,
      color: ColorsApp.primary,
    ),
    displaySmall: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kBasics,
      color: ColorsApp.primary,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kBasics,
      color: ColorsApp.primary,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kBasics,
      color: ColorsApp.primary,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kTitle,
      color: ColorsApp.primary,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kTitle,
      color: ColorsApp.primary,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kTitle,
      color: ColorsApp.primary,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kBasics,
      color: ColorsApp.primary,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kBasics,
      color: ColorsApp.primary,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kBasics,
      color: ColorsApp.primary,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kBasics,
      color: ColorsApp.primary,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.grey,
    backgroundColor: ColorsApp.bg,
    errorColor: ColorsApp.second,
  ),
);

var supportedLocales = const [
  Locale('en', 'EN'),
  Locale('fr', 'FR'),
];

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(),
        ),
      ],
      child:
            AppContent() /* EasyLocalization(
        path: 'assets/lang',
        supportedLocales: supportedLocales,
        fallbackLocale: const Locale('fr', 'FR'),
        child: const AppContent(),
      ), */
    );
  }
}

class AppContent extends StatelessWidget {
  const AppContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Babana Express",
      darkTheme: AppThemes.themeDataDark,
      theme: AppThemes.themeData,
      themeMode: ThemeMode.light,
      // localizationsDelegates: const [
       
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: supportedLocales,
      initialRoute: AppLinks.SPLASHSCREEN,
      routes: AppRoutes.routes,
      // locale: context.locale,
    );
  }
}
