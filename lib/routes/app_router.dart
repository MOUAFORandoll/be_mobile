import 'package:BabanaExpress/presentation/compte/PaiementDepotPage.dart';
import 'package:BabanaExpress/presentation/compte/WalletView.dart';
import 'package:BabanaExpress/presentation/home/HomePage.dart';
import 'package:BabanaExpress/presentation/layer/onboardingpage.dart';
import 'package:BabanaExpress/presentation/livraison/LivraisonDataPage.dart';
import 'package:BabanaExpress/presentation/livraison/MapPagePointLivraisonColis.dart';
import 'package:BabanaExpress/presentation/livraison/SuccesLivraisonPage.dart';
import 'package:BabanaExpress/presentation/livraison/PaiementPage.dart';
import 'package:BabanaExpress/presentation/pharmacy/SuccesLivraisonMedicamentPage.dart';
import 'package:BabanaExpress/presentation/pharmacy/NewLivraisonMedicamentPage.dart';
import 'package:BabanaExpress/presentation/pharmacy/PaiementPharmacyPage.dart';
import 'package:BabanaExpress/presentation/user/AuthPage.dart';
import 'package:BabanaExpress/presentation/user/ForgotPasswordPage.dart';
import 'package:BabanaExpress/presentation/user/PolitiquePage.dart';
import 'package:BabanaExpress/presentation/user/RegisterPage.dart';
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
        AutoRoute(page: PaimentRoute.page, path: PaimentPage.routeName),
        AutoRoute(
            page: PaimentPharmacyRoute.page,
            path: PaimentPharmacyPage.routeName),
        AutoRoute(
            page: LivraisonDataRoute.page, path: LivraisonDataPage.routeName),
        AutoRoute(page: WalletRoute.page, path: WalletPage.routeName),
        AutoRoute(
            page: PaimentDepotRoute.page, path: PaimentDepotPage.routeName),
      ];
}
