import 'package:BananaExpress/presentation/home/home_page.dart';
import 'package:BananaExpress/presentation/layer/onboardingpage.dart';
import 'package:BananaExpress/presentation/user/auth_page.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

import '../presentation/layer/SplashScreen.dart';
import '../presentation/livraison/NewLivraisonPage.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashScreenRoute.page, initial: true, path: '/'),
        AutoRoute(
            page: OnBoardingRoute.page, path: '/' + OnBoardingPage.routeName),
        AutoRoute(page: AuthRoute.page, path: '/' + AuthPage.routeName),
        AutoRoute(page: HomeRoute.page, path: '/' + HomePage.routeName),
        AutoRoute(
            page: NewLivraisonRoute.page,
            path: '/' + NewLivraisonPage.routeName),
      ];
}
