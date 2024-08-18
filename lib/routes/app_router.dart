import 'package:BabanaExpress/presentation/callcenter/CallCenterPage.dart';
import 'package:BabanaExpress/presentation/compte/PaiementDepotPage.dart';
import 'package:BabanaExpress/presentation/compte/WalletView.dart';
import 'package:BabanaExpress/presentation/home/HomePage.dart';
import 'package:BabanaExpress/presentation/layer/onboardingpage.dart';
import 'package:BabanaExpress/presentation/livraison/HistoriqueLivraisonPage.dart';
import 'package:BabanaExpress/presentation/livraison/ColisConversationPage.dart';
import 'package:BabanaExpress/presentation/livraison/LivraiSonMapPage.dart';
import 'package:BabanaExpress/presentation/livraison/LivraisonDataHomePage.dart';
import 'package:BabanaExpress/presentation/livraison/LivraisonDataPage.dart';
import 'package:BabanaExpress/presentation/livraison/MapPagePointLivraisonColis.dart';
import 'package:BabanaExpress/presentation/livraison/type1/SuccesLivraisonType1Page.dart';
import 'package:BabanaExpress/presentation/livraison/type1/NewLivraisonType1Page.dart';
import 'package:BabanaExpress/presentation/livraison/type2/NewLivraisonType2Page.dart';
import 'package:BabanaExpress/presentation/livraison/type2/SuccesLivraisonType2Page.dart';
import 'package:BabanaExpress/presentation/user/AuthPage.dart';
import 'package:BabanaExpress/presentation/user/ForgotPasswordPage.dart';
import 'package:BabanaExpress/presentation/user/LoginPage.dart';
import 'package:BabanaExpress/presentation/user/PolitiquePage.dart';
import 'package:BabanaExpress/presentation/user/RegisterPage.dart';
import 'package:BabanaExpress/test.dart';
import 'package:auto_route/auto_route.dart';

import '../presentation/layer/splashpage.dart';
import '../presentation/livraison/MapPagePointRecuperation.dart';
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
        AutoRoute(page: LoginRoute.page, path: LoginPage.routeName),

        AutoRoute(page: RegisterRoute.page, path: RegisterPage.routeName),
        AutoRoute(
            page: ForgotPasswordRoute.page, path: ForgotPasswordPage.routeName),
        AutoRoute(page: HomeRoute.page, path: HomePage.routeName),
        AutoRoute(
            page: NewLivraisonType1Route.page,
            path: NewLivraisonType1Page.routeName),

        AutoRoute(
            page: MapRoutePointRecuperation.page,
            path: MapPagePointRecuperation.routeName),
        AutoRoute(
            page: MapRoutePointLivraisonColis.page,
            path: MapPagePointLivraisonColis.routeName),
        AutoRoute(
            page: SuccesLivraisonType1Route.page,
            path: SuccesLivraisonType1Page.routeName),

        AutoRoute(page: MyTestRoute.page, path: MyTestPage.routeName),
        AutoRoute(page: PolitiqueRoute.page, path: PolitiquePage.routeName),
        AutoRoute(
            page: LivraisonDataRoute.page, path: LivraisonDataPage.routeName),
        AutoRoute(page: WalletRoute.page, path: WalletPage.routeName),
        AutoRoute(
            page: PaimentDepotRoute.page, path: PaimentDepotPage.routeName),
        AutoRoute(
            page: HistoriqueLivraisonRoute.page,
            path: HistoriqueLivraisonPage.routeName),
        AutoRoute(page: CallCenterRoute.page, path: CallCenterPage.routeName),
        AutoRoute(
            page: LivraisonDataHomeRoute.page,
            path: LivraisonDataHomePage.routeName),

        //Livraison Type 2
        AutoRoute(
            page: NewLivraisonType2Route.page,
            path: NewLivraisonType2Page.routeName),
        AutoRoute(
            page: SuccesLivraisonType2Route.page,
            path: SuccesLivraisonType2Page.routeName),
        AutoRoute(
            page: ColisConversationRoute.page,
            path: ColisConversationPage.routeName),
        AutoRoute(
            page: LivraiSonMapRoute.page, path: LivraiSonMapPage.routeName),
      ];
}
//656019261
