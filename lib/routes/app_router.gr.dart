// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i24;
import 'package:BabanaExpress/application/model/exportmodel.dart' as _i25;
import 'package:BabanaExpress/presentation/callcenter/CallCenterPage.dart'
    as _i2;
import 'package:BabanaExpress/presentation/components/exportcomponent.dart'
    as _i26;
import 'package:BabanaExpress/presentation/compte/PaiementDepotPage.dart'
    as _i15;
import 'package:BabanaExpress/presentation/compte/WalletView.dart' as _i23;
import 'package:BabanaExpress/presentation/home/HomePage.dart' as _i6;
import 'package:BabanaExpress/presentation/layer/onboardingpage.dart' as _i14;
import 'package:BabanaExpress/presentation/layer/splashpage.dart' as _i19;
import 'package:BabanaExpress/presentation/livraison/ColisConversationPage.dart'
    as _i3;
import 'package:BabanaExpress/presentation/livraison/HistoriqueLivraisonPage.dart'
    as _i5;
import 'package:BabanaExpress/presentation/livraison/LivraisonDataHomePage.dart'
    as _i7;
import 'package:BabanaExpress/presentation/livraison/LivraisonDataPage.dart'
    as _i8;
import 'package:BabanaExpress/presentation/livraison/MapPagePointLivraisonColis.dart'
    as _i9;
import 'package:BabanaExpress/presentation/livraison/MapPagePointRecuperation.dart'
    as _i10;
import 'package:BabanaExpress/presentation/livraison/PaiementPage.dart' as _i16;
import 'package:BabanaExpress/presentation/livraison/type1/NewLivraisonType1Page.dart'
    as _i12;
import 'package:BabanaExpress/presentation/livraison/type1/SuccesLivraisonType1Page.dart'
    as _i20;
import 'package:BabanaExpress/presentation/livraison/type2/NewLivraisonType2Page.dart'
    as _i13;
import 'package:BabanaExpress/presentation/livraison/type2/SuccesLivraisonType2Page.dart'
    as _i21;
import 'package:BabanaExpress/presentation/user/AuthPage.dart' as _i1;
import 'package:BabanaExpress/presentation/user/ForgotPasswordPage.dart' as _i4;
import 'package:BabanaExpress/presentation/user/PolitiquePage.dart' as _i17;
import 'package:BabanaExpress/presentation/user/RegisterPage.dart' as _i18;
import 'package:BabanaExpress/presentation/user/user_info_page.dart' as _i22;
import 'package:BabanaExpress/test.dart' as _i11;

abstract class $AppRouter extends _i24.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i24.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthPage(),
      );
    },
    CallCenterRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CallCenterPage(),
      );
    },
    ColisConversationRoute.name: (routeData) {
      final args = routeData.argsAs<ColisConversationRouteArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ColisConversationPage(colis: args.colis),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ForgotPasswordPage(),
      );
    },
    HistoriqueLivraisonRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.HistoriqueLivraisonPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomePage(),
      );
    },
    LivraisonDataHomeRoute.name: (routeData) {
      final args = routeData.argsAs<LivraisonDataHomeRouteArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.LivraisonDataHomePage(livraison: args.livraison),
      );
    },
    LivraisonDataRoute.name: (routeData) {
      final args = routeData.argsAs<LivraisonDataRouteArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.LivraisonDataPage(livraison: args.livraison),
      );
    },
    MapRoutePointLivraisonColis.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.MapPagePointLivraisonColis(),
      );
    },
    MapRoutePointRecuperation.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.MapPagePointRecuperation(),
      );
    },
    MyTestRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.MyTestPage(),
      );
    },
    NewLivraisonType1Route.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.NewLivraisonType1Page(),
      );
    },
    NewLivraisonType2Route.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.NewLivraisonType2Page(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.OnBoardingPage(),
      );
    },
    PaimentDepotRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.PaimentDepotPage(),
      );
    },
    PaimentRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.PaimentPage(),
      );
    },
    PolitiqueRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.PolitiquePage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.RegisterPage(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.SplashScreenPage(),
      );
    },
    SuccesLivraisonType1Route.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.SuccesLivraisonType1Page(),
      );
    },
    SuccesLivraisonType2Route.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.SuccesLivraisonType2Page(),
      );
    },
    UserInfoRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.UserInfoPage(),
      );
    },
    WalletRoute.name: (routeData) {
      final args = routeData.argsAs<WalletRouteArgs>(
          orElse: () => const WalletRouteArgs());
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i23.WalletPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthPage]
class AuthRoute extends _i24.PageRouteInfo<void> {
  const AuthRoute({List<_i24.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CallCenterPage]
class CallCenterRoute extends _i24.PageRouteInfo<void> {
  const CallCenterRoute({List<_i24.PageRouteInfo>? children})
      : super(
          CallCenterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CallCenterRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ColisConversationPage]
class ColisConversationRoute
    extends _i24.PageRouteInfo<ColisConversationRouteArgs> {
  ColisConversationRoute({
    required _i25.ColisUser colis,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          ColisConversationRoute.name,
          args: ColisConversationRouteArgs(colis: colis),
          initialChildren: children,
        );

  static const String name = 'ColisConversationRoute';

  static const _i24.PageInfo<ColisConversationRouteArgs> page =
      _i24.PageInfo<ColisConversationRouteArgs>(name);
}

class ColisConversationRouteArgs {
  const ColisConversationRouteArgs({required this.colis});

  final _i25.ColisUser colis;

  @override
  String toString() {
    return 'ColisConversationRouteArgs{colis: $colis}';
  }
}

/// generated route for
/// [_i4.ForgotPasswordPage]
class ForgotPasswordRoute extends _i24.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i24.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HistoriqueLivraisonPage]
class HistoriqueLivraisonRoute extends _i24.PageRouteInfo<void> {
  const HistoriqueLivraisonRoute({List<_i24.PageRouteInfo>? children})
      : super(
          HistoriqueLivraisonRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoriqueLivraisonRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i24.PageRouteInfo<void> {
  const HomeRoute({List<_i24.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i7.LivraisonDataHomePage]
class LivraisonDataHomeRoute
    extends _i24.PageRouteInfo<LivraisonDataHomeRouteArgs> {
  LivraisonDataHomeRoute({
    required dynamic livraison,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          LivraisonDataHomeRoute.name,
          args: LivraisonDataHomeRouteArgs(livraison: livraison),
          initialChildren: children,
        );

  static const String name = 'LivraisonDataHomeRoute';

  static const _i24.PageInfo<LivraisonDataHomeRouteArgs> page =
      _i24.PageInfo<LivraisonDataHomeRouteArgs>(name);
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
/// [_i8.LivraisonDataPage]
class LivraisonDataRoute extends _i24.PageRouteInfo<LivraisonDataRouteArgs> {
  LivraisonDataRoute({
    required _i25.LivraisonModel livraison,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          LivraisonDataRoute.name,
          args: LivraisonDataRouteArgs(livraison: livraison),
          initialChildren: children,
        );

  static const String name = 'LivraisonDataRoute';

  static const _i24.PageInfo<LivraisonDataRouteArgs> page =
      _i24.PageInfo<LivraisonDataRouteArgs>(name);
}

class LivraisonDataRouteArgs {
  const LivraisonDataRouteArgs({required this.livraison});

  final _i25.LivraisonModel livraison;

  @override
  String toString() {
    return 'LivraisonDataRouteArgs{livraison: $livraison}';
  }
}

/// generated route for
/// [_i9.MapPagePointLivraisonColis]
class MapRoutePointLivraisonColis extends _i24.PageRouteInfo<void> {
  const MapRoutePointLivraisonColis({List<_i24.PageRouteInfo>? children})
      : super(
          MapRoutePointLivraisonColis.name,
          initialChildren: children,
        );

  static const String name = 'MapRoutePointLivraisonColis';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i10.MapPagePointRecuperation]
class MapRoutePointRecuperation extends _i24.PageRouteInfo<void> {
  const MapRoutePointRecuperation({List<_i24.PageRouteInfo>? children})
      : super(
          MapRoutePointRecuperation.name,
          initialChildren: children,
        );

  static const String name = 'MapRoutePointRecuperation';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i11.MyTestPage]
class MyTestRoute extends _i24.PageRouteInfo<void> {
  const MyTestRoute({List<_i24.PageRouteInfo>? children})
      : super(
          MyTestRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyTestRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i12.NewLivraisonType1Page]
class NewLivraisonType1Route extends _i24.PageRouteInfo<void> {
  const NewLivraisonType1Route({List<_i24.PageRouteInfo>? children})
      : super(
          NewLivraisonType1Route.name,
          initialChildren: children,
        );

  static const String name = 'NewLivraisonType1Route';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i13.NewLivraisonType2Page]
class NewLivraisonType2Route extends _i24.PageRouteInfo<void> {
  const NewLivraisonType2Route({List<_i24.PageRouteInfo>? children})
      : super(
          NewLivraisonType2Route.name,
          initialChildren: children,
        );

  static const String name = 'NewLivraisonType2Route';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i14.OnBoardingPage]
class OnBoardingRoute extends _i24.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i24.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i15.PaimentDepotPage]
class PaimentDepotRoute extends _i24.PageRouteInfo<void> {
  const PaimentDepotRoute({List<_i24.PageRouteInfo>? children})
      : super(
          PaimentDepotRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaimentDepotRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i16.PaimentPage]
class PaimentRoute extends _i24.PageRouteInfo<void> {
  const PaimentRoute({List<_i24.PageRouteInfo>? children})
      : super(
          PaimentRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaimentRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i17.PolitiquePage]
class PolitiqueRoute extends _i24.PageRouteInfo<void> {
  const PolitiqueRoute({List<_i24.PageRouteInfo>? children})
      : super(
          PolitiqueRoute.name,
          initialChildren: children,
        );

  static const String name = 'PolitiqueRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i18.RegisterPage]
class RegisterRoute extends _i24.PageRouteInfo<void> {
  const RegisterRoute({List<_i24.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i19.SplashScreenPage]
class SplashScreenRoute extends _i24.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i24.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i20.SuccesLivraisonType1Page]
class SuccesLivraisonType1Route extends _i24.PageRouteInfo<void> {
  const SuccesLivraisonType1Route({List<_i24.PageRouteInfo>? children})
      : super(
          SuccesLivraisonType1Route.name,
          initialChildren: children,
        );

  static const String name = 'SuccesLivraisonType1Route';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i21.SuccesLivraisonType2Page]
class SuccesLivraisonType2Route extends _i24.PageRouteInfo<void> {
  const SuccesLivraisonType2Route({List<_i24.PageRouteInfo>? children})
      : super(
          SuccesLivraisonType2Route.name,
          initialChildren: children,
        );

  static const String name = 'SuccesLivraisonType2Route';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i22.UserInfoPage]
class UserInfoRoute extends _i24.PageRouteInfo<void> {
  const UserInfoRoute({List<_i24.PageRouteInfo>? children})
      : super(
          UserInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserInfoRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i23.WalletPage]
class WalletRoute extends _i24.PageRouteInfo<WalletRouteArgs> {
  WalletRoute({
    _i26.Key? key,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          WalletRoute.name,
          args: WalletRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'WalletRoute';

  static const _i24.PageInfo<WalletRouteArgs> page =
      _i24.PageInfo<WalletRouteArgs>(name);
}

class WalletRouteArgs {
  const WalletRouteArgs({this.key});

  final _i26.Key? key;

  @override
  String toString() {
    return 'WalletRouteArgs{key: $key}';
  }
}
