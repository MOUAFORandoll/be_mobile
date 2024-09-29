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
import 'package:BabanaExpress/presentation/home/HomePage.dart';
import 'package:BabanaExpress/presentation/layer/onboarding_page.dart';
import 'package:BabanaExpress/routes/app_router.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:potatoes/potatoes.dart' hide PreferencesService;
import 'package:potatoes_secured_preferences/potatoes_secured_preferences.dart';

import 'package:BabanaExpress/common/bloc/home_cubit.dart';
import 'package:BabanaExpress/common/bloc/user_cubit.dart';
import 'package:BabanaExpress/common/services/api_service.dart';
import 'package:BabanaExpress/common/services/preferences_service.dart';
import 'package:BabanaExpress/common/services/user_service.dart';
import 'package:BabanaExpress/utils/Services/auth_social_service%20.dart';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:auto_route/auto_route.dart';

class AppContent extends StatelessWidget {
  final AppRouter _appRouter = sl.get<AppRouter>();
  final GlobalKey<NavigatorState> navigatorKey;
  final SharedPreferences preferences;
  final FlutterSecureStorage secureStorage;
  final CacheOptions cacheOptions;

  AppContent({
    Key? key,
    required this.navigatorKey,
    required this.preferences,
    required this.secureStorage,
    required this.cacheOptions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final preferencesService = PreferencesService(preferences, secureStorage);

    final Dio dio = DioClient.instance(
      preferencesService,
      connectTimeout: const Duration(minutes: 1),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401) {
            // Token expiré, essayons de le rafraîchir
            if (await refreshToken(dio, preferencesService)) {
              // Retry the request with the new token
              return handler.resolve(await _retry(error.requestOptions, dio));
            }
          }
          return handler.next(error);
        },
      ),
    );
    dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AuthSocialService()),
        RepositoryProvider(create: (_) => UserService(dio)),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => UserCubit(
                    context.read<UserService>(),
                    preferencesService,
                    context.read<AuthSocialService>(),
                  )),
          BlocProvider(create: (_) => HomeCubit()),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Babana Express',
          theme: ThemeApp.lightTheme(context),
          themeMode: ThemeMode.light,
          locale: const Locale.fromSubtags(languageCode: 'fr'),
          supportedLocales: const [Locale.fromSubtags(languageCode: 'fr')],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          routerDelegate: _appRouter.delegate(
            navigatorObservers: () => [AutoRouteObserver()],
          ),
          routeInformationParser: _appRouter.defaultRouteParser(),
          builder: (context, child) => BlocListener<UserCubit, UserState>(
            listenWhen: (previous, current) =>
                previous is UserLoggingOut && current is UserNotLoggedState,
            listener: (_, state) {
              if (state is UserNotLoggedState) {
                Future.delayed(
                  const Duration(milliseconds: 100),
                  () => Phoenix.rebirth(context),
                );
              }
            },
            child: child ?? const SizedBox(),
          ),
        ),
      ),
    );
  }
}

Future<bool> refreshToken(
    Dio dio, PreferencesService preferencesService) async {
  try {
    var response = await dio.post(
      '/api/token/refresh',
      data: {'refresh_token': await preferencesService.getRefreshToken()},
    );
    if (response.statusCode == 200) {
      // Assuming the response contains a new access token
      String newToken = response.data['token'];
      String newRefreshToken = response.data['refresh_token'];
      await preferencesService.saveAuthToken(newToken);
      await preferencesService.saveRefreshToken(newRefreshToken);
      return true;
    }
  } catch (e) {
    print('Error refreshing token: $e');
  }
  return false;
}

Future<Response<dynamic>> _retry(RequestOptions requestOptions, Dio dio) async {
  final options = Options(
    method: requestOptions.method,
    headers: requestOptions.headers,
  );
  return dio.request<dynamic>(requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options);
}

class BlocProviders extends StatelessWidget {
  final Widget child;

  const BlocProviders({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ConnectedBloc>()),
        BlocProvider(create: (_) => AppActionCubit()),
        BlocProvider(create: (_) => DatabaseCubit()),
        BlocProvider(
          create: (_) => UserCubit(
            context.read(),
            context.read(),
            context.read(),
          ),
        ),
        BlocProvider(
          create: (_) => CallCenterBloc(
            callcenterRepo: sl.get<CallCenterRepo>(),
            database: sl.get<DatabaseCubit>(),
          ),
        ),
        BlocProvider(
          create: (_) => SplashBloc(database: sl.get<DatabaseCubit>()),
        ),
        BlocProvider(
          create: (_) => HomeBloc(
            homeRepo: sl(),
            database: sl.get<DatabaseCubit>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
