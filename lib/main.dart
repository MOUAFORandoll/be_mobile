import 'package:BananaExpress/application/connected/connected_bloc.dart';
import 'package:BananaExpress/application/database/database_cubit.dart';
import 'package:BananaExpress/application/splash/splash_bloc.dart';
 
import 'package:BananaExpress/application/livraison/repositories/livraisonRepo.dart';
import 'package:BananaExpress/application/user/repositories/user_repository.dart';

import 'package:BananaExpress/presentation/components/exportcomponent.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'infrastructure/_commons/network/env_config.dart';
import 'presentation/_commons/theming/app_theme.dart';
import 'routes/app_router.dart';
import 'core.dart' as co;
import 'core.dart';
import 'package:BananaExpress/application/export_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await EnvManager().init(env: Environment.dev);

  co.init();

  // NotificationService().initializePlatformNotifications();

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('fr', 'FR'), Locale('en', 'US')],
        path: 'assets/translations',
        fallbackLocale: const Locale('fr', 'FR'),
        child: Phoenix(child: const MyApp())),
  );
}

var supportedLocales = const [
  Locale('en', 'EN'),
  Locale('fr', 'FR'),
];

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => sl<ConnectedBloc>()),
      BlocProvider<AppActionCubit>(
        create: (BuildContext context) => AppActionCubit(),
      ),
      BlocProvider<DatabaseCubit>(
        create: (BuildContext context) => DatabaseCubit(),
      ),
      BlocProvider<LivraisonBloc>(
        create: (BuildContext context) => LivraisonBloc(
          livraisonRepo: sl.get<LivraisonRepo>(),
          database: sl.get<DatabaseCubit>(),
        ),
      ),
      BlocProvider<UserBloc>(
        create: (BuildContext context) => UserBloc(
            userRepo: sl.get<UserRepo>(), database: sl.get<DatabaseCubit>()),
      ),
      BlocProvider<SplashBloc>(
        create: (BuildContext context) =>
            SplashBloc(database: sl.get<DatabaseCubit>()),
      ),
      BlocProvider<HomeBloc>(
        create: (BuildContext context) =>
            HomeBloc(database: sl.get<DatabaseCubit>()),
      ),
    ], child: AppContent());
  }
}

class AppContent extends StatelessWidget {
  AppContent({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
      title: 'Babana Express',
      darkTheme: AppThemes().darkTheme,
      themeMode: ThemeMode.light,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: (context, router) {
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
