import 'package:BabanaExpress/presentation/home/home_page.dart';
import 'package:BabanaExpress/presentation/layer/onboardingpage.dart';
import 'package:BabanaExpress/presentation/livraison/MapPagePointLivraisonColis.dart';
import 'package:BabanaExpress/presentation/livraison/SuccesLivraisonPage.dart';
import 'package:BabanaExpress/presentation/pharmacy/SuccesLivraisonMedicamentPage.dart';
import 'package:BabanaExpress/presentation/pharmacy/NewLivraisonMedicamentPage.dart';
import 'package:BabanaExpress/presentation/user/auth_page.dart';
import 'package:BabanaExpress/presentation/user/forgot_password_page.dart';
import 'package:BabanaExpress/presentation/user/politique_page.dart';
import 'package:BabanaExpress/presentation/user/register_page.dart';
import 'package:BabanaExpress/test.dart';
import 'package:auto_route/auto_route.dart';

import '../presentation/layer/splashpage.dart';
import '../presentation/livraison/MapPagePointRecuperation.dart';
import '../presentation/livraison/NewLivraisonPage.dart';
import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  List<AutoRoute> get routes => [
        AutoRoute(
            page: SplashScreenRoute.page,
            initial: true,
            path: SplashScreenPage.routeName),
        AutoRoute(page: OnBoardingRoute.page, path: OnBoardingPage.routeName),
        AutoRoute(page: AuthRoute.page, path: AuthPage.routeName),
        AutoRoute(page: RegisterRoute.page, path: RegisterPage.routeName),
        AutoRoute(
            page: ForgotPasswordRoute.page, path: ForgotPasswordPage.routeName),
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
        AutoRoute(page: MyTestRoute.page, path: MyTestPage.routeName),
        AutoRoute(page: PolitiqueRoute.page, path: PolitiquePage.routeName),
        AutoRoute(
            page: NewLivraisonMedicamentRoute.page,
            path: NewLivraisonMedicamentPage.routeName),
        AutoRoute(
            page: SuccesLivraisonMedicamentRoute.page,
            path: SuccesLivraisonMedicamentPage.routeName),
      ];
}
