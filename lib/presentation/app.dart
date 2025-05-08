import 'package:BabanaExpress/application/callcenter/repositories/callcenterRepo.dart';
import 'package:BabanaExpress/application/compte/repositories/compteRepo.dart';
import 'package:BabanaExpress/application/connected/connected_bloc.dart';
import 'package:BabanaExpress/application/database/database_cubit.dart'; 
import 'package:BabanaExpress/application/livraison/repositories/livraisonRepo.dart';
import 'package:BabanaExpress/application/user/repositories/user_repository.dart';
import 'package:BabanaExpress/common/services/auth_provider.dart';
import 'package:BabanaExpress/core.dart';
import 'package:BabanaExpress/presentation/_commons/theming/app_theme.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/presentation/home/HomePage.dart';
import 'package:BabanaExpress/presentation/layer/onboarding_page.dart';
import 'package:BabanaExpress/presentation/user/login_page.dart';
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
        child: MaterialApp(
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
          builder: (context, child) => BlocListener<UserCubit, UserState>(
            listenWhen: (previous, state) =>
                previous is UserLoggingOut && state is UserNotLoggedState,
            listener: (_, state) {
              // recharge l'app quelque soit l'étape dans l'appli
              if (state is UserNotLoggedState) {
                Future.delayed(
                    const Duration(milliseconds: 100),
                    // ignore: use_build_context_synchronously
                    () => Phoenix.rebirth(context));
              }
            },
            child: child,
          ),
          home: Builder(
            builder: (context) {
              return BlocBuilder<UserCubit, UserState>(
                  buildWhen: (previous, _) => previous is InitializingUserState,
                  builder: (context, state) {
                    if (state is UserLoggedState) {
                      print('Utilisateur connecté');
                      // Utilisation de context.router pour la redirection
                      return const HomePage();
                      // context.router.replace(const HomeRoute());
                    } else if (state is UserNotLoggedState) {
                      print('Utilisateur déconnecté');
                      final firstEnter =
                          context.read<PreferencesService>().isFirstEnter();
                      if (firstEnter == null) {
                        print('Première entrée');
                        return const OnBoardingPage();
                      } else {
                        print('Redirection vers la page de connexion');
                        return const LoginPage();
                      }
                    }
                    return const SizedBox();
                  });
            },
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
 