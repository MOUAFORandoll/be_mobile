// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:BananaExpress/presentation/home/home_page.dart' as _i3;
import 'package:BananaExpress/presentation/layer/onboardingpage.dart' as _i8;
import 'package:BananaExpress/presentation/layer/splashpage.dart' as _i12;
import 'package:BananaExpress/presentation/livraison/MapPagePointLivraisonColis.dart'
    as _i4;
import 'package:BananaExpress/presentation/livraison/MapPagePointRecuperation.dart'
    as _i5;
import 'package:BananaExpress/presentation/livraison/NewLivraisonPage.dart'
    as _i7;
import 'package:BananaExpress/presentation/livraison/SuccesLivraisonPage.dart'
    as _i13;
import 'package:BananaExpress/presentation/pharmacy/pharmacy_page.dart' as _i9;
import 'package:BananaExpress/presentation/user/auth_page.dart' as _i1;
import 'package:BananaExpress/presentation/user/forgot_password_page.dart'
    as _i2;
import 'package:BananaExpress/presentation/user/politique_page.dart' as _i10;
import 'package:BananaExpress/presentation/user/register_page.dart' as _i11;
import 'package:BananaExpress/presentation/user/user_info_page.dart' as _i14;
import 'package:BananaExpress/test.dart' as _i6;

abstract class $AppRouter extends _i15.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthPage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ForgotPasswordPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    MapRoutePointLivraisonColis.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.MapPagePointLivraisonColis(),
      );
    },
    MapRoutePointRecuperation.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.MapPagePointRecuperation(),
      );
    },
    MyTestRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.MyTestPage(),
      );
    },
    NewLivraisonRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.NewLivraisonPage(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.OnBoardingPage(),
      );
    },
    PharmacyRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.PharmacyPage(),
      );
    },
    PolitiqueRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.PolitiquePage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.RegisterPage(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SplashScreenPage(),
      );
    },
    SuccesLivraisonRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SuccesLivraisonPage(),
      );
    },
    UserInfoRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.UserInfoPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthPage]
class AuthRoute extends _i15.PageRouteInfo<void> {
  const AuthRoute({List<_i15.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ForgotPasswordPage]
class ForgotPasswordRoute extends _i15.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i15.PageRouteInfo<void> {
  const HomeRoute({List<_i15.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MapPagePointLivraisonColis]
class MapRoutePointLivraisonColis extends _i15.PageRouteInfo<void> {
  const MapRoutePointLivraisonColis({List<_i15.PageRouteInfo>? children})
      : super(
          MapRoutePointLivraisonColis.name,
          initialChildren: children,
        );

  static const String name = 'MapRoutePointLivraisonColis';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i5.MapPagePointRecuperation]
class MapRoutePointRecuperation extends _i15.PageRouteInfo<void> {
  const MapRoutePointRecuperation({List<_i15.PageRouteInfo>? children})
      : super(
          MapRoutePointRecuperation.name,
          initialChildren: children,
        );

  static const String name = 'MapRoutePointRecuperation';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MyTestPage]
class MyTestRoute extends _i15.PageRouteInfo<void> {
  const MyTestRoute({List<_i15.PageRouteInfo>? children})
      : super(
          MyTestRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyTestRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i7.NewLivraisonPage]
class NewLivraisonRoute extends _i15.PageRouteInfo<void> {
  const NewLivraisonRoute({List<_i15.PageRouteInfo>? children})
      : super(
          NewLivraisonRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewLivraisonRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i8.OnBoardingPage]
class OnBoardingRoute extends _i15.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i15.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i9.PharmacyPage]
class PharmacyRoute extends _i15.PageRouteInfo<void> {
  const PharmacyRoute({List<_i15.PageRouteInfo>? children})
      : super(
          PharmacyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PharmacyRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i10.PolitiquePage]
class PolitiqueRoute extends _i15.PageRouteInfo<void> {
  const PolitiqueRoute({List<_i15.PageRouteInfo>? children})
      : super(
          PolitiqueRoute.name,
          initialChildren: children,
        );

  static const String name = 'PolitiqueRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i11.RegisterPage]
class RegisterRoute extends _i15.PageRouteInfo<void> {
  const RegisterRoute({List<_i15.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SplashScreenPage]
class SplashScreenRoute extends _i15.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SuccesLivraisonPage]
class SuccesLivraisonRoute extends _i15.PageRouteInfo<void> {
  const SuccesLivraisonRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SuccesLivraisonRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccesLivraisonRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i14.UserInfoPage]
class UserInfoRoute extends _i15.PageRouteInfo<void> {
  const UserInfoRoute({List<_i15.PageRouteInfo>? children})
      : super(
          UserInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserInfoRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}
