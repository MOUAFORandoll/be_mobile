// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i31;
import 'package:BabanaExpress/application/model/exportmodel.dart' as _i32;
import 'package:BabanaExpress/presentation/callcenter/CallCenterPage.dart'
    as _i2;
import 'package:BabanaExpress/presentation/components/exportcomponent.dart'
    as _i33;
import 'package:BabanaExpress/presentation/compte/PaiementDepotPage.dart'
    as _i22;
import 'package:BabanaExpress/presentation/compte/WalletView.dart' as _i30;
import 'package:BabanaExpress/presentation/home/HomePage.dart' as _i7;
import 'package:BabanaExpress/presentation/layer/onboardingpage.dart' as _i21;
import 'package:BabanaExpress/presentation/layer/splashpage.dart' as _i26;
import 'package:BabanaExpress/presentation/livraison/ColisConversationPage.dart'
    as _i3;
import 'package:BabanaExpress/presentation/livraison/HistoriqueLivraisonPage.dart'
    as _i6;
import 'package:BabanaExpress/presentation/livraison/LivraisonDataHomePage.dart'
    as _i13;
import 'package:BabanaExpress/presentation/livraison/LivraisonDataPage.dart'
    as _i14;
import 'package:BabanaExpress/presentation/livraison/LivraiSonMapPage.dart'
    as _i12;
import 'package:BabanaExpress/presentation/livraison/MapPagePointLivraisonColis.dart'
    as _i16;
import 'package:BabanaExpress/presentation/livraison/MapPagePointRecuperation.dart'
    as _i17;
import 'package:BabanaExpress/presentation/livraison/PaiementPage.dart' as _i23;
import 'package:BabanaExpress/presentation/livraison/type1/InfoColisType1.dart'
    as _i8;
import 'package:BabanaExpress/presentation/livraison/type1/InfoRecuperationType1.dart'
    as _i11;
import 'package:BabanaExpress/presentation/livraison/type1/NewLivraisonType1Page.dart'
    as _i19;
import 'package:BabanaExpress/presentation/livraison/type1/SuccesLivraisonType1Page.dart'
    as _i27;
import 'package:BabanaExpress/presentation/livraison/type2/InfoLivraisonType2.dart'
    as _i9;
import 'package:BabanaExpress/presentation/livraison/type2/InfoRecuperationColisType2.dart'
    as _i10;
import 'package:BabanaExpress/presentation/livraison/type2/NewLivraisonType2Page.dart'
    as _i20;
import 'package:BabanaExpress/presentation/livraison/type2/SuccesLivraisonType2Page.dart'
    as _i28;
import 'package:BabanaExpress/presentation/user/AuthPage.dart' as _i1;
import 'package:BabanaExpress/presentation/user/CompleteProfilPage.dart' as _i4;
import 'package:BabanaExpress/presentation/user/ForgotPasswordPage.dart' as _i5;
import 'package:BabanaExpress/presentation/user/LoginPage.dart' as _i15;
import 'package:BabanaExpress/presentation/user/PolitiquePage.dart' as _i24;
import 'package:BabanaExpress/presentation/user/RegisterPage.dart' as _i25;
import 'package:BabanaExpress/presentation/user/user_info_page.dart' as _i29;
import 'package:BabanaExpress/test.dart' as _i18;

abstract class $AppRouter extends _i31.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i31.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthPage(),
      );
    },
    CallCenterRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CallCenterPage(),
      );
    },
    ColisConversationRoute.name: (routeData) {
      final args = routeData.argsAs<ColisConversationRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ColisConversationPage(colis: args.colis),
      );
    },
    CompleteProfilRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CompleteProfilPage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ForgotPasswordPage(),
      );
    },
    HistoriqueLivraisonRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.HistoriqueLivraisonPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.HomePage(),
      );
    },
    InfoColisType1Route.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.InfoColisType1Page(),
      );
    },
    InfoLivraisonType2Route.name: (routeData) {
      final args = routeData.argsAs<InfoLivraisonType2RouteArgs>(
          orElse: () => const InfoLivraisonType2RouteArgs());
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.InfoLivraisonType2Page(key: args.key),
      );
    },
    InfoRecuperationColisType2Route.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.InfoRecuperationColisType2Page(),
      );
    },
    InfoRecuperationType1Route.name: (routeData) {
      final args = routeData.argsAs<InfoRecuperationType1RouteArgs>(
          orElse: () => const InfoRecuperationType1RouteArgs());
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.InfoRecuperationType1Page(key: args.key),
      );
    },
    LivraiSonMapRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.LivraiSonMapPage(),
      );
    },
    LivraisonDataHomeRoute.name: (routeData) {
      final args = routeData.argsAs<LivraisonDataHomeRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.LivraisonDataHomePage(livraison: args.livraison),
      );
    },
    LivraisonDataRoute.name: (routeData) {
      final args = routeData.argsAs<LivraisonDataRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.LivraisonDataPage(livraison: args.livraison),
      );
    },
    LoginRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.LoginPage(),
      );
    },
    MapRoutePointLivraisonColis.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.MapPagePointLivraisonColis(),
      );
    },
    MapRoutePointRecuperation.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.MapPagePointRecuperation(),
      );
    },
    MyTestRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.MyTestPage(),
      );
    },
    NewLivraisonType1Route.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.NewLivraisonType1Page(),
      );
    },
    NewLivraisonType2Route.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.NewLivraisonType2Page(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      final args = routeData.argsAs<OnBoardingRouteArgs>(
          orElse: () => const OnBoardingRouteArgs());
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.OnBoardingPage(key: args.key),
      );
    },
    PaiementDepotRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.PaiementDepotPage(),
      );
    },
    PaiementRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.PaiementPage(),
      );
    },
    PolitiqueRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.PolitiquePage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.RegisterPage(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.SplashScreenPage(),
      );
    },
    SuccesLivraisonType1Route.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.SuccesLivraisonType1Page(),
      );
    },
    SuccesLivraisonType2Route.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i28.SuccesLivraisonType2Page(),
      );
    },
    UserInfoRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i29.UserInfoPage(),
      );
    },
    WalletRoute.name: (routeData) {
      final args = routeData.argsAs<WalletRouteArgs>(
          orElse: () => const WalletRouteArgs());
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i30.WalletPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthPage]
class AuthRoute extends _i31.PageRouteInfo<void> {
  const AuthRoute({List<_i31.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CallCenterPage]
class CallCenterRoute extends _i31.PageRouteInfo<void> {
  const CallCenterRoute({List<_i31.PageRouteInfo>? children})
      : super(
          CallCenterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CallCenterRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ColisConversationPage]
class ColisConversationRoute
    extends _i31.PageRouteInfo<ColisConversationRouteArgs> {
  ColisConversationRoute({
    required _i32.ColisUser colis,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          ColisConversationRoute.name,
          args: ColisConversationRouteArgs(colis: colis),
          initialChildren: children,
        );

  static const String name = 'ColisConversationRoute';

  static const _i31.PageInfo<ColisConversationRouteArgs> page =
      _i31.PageInfo<ColisConversationRouteArgs>(name);
}

class ColisConversationRouteArgs {
  const ColisConversationRouteArgs({required this.colis});

  final _i32.ColisUser colis;

  @override
  String toString() {
    return 'ColisConversationRouteArgs{colis: $colis}';
  }
}

/// generated route for
/// [_i4.CompleteProfilPage]
class CompleteProfilRoute extends _i31.PageRouteInfo<void> {
  const CompleteProfilRoute({List<_i31.PageRouteInfo>? children})
      : super(
          CompleteProfilRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompleteProfilRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ForgotPasswordPage]
class ForgotPasswordRoute extends _i31.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i31.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HistoriqueLivraisonPage]
class HistoriqueLivraisonRoute extends _i31.PageRouteInfo<void> {
  const HistoriqueLivraisonRoute({List<_i31.PageRouteInfo>? children})
      : super(
          HistoriqueLivraisonRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoriqueLivraisonRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HomePage]
class HomeRoute extends _i31.PageRouteInfo<void> {
  const HomeRoute({List<_i31.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i8.InfoColisType1Page]
class InfoColisType1Route extends _i31.PageRouteInfo<void> {
  const InfoColisType1Route({List<_i31.PageRouteInfo>? children})
      : super(
          InfoColisType1Route.name,
          initialChildren: children,
        );

  static const String name = 'InfoColisType1Route';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i9.InfoLivraisonType2Page]
class InfoLivraisonType2Route
    extends _i31.PageRouteInfo<InfoLivraisonType2RouteArgs> {
  InfoLivraisonType2Route({
    _i33.Key? key,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          InfoLivraisonType2Route.name,
          args: InfoLivraisonType2RouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'InfoLivraisonType2Route';

  static const _i31.PageInfo<InfoLivraisonType2RouteArgs> page =
      _i31.PageInfo<InfoLivraisonType2RouteArgs>(name);
}

class InfoLivraisonType2RouteArgs {
  const InfoLivraisonType2RouteArgs({this.key});

  final _i33.Key? key;

  @override
  String toString() {
    return 'InfoLivraisonType2RouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.InfoRecuperationColisType2Page]
class InfoRecuperationColisType2Route extends _i31.PageRouteInfo<void> {
  const InfoRecuperationColisType2Route({List<_i31.PageRouteInfo>? children})
      : super(
          InfoRecuperationColisType2Route.name,
          initialChildren: children,
        );

  static const String name = 'InfoRecuperationColisType2Route';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i11.InfoRecuperationType1Page]
class InfoRecuperationType1Route
    extends _i31.PageRouteInfo<InfoRecuperationType1RouteArgs> {
  InfoRecuperationType1Route({
    _i33.Key? key,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          InfoRecuperationType1Route.name,
          args: InfoRecuperationType1RouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'InfoRecuperationType1Route';

  static const _i31.PageInfo<InfoRecuperationType1RouteArgs> page =
      _i31.PageInfo<InfoRecuperationType1RouteArgs>(name);
}

class InfoRecuperationType1RouteArgs {
  const InfoRecuperationType1RouteArgs({this.key});

  final _i33.Key? key;

  @override
  String toString() {
    return 'InfoRecuperationType1RouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.LivraiSonMapPage]
class LivraiSonMapRoute extends _i31.PageRouteInfo<void> {
  const LivraiSonMapRoute({List<_i31.PageRouteInfo>? children})
      : super(
          LivraiSonMapRoute.name,
          initialChildren: children,
        );

  static const String name = 'LivraiSonMapRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i13.LivraisonDataHomePage]
class LivraisonDataHomeRoute
    extends _i31.PageRouteInfo<LivraisonDataHomeRouteArgs> {
  LivraisonDataHomeRoute({
    required dynamic livraison,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          LivraisonDataHomeRoute.name,
          args: LivraisonDataHomeRouteArgs(livraison: livraison),
          initialChildren: children,
        );

  static const String name = 'LivraisonDataHomeRoute';

  static const _i31.PageInfo<LivraisonDataHomeRouteArgs> page =
      _i31.PageInfo<LivraisonDataHomeRouteArgs>(name);
}

class LivraisonDataHomeRouteArgs {
  const LivraisonDataHomeRouteArgs({required this.livraison});

  final dynamic livraison;

  @override
  String toString() {
    return 'LivraisonDataHomeRouteArgs{livraison: $livraison}';
  }
}

/// generated route for
/// [_i14.LivraisonDataPage]
class LivraisonDataRoute extends _i31.PageRouteInfo<LivraisonDataRouteArgs> {
  LivraisonDataRoute({
    required _i32.LivraisonModel livraison,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          LivraisonDataRoute.name,
          args: LivraisonDataRouteArgs(livraison: livraison),
          initialChildren: children,
        );

  static const String name = 'LivraisonDataRoute';

  static const _i31.PageInfo<LivraisonDataRouteArgs> page =
      _i31.PageInfo<LivraisonDataRouteArgs>(name);
}

class LivraisonDataRouteArgs {
  const LivraisonDataRouteArgs({required this.livraison});

  final _i32.LivraisonModel livraison;

  @override
  String toString() {
    return 'LivraisonDataRouteArgs{livraison: $livraison}';
  }
}

/// generated route for
/// [_i15.LoginPage]
class LoginRoute extends _i31.PageRouteInfo<void> {
  const LoginRoute({List<_i31.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i16.MapPagePointLivraisonColis]
class MapRoutePointLivraisonColis extends _i31.PageRouteInfo<void> {
  const MapRoutePointLivraisonColis({List<_i31.PageRouteInfo>? children})
      : super(
          MapRoutePointLivraisonColis.name,
          initialChildren: children,
        );

  static const String name = 'MapRoutePointLivraisonColis';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i17.MapPagePointRecuperation]
class MapRoutePointRecuperation extends _i31.PageRouteInfo<void> {
  const MapRoutePointRecuperation({List<_i31.PageRouteInfo>? children})
      : super(
          MapRoutePointRecuperation.name,
          initialChildren: children,
        );

  static const String name = 'MapRoutePointRecuperation';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i18.MyTestPage]
class MyTestRoute extends _i31.PageRouteInfo<void> {
  const MyTestRoute({List<_i31.PageRouteInfo>? children})
      : super(
          MyTestRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyTestRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i19.NewLivraisonType1Page]
class NewLivraisonType1Route extends _i31.PageRouteInfo<void> {
  const NewLivraisonType1Route({List<_i31.PageRouteInfo>? children})
      : super(
          NewLivraisonType1Route.name,
          initialChildren: children,
        );

  static const String name = 'NewLivraisonType1Route';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i20.NewLivraisonType2Page]
class NewLivraisonType2Route extends _i31.PageRouteInfo<void> {
  const NewLivraisonType2Route({List<_i31.PageRouteInfo>? children})
      : super(
          NewLivraisonType2Route.name,
          initialChildren: children,
        );

  static const String name = 'NewLivraisonType2Route';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i21.OnBoardingPage]
class OnBoardingRoute extends _i31.PageRouteInfo<OnBoardingRouteArgs> {
  OnBoardingRoute({
    _i33.Key? key,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          OnBoardingRoute.name,
          args: OnBoardingRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i31.PageInfo<OnBoardingRouteArgs> page =
      _i31.PageInfo<OnBoardingRouteArgs>(name);
}

class OnBoardingRouteArgs {
  const OnBoardingRouteArgs({this.key});

  final _i33.Key? key;

  @override
  String toString() {
    return 'OnBoardingRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i22.PaiementDepotPage]
class PaiementDepotRoute extends _i31.PageRouteInfo<void> {
  const PaiementDepotRoute({List<_i31.PageRouteInfo>? children})
      : super(
          PaiementDepotRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaiementDepotRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i23.PaiementPage]
class PaiementRoute extends _i31.PageRouteInfo<void> {
  const PaiementRoute({List<_i31.PageRouteInfo>? children})
      : super(
          PaiementRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaiementRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i24.PolitiquePage]
class PolitiqueRoute extends _i31.PageRouteInfo<void> {
  const PolitiqueRoute({List<_i31.PageRouteInfo>? children})
      : super(
          PolitiqueRoute.name,
          initialChildren: children,
        );

  static const String name = 'PolitiqueRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i25.RegisterPage]
class RegisterRoute extends _i31.PageRouteInfo<void> {
  const RegisterRoute({List<_i31.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i26.SplashScreenPage]
class SplashScreenRoute extends _i31.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i31.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i27.SuccesLivraisonType1Page]
class SuccesLivraisonType1Route extends _i31.PageRouteInfo<void> {
  const SuccesLivraisonType1Route({List<_i31.PageRouteInfo>? children})
      : super(
          SuccesLivraisonType1Route.name,
          initialChildren: children,
        );

  static const String name = 'SuccesLivraisonType1Route';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i28.SuccesLivraisonType2Page]
class SuccesLivraisonType2Route extends _i31.PageRouteInfo<void> {
  const SuccesLivraisonType2Route({List<_i31.PageRouteInfo>? children})
      : super(
          SuccesLivraisonType2Route.name,
          initialChildren: children,
        );

  static const String name = 'SuccesLivraisonType2Route';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i29.UserInfoPage]
class UserInfoRoute extends _i31.PageRouteInfo<void> {
  const UserInfoRoute({List<_i31.PageRouteInfo>? children})
      : super(
          UserInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserInfoRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i30.WalletPage]
class WalletRoute extends _i31.PageRouteInfo<WalletRouteArgs> {
  WalletRoute({
    _i33.Key? key,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          WalletRoute.name,
          args: WalletRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'WalletRoute';

  static const _i31.PageInfo<WalletRouteArgs> page =
      _i31.PageInfo<WalletRouteArgs>(name);
}

class WalletRouteArgs {
  const WalletRouteArgs({this.key});

  final _i33.Key? key;

  @override
  String toString() {
    return 'WalletRouteArgs{key: $key}';
  }
}
