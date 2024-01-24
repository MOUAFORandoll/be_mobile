import 'package:BananaExpress/styles/app_theme.dart';
import 'package:BananaExpress/application/livraison/repositories/livraisonRepo.dart';
import 'package:BananaExpress/application/user/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'presentation/_commons/theming/app_theme.dart';
import 'routes/app_router.dart';
import 'styles/colorApp.dart';
import 'styles/textStyle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:generated/l10n.dart';
import 'core.dart' as co;
import 'utils/Services/NotificationService.dart';
import 'utils/Services/routes.dart';
import 'package:get_it/get_it.dart';
import 'package:BananaExpress/application/export_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  co.init();

  NotificationService().initializePlatformNotifications();

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('fr', 'FR'), Locale('en', 'US')],
        path: 'assets/translations',
        fallbackLocale: const Locale('fr', 'FR'),
        child: const MyApp()),
  );
}
// Future<void> main() async {
//   await initApp();
//   runApp(MyApp());
// }

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
final sl = GetIt.instance;

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AppActionCubit>(
            create: (BuildContext context) => AppActionCubit(),
          ),
          BlocProvider<DatabaseCubit>(
            create: (BuildContext context) => DatabaseCubit(),
          ),
          BlocProvider<LivraisonBloc>(
            create: (BuildContext context) => LivraisonBloc(
              livraisonRepo: sl.get<LivraisonRepo>(),
            ),
          ),
          BlocProvider<UserBloc>(
            create: (BuildContext context) => UserBloc(
                userRepo: sl.get<UserRepo>(),
                database: sl.get<DatabaseCubit>()),
          ),
          BlocProvider<HomeBloc>(
            create: (BuildContext context) =>
                HomeBloc(database: sl.get<DatabaseCubit>()),
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
  AppContent({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
      title: "Babana Express",
      darkTheme: AppThemes.themeDataDark,
      themeMode: ThemeMode.light,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: (context, router) {
        FToastBuilder();
        return ResponsiveBreakpoints.builder(
          breakpoints: const [
            Breakpoint(start: 0, end: 450, name: MOBILE),
            Breakpoint(start: 451, end: 800, name: TABLET),
            Breakpoint(start: 801, end: 1920, name: DESKTOP),
            Breakpoint(start: 1921, end: double.infinity, name: 'XL'),
          ],
          child: ClampingScrollWrapper.builder(context, router!),
        );
      },
      theme: lightTheme(context),
    );
  }
}
