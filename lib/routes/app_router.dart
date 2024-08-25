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
import 'package:BabanaExpress/presentation/livraison/PaiementPage.dart';
import 'package:BabanaExpress/presentation/livraison/type1/InfoColisType1.dart';
import 'package:BabanaExpress/presentation/livraison/type1/InfoRecuperationType1.dart';
import 'package:BabanaExpress/presentation/livraison/type1/SuccesLivraisonType1Page.dart';
import 'package:BabanaExpress/presentation/livraison/type1/NewLivraisonType1Page.dart';
import 'package:BabanaExpress/presentation/livraison/type2/InfoColisType2.dart';
import 'package:BabanaExpress/presentation/livraison/type2/InfoRecuperationType2.dart';
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
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 600,
            page: SplashScreenRoute.page,
            initial: true,
            path: SplashScreenPage.routeName),
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 600,
            page: OnBoardingRoute.page,
            path: OnBoardingPage.routeName),
        CustomRoute(page: AuthRoute.page, path: AuthPage.routeName),
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 600,
            page: LoginRoute.page,
            path: LoginPage.routeName),

        CustomRoute(
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 600,
            page: RegisterRoute.page,
            path: RegisterPage.routeName),
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 600,
            page: ForgotPasswordRoute.page,
            path: ForgotPasswordPage.routeName),
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 600,
            page: HomeRoute.page,
            path: HomePage.routeName),
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 600,
            page: NewLivraisonType1Route.page,
            path: NewLivraisonType1Page.routeName),

        CustomRoute(
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 600,
            page: MapRoutePointRecuperation.page,
            path: MapPagePointRecuperation.routeName),
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 600,
            page: MapRoutePointLivraisonColis.page,
            path: MapPagePointLivraisonColis.routeName),
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 600,
            page: SuccesLivraisonType1Route.page,
            path: SuccesLivraisonType1Page.routeName),

        CustomRoute(
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 600,
            page: MyTestRoute.page,
            path: MyTestPage.routeName),
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 600,
            page: PolitiqueRoute.page,
            path: PolitiquePage.routeName),
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 600,
            page: LivraisonDataRoute.page,
            path: LivraisonDataPage.routeName),
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 600,
            page: WalletRoute.page,
            path: WalletPage.routeName),
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 600,
            page: PaiementDepotRoute.page,
            path: PaiementDepotPage.routeName),
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 600,
            page: HistoriqueLivraisonRoute.page,
            path: HistoriqueLivraisonPage.routeName),
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 600,
            page: CallCenterRoute.page,
            path: CallCenterPage.routeName),
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 600,
            page: LivraisonDataHomeRoute.page,
            path: LivraisonDataHomePage.routeName),

        //Livraison Type 2
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 600,
            page: NewLivraisonType2Route.page,
            path: NewLivraisonType2Page.routeName),
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 600,
            page: SuccesLivraisonType2Route.page,
            path: SuccesLivraisonType2Page.routeName),
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 600,
            page: ColisConversationRoute.page,
            path: ColisConversationPage.routeName),
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 600,
            page: LivraiSonMapRoute.page,
            path: LivraiSonMapPage.routeName),

//New design

        CustomRoute(
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 600,
            page: InfoColisType1Route.page,
            path: InfoColisType1Page.routeName),
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 600,
            page: InfoRecuperationType1Route.page,
            path: InfoRecuperationType1Page.routeName),
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 600,
            page: InfoColisType2Route.page,
            path: InfoColisType2Page.routeName),
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 600,
            page: InfoRecuperationType2Route.page,
            path: InfoRecuperationType2Page.routeName),

        CustomRoute(
            transitionsBuilder: TransitionsBuilders.slideLeft,
            durationInMilliseconds: 600,
            page: PaiementRoute.page,
            path: PaiementPage.routeName),
      ];
}
//656019261
