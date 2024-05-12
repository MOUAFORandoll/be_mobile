import 'package:BabanaExpress/application/callcenter/repositories/callcenterRepo.dart';
import 'package:BabanaExpress/application/compte/repositories/compteRepo.dart';
import 'package:BabanaExpress/application/connected/connected_bloc.dart';
import 'package:BabanaExpress/application/database/database_cubit.dart';
import 'package:BabanaExpress/application/market/repositories/marketRepo.dart';
import 'package:BabanaExpress/application/pharmacy/repositories/pharmacy_repository.dart';
import 'package:BabanaExpress/application/splash/splash_bloc.dart';

import 'package:BabanaExpress/application/livraison/repositories/livraisonRepo.dart';
import 'package:BabanaExpress/application/user/repositories/user_repository.dart';
import 'package:BabanaExpress/core.dart';
import 'package:BabanaExpress/presentation/_commons/theming/app_theme.dart';

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/routes/app_router.dart';
import 'package:BabanaExpress/utils/Services/NotificationService.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:BabanaExpress/application/export_bloc.dart';

import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class AppContent extends StatelessWidget {
  AppContent({super.key});
  final _appRouter = sl.get<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,
        title: 'Babana Express',
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        builder: (_, router) {
          return MultiBlocProvider(
              providers: [
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
                BlocProvider<CompteBloc>(
                  create: (BuildContext context) => CompteBloc(
                    compteRepo: sl.get<CompteRepo>(),
                    database: sl.get<DatabaseCubit>(),
                  ),
                ),
                BlocProvider<UserBloc>(
                  create: (BuildContext context) => UserBloc(
                      userRepo: sl.get<UserRepo>(),
                      database: sl.get<DatabaseCubit>()),
                ),
                BlocProvider<MarketBloc>(
                  create: (BuildContext context) => MarketBloc(
                      marketRepo: sl.get<MarketRepo>(),
                      database: sl.get<DatabaseCubit>()),
                ),
                BlocProvider<CallcenterBloc>(
                  create: (BuildContext context) => CallcenterBloc(
                      callcenterRepo: sl.get<CallcenterRepo>(),
                      database: sl.get<DatabaseCubit>()),
                ),
                BlocProvider<SplashBloc>(
                  create: (BuildContext context) =>
                      SplashBloc(database: sl.get<DatabaseCubit>()),
                ),
                BlocProvider<HomeBloc>(
                  create: (BuildContext context) =>
                      HomeBloc(database: sl.get<DatabaseCubit>()),
                ),
                BlocProvider<PharmacyBloc>(
                  create: (BuildContext context) =>
                      PharmacyBloc(pharmacyRepo: sl.get<PharmacyRepo>()),
                ),  BlocProvider<PharmacyBloc>(
                  create: (BuildContext context) =>
                      PharmacyBloc(pharmacyRepo: sl.get<PharmacyRepo>()),
                ),
              ],
              child: MaterialApp.router(
                routerConfig: _appRouter.config(),
                debugShowCheckedModeBanner: false,
                title: 'Banana Express',
                darkTheme: darkTheme,
                themeMode: ThemeMode.light,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                builder: (_, router) {
                  return EasyLoading.init()(
                      context,
                      ResponsiveBreakpoints.builder(
                        breakpoints: const [
                          Breakpoint(start: 0, end: 450, name: MOBILE),
                          Breakpoint(start: 451, end: 800, name: TABLET),
                          Breakpoint(start: 801, end: 1920, name: DESKTOP),
                          Breakpoint(
                              start: 1921, end: double.infinity, name: 'XL'),
                        ],
                        child: ClampingScrollWrapper.builder(context, router!),
                      ));
                },
                theme: lightTheme(context),
              ));
        });
  }
}
