import 'package:BananaExpress/presentation/home/home_page.dart';
import 'package:BananaExpress/presentation/layer/onboardingpage.dart';
import 'package:BananaExpress/presentation/livraison/MapPagePointLivraisonColis.dart';
import 'package:BananaExpress/presentation/livraison/SuccesLivraisonPage.dart';
import 'package:BananaExpress/presentation/user/auth_page.dart';
import 'package:BananaExpress/test.dart';
import 'package:auto_route/auto_route.dart';

import '../presentation/layer/SplashScreen.dart';
import '../presentation/livraison/MapPagePointRecuperation.dart';
import '../presentation/livraison/NewLivraisonPage.dart';
import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  List<AutoRoute> get routes => [
        AutoRoute(
            page: SplashScreenRoute.page, path: SplashScreenPage.routeName),
        AutoRoute(page: OnBoardingRoute.page, path: OnBoardingPage.routeName),
        AutoRoute(page: AuthRoute.page, path: AuthPage.routeName),
        AutoRoute(page: HomeRoute.page, path: HomePage.routeName),
        AutoRoute(
            page: NewLivraisonRoute.page, path: NewLivraisonPage.routeName),
        AutoRoute(
            page: MapRoutePointRecuperation.page,
            path: MapPagePointRecuperation.routeName),
        AutoRoute(
            page: MapRoutePointLivraisonColis.page,
            path: MapPagePointLivraisonColis.routeName),
        AutoRoute(
            page: SuccesLivraisonRoute.page,
            path: SuccesLivraisonPage.routeName),
        AutoRoute(
            page: MyTestRoute.page, initial: true, path: MyTestPage.routeName),
      ];
}
