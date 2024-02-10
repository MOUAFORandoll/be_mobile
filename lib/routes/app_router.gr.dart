// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:BabanaExpress/presentation/home/home_page.dart' as _i3;
import 'package:BabanaExpress/presentation/layer/onboardingpage.dart' as _i10;
import 'package:BabanaExpress/presentation/layer/splashpage.dart' as _i13;
import 'package:BabanaExpress/presentation/livraison/MapPagePointLivraisonColis.dart'
    as _i5;
import 'package:BabanaExpress/presentation/livraison/MapPagePointRecuperation.dart'
    as _i6;
import 'package:BabanaExpress/presentation/livraison/NewLivraisonPage.dart'
    as _i9;
import 'package:BabanaExpress/presentation/livraison/SuccesLivraisonPage.dart'
    as _i15;
import 'package:BabanaExpress/presentation/pharmacy/MapPagePointLivraison.dart'
    as _i4;
import 'package:BabanaExpress/presentation/pharmacy/NewLivraisonMedicamentPage.dart'
    as _i8;
import 'package:BabanaExpress/presentation/pharmacy/SuccesLivraisonMedicamentPage.dart'
    as _i14;
import 'package:BabanaExpress/presentation/user/auth_page.dart' as _i1;
import 'package:BabanaExpress/presentation/user/forgot_password_page.dart'
    as _i2;
import 'package:BabanaExpress/presentation/user/politique_page.dart' as _i11;
import 'package:BabanaExpress/presentation/user/register_page.dart' as _i12;
import 'package:BabanaExpress/presentation/user/user_info_page.dart' as _i16;
import 'package:BabanaExpress/test.dart' as _i7;

abstract class $AppRouter extends _i17.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthPage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ForgotPasswordPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    MapRoutePointLivraison.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MapPagePointLivraison(),
      );
    },
    MapRoutePointLivraisonColis.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.MapPagePointLivraisonColis(),
      );
    },
    MapRoutePointRecuperation.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.MapPagePointRecuperation(),
      );
    },
    MyTestRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.MyTestPage(),
      );
    },
    NewLivraisonMedicamentRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.NewLivraisonMedicamentPage(),
      );
    },
    NewLivraisonRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.NewLivraisonPage(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.OnBoardingPage(),
      );
    },
    PolitiqueRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.PolitiquePage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.RegisterPage(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SplashScreenPage(),
      );
    },
    SuccesLivraisonMedicamentRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.SuccesLivraisonMedicamentPage(),
      );
    },
    SuccesLivraisonRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.SuccesLivraisonPage(),
      );
    },
    UserInfoRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.UserInfoPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthPage]
class AuthRoute extends _i17.PageRouteInfo<void> {
  const AuthRoute({List<_i17.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ForgotPasswordPage]
class ForgotPasswordRoute extends _i17.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i17.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i17.PageRouteInfo<void> {
  const HomeRoute({List<_i17.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MapPagePointLivraison]
class MapRoutePointLivraison extends _i17.PageRouteInfo<void> {
  const MapRoutePointLivraison({List<_i17.PageRouteInfo>? children})
      : super(
          MapRoutePointLivraison.name,
          initialChildren: children,
        );

  static const String name = 'MapRoutePointLivraison';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i5.MapPagePointLivraisonColis]
class MapRoutePointLivraisonColis extends _i17.PageRouteInfo<void> {
  const MapRoutePointLivraisonColis({List<_i17.PageRouteInfo>? children})
      : super(
          MapRoutePointLivraisonColis.name,
          initialChildren: children,
        );

  static const String name = 'MapRoutePointLivraisonColis';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MapPagePointRecuperation]
class MapRoutePointRecuperation extends _i17.PageRouteInfo<void> {
  const MapRoutePointRecuperation({List<_i17.PageRouteInfo>? children})
      : super(
          MapRoutePointRecuperation.name,
          initialChildren: children,
        );

  static const String name = 'MapRoutePointRecuperation';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MyTestPage]
class MyTestRoute extends _i17.PageRouteInfo<void> {
  const MyTestRoute({List<_i17.PageRouteInfo>? children})
      : super(
          MyTestRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyTestRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i8.NewLivraisonMedicamentPage]
class NewLivraisonMedicamentRoute extends _i17.PageRouteInfo<void> {
  const NewLivraisonMedicamentRoute({List<_i17.PageRouteInfo>? children})
      : super(
          NewLivraisonMedicamentRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewLivraisonMedicamentRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i9.NewLivraisonPage]
class NewLivraisonRoute extends _i17.PageRouteInfo<void> {
  const NewLivraisonRoute({List<_i17.PageRouteInfo>? children})
      : super(
          NewLivraisonRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewLivraisonRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i10.OnBoardingPage]
class OnBoardingRoute extends _i17.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i17.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i11.PolitiquePage]
class PolitiqueRoute extends _i17.PageRouteInfo<void> {
  const PolitiqueRoute({List<_i17.PageRouteInfo>? children})
      : super(
          PolitiqueRoute.name,
          initialChildren: children,
        );

  static const String name = 'PolitiqueRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i12.RegisterPage]
class RegisterRoute extends _i17.PageRouteInfo<void> {
  const RegisterRoute({List<_i17.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SplashScreenPage]
class SplashScreenRoute extends _i17.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i14.SuccesLivraisonMedicamentPage]
class SuccesLivraisonMedicamentRoute extends _i17.PageRouteInfo<void> {
  const SuccesLivraisonMedicamentRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SuccesLivraisonMedicamentRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccesLivraisonMedicamentRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i15.SuccesLivraisonPage]
class SuccesLivraisonRoute extends _i17.PageRouteInfo<void> {
  const SuccesLivraisonRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SuccesLivraisonRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccesLivraisonRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i16.UserInfoPage]
class UserInfoRoute extends _i17.PageRouteInfo<void> {
  const UserInfoRoute({List<_i17.PageRouteInfo>? children})
      : super(
          UserInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserInfoRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}
