import 'package:BabanaExpress/application/callcenter/repositories/callcenterRepo.dart';
import 'package:BabanaExpress/application/compte/repositories/compteRepo.dart';
import 'package:BabanaExpress/application/connected/connected_bloc.dart';
import 'package:BabanaExpress/application/database/database_cubit.dart';
import 'package:BabanaExpress/application/splash/splash_bloc.dart';

import 'package:BabanaExpress/application/livraison/repositories/livraisonRepo.dart';
import 'package:BabanaExpress/application/user/repositories/user_repository.dart';
import 'package:BabanaExpress/core.dart';
import 'package:BabanaExpress/presentation/_commons/theming/app_theme.dart';

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/routes/app_router.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/utils/Services/auth_social_service%20.dart';

import 'package:responsive_framework/responsive_framework.dart';

class AppContent extends StatelessWidget {
  AppContent({super.key});
  final _appRouter = sl.get<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
      title: 'Babana Express',
      // darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: (_, router) {
        return BlocProviders(
          child: EasyLoading.init()(
            context,
            ResponsiveBreakpoints.builder(
              breakpoints: const [
                Breakpoint(start: 0, end: 1920, name: 'default'),
              ],
              child: ClampingScrollWrapper.builder(context, router!),
            ),
          ),
        );
      },
      theme: ThemeApp.lightTheme(context),
    );
  }
}

class BlocProviders extends StatelessWidget {
  final Widget child;

  const BlocProviders({required this.child});

  @override
  Widget build(BuildContext context) {
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
              authSocial: sl.get<AuthSocialService>(),
              userRepo: sl.get<UserRepo>(),
              database: sl.get<DatabaseCubit>()),
        ),
        BlocProvider<CallCenterBloc>(
          create: (BuildContext context) => CallCenterBloc(
              callcenterRepo: sl.get<CallCenterRepo>(),
              database: sl.get<DatabaseCubit>()),
        ),
        BlocProvider<SplashBloc>(
          create: (BuildContext context) =>
              SplashBloc(database: sl.get<DatabaseCubit>()),
        ),
        BlocProvider<HomeBloc>(
          create: (BuildContext context) =>
              HomeBloc(homeRepo: sl(), database: sl.get<DatabaseCubit>()),
        ),
      ],
      child: child,
    );
  }
}
// class AppContent extends StatelessWidget {
//   AppContent({super.key});
//   final _appRouter = sl.get<AppRouter>();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//         routerConfig: _appRouter.config(),
//         debugShowCheckedModeBanner: false,
//         title: 'Babana Express',
//         darkTheme: darkTheme,
//         themeMode: ThemeMode.light,
//         localizationsDelegates: context.localizationDelegates,
//         supportedLocales: context.supportedLocales,
//         locale: context.locale,
//         builder: (_, router) {
//           return MultiBlocProvider(
//               providers: [
//                 BlocProvider(create: (_) => sl<ConnectedBloc>()),
//                 BlocProvider<AppActionCubit>(
//                   create: (BuildContext context) => AppActionCubit(),
//                 ),
//                 BlocProvider<DatabaseCubit>(
//                   create: (BuildContext context) => DatabaseCubit(),
//                 ),
//                 BlocProvider<LivraisonBloc>(
//                   create: (BuildContext context) => LivraisonBloc(
//                     livraisonRepo: sl.get<LivraisonRepo>(),
//                     database: sl.get<DatabaseCubit>(),
//                   ),
//                 ),
//                 BlocProvider<CompteBloc>(
//                   create: (BuildContext context) => CompteBloc(
//                     compteRepo: sl.get<CompteRepo>(),
//                     database: sl.get<DatabaseCubit>(),
//                   ),
//                 ),
//                 BlocProvider<UserBloc>(
//                   create: (BuildContext context) => UserBloc(
//                       userRepo: sl.get<UserRepo>(),
//                       database: sl.get<DatabaseCubit>()),
//                 ),
               
//                 BlocProvider<CallCenterBloc>(
//                   create: (BuildContext context) => CallCenterBloc(
//                       callcenterRepo: sl.get<CallCenterRepo>(),
//                       database: sl.get<DatabaseCubit>()),
//                 ),
//                 BlocProvider<SplashBloc>(
//                   create: (BuildContext context) =>
//                       SplashBloc(database: sl.get<DatabaseCubit>()),
//                 ),
//                 BlocProvider<HomeBloc>(
//                   create: (BuildContext context) => HomeBloc(
//                       homeRepo: sl(), database: sl.get<DatabaseCubit>()),
//                 ),
               
//               ],
//               child: MaterialApp.router(
//                 routerConfig: _appRouter.config(),
//                 debugShowCheckedModeBanner: false,
//                 title: 'Banana Express',
//                 darkTheme: darkTheme,
//                 themeMode: ThemeMode.light,
//                 localizationsDelegates: context.localizationDelegates,
//                 supportedLocales: context.supportedLocales,
//                 locale: context.locale,
//                 builder: (_, router) {
//                   return EasyLoading.init()(
//                       context,
//                       ResponsiveBreakpoints.builder(
//                         breakpoints: const [
//                           Breakpoint(start: 0, end: 450, name: MOBILE),
//                           Breakpoint(start: 451, end: 800, name: TABLET),
//                           Breakpoint(start: 801, end: 1920, name: DESKTOP),
//                           Breakpoint(
//                               start: 1921, end: double.infinity, name: 'XL'),
//                         ],
//                         child: ClampingScrollWrapper.builder(context, router!),
//                       ));
//                 },
//                 theme: lightTheme(context),
//               ));
//         });
//   }
// }
