// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i20;
import 'package:BabanaExpress/application/model/exportmodel.dart' as _i21;
import 'package:BabanaExpress/presentation/home/home_page.dart' as _i3;
import 'package:BabanaExpress/presentation/layer/onboardingpage.dart' as _i11;
import 'package:BabanaExpress/presentation/layer/splashpage.dart' as _i16;
import 'package:BabanaExpress/presentation/livraison/LivraisonDataPage.dart'
    as _i4;
import 'package:BabanaExpress/presentation/livraison/MapPagePointLivraisonColis.dart'
    as _i6;
import 'package:BabanaExpress/presentation/livraison/MapPagePointRecuperation.dart'
    as _i7;
import 'package:BabanaExpress/presentation/livraison/NewLivraisonPage.dart'
    as _i10;
import 'package:BabanaExpress/presentation/livraison/paiement_page.dart'
    as _i12;
import 'package:BabanaExpress/presentation/livraison/SuccesLivraisonPage.dart'
    as _i18;
import 'package:BabanaExpress/presentation/pharmacy/MapPagePointLivraison.dart'
    as _i5;
import 'package:BabanaExpress/presentation/pharmacy/NewLivraisonMedicamentPage.dart'
    as _i9;
import 'package:BabanaExpress/presentation/pharmacy/paiement_pharmacy_page.dart'
    as _i13;
import 'package:BabanaExpress/presentation/pharmacy/SuccesLivraisonMedicamentPage.dart'
    as _i17;
import 'package:BabanaExpress/presentation/user/auth_page.dart' as _i1;
import 'package:BabanaExpress/presentation/user/forgot_password_page.dart'
    as _i2;
import 'package:BabanaExpress/presentation/user/politique_page.dart' as _i14;
import 'package:BabanaExpress/presentation/user/register_page.dart' as _i15;
import 'package:BabanaExpress/presentation/user/user_info_page.dart' as _i19;
import 'package:BabanaExpress/test.dart' as _i8;

abstract class $AppRouter extends _i20.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i20.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthPage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ForgotPasswordPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    LivraisonDataRoute.name: (routeData) {
      final args = routeData.argsAs<LivraisonDataRouteArgs>();
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.LivraisonDataPage(livraison: args.livraison),
      );
    },
    MapRoutePointLivraison.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.MapPagePointLivraison(),
      );
    },
    MapRoutePointLivraisonColis.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.MapPagePointLivraisonColis(),
      );
    },
    MapRoutePointRecuperation.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.MapPagePointRecuperation(),
      );
    },
    MyTestRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.MyTestPage(),
      );
    },
    NewLivraisonMedicamentRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.NewLivraisonMedicamentPage(),
      );
    },
    NewLivraisonRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.NewLivraisonPage(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.OnBoardingPage(),
      );
    },
    PaimentRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.PaimentPage(),
      );
    },
    PaimentPharmacyRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.PaimentPharmacyPage(),
      );
    },
    PolitiqueRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.PolitiquePage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.RegisterPage(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.SplashScreenPage(),
      );
    },
    SuccesLivraisonMedicamentRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.SuccesLivraisonMedicamentPage(),
      );
    },
    SuccesLivraisonRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.SuccesLivraisonPage(),
      );
    },
    UserInfoRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.UserInfoPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthPage]
class AuthRoute extends _i20.PageRouteInfo<void> {
  const AuthRoute({List<_i20.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ForgotPasswordPage]
class ForgotPasswordRoute extends _i20.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i20.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i20.PageRouteInfo<void> {
  const HomeRoute({List<_i20.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LivraisonDataPage]
class LivraisonDataRoute extends _i20.PageRouteInfo<LivraisonDataRouteArgs> {
  LivraisonDataRoute({
    required _i21.LivraisonModel livraison,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          LivraisonDataRoute.name,
          args: LivraisonDataRouteArgs(livraison: livraison),
          initialChildren: children,
        );

  static const String name = 'LivraisonDataRoute';

  static const _i20.PageInfo<LivraisonDataRouteArgs> page =
      _i20.PageInfo<LivraisonDataRouteArgs>(name);
}

class LivraisonDataRouteArgs {
  const LivraisonDataRouteArgs({required this.livraison});

  final _i21.LivraisonModel livraison;

  @override
  String toString() {
    return 'LivraisonDataRouteArgs{livraison: $livraison}';
  }
}

/// generated route for
/// [_i5.MapPagePointLivraison]
class MapRoutePointLivraison extends _i20.PageRouteInfo<void> {
  const MapRoutePointLivraison({List<_i20.PageRouteInfo>? children})
      : super(
          MapRoutePointLivraison.name,
          initialChildren: children,
        );

  static const String name = 'MapRoutePointLivraison';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MapPagePointLivraisonColis]
class MapRoutePointLivraisonColis extends _i20.PageRouteInfo<void> {
  const MapRoutePointLivraisonColis({List<_i20.PageRouteInfo>? children})
      : super(
          MapRoutePointLivraisonColis.name,
          initialChildren: children,
        );

  static const String name = 'MapRoutePointLivraisonColis';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MapPagePointRecuperation]
class MapRoutePointRecuperation extends _i20.PageRouteInfo<void> {
  const MapRoutePointRecuperation({List<_i20.PageRouteInfo>? children})
      : super(
          MapRoutePointRecuperation.name,
          initialChildren: children,
        );

  static const String name = 'MapRoutePointRecuperation';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i8.MyTestPage]
class MyTestRoute extends _i20.PageRouteInfo<void> {
  const MyTestRoute({List<_i20.PageRouteInfo>? children})
      : super(
          MyTestRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyTestRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i9.NewLivraisonMedicamentPage]
class NewLivraisonMedicamentRoute extends _i20.PageRouteInfo<void> {
  const NewLivraisonMedicamentRoute({List<_i20.PageRouteInfo>? children})
      : super(
          NewLivraisonMedicamentRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewLivraisonMedicamentRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i10.NewLivraisonPage]
class NewLivraisonRoute extends _i20.PageRouteInfo<void> {
  const NewLivraisonRoute({List<_i20.PageRouteInfo>? children})
      : super(
          NewLivraisonRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewLivraisonRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i11.OnBoardingPage]
class OnBoardingRoute extends _i20.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i20.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i12.PaimentPage]
class PaimentRoute extends _i20.PageRouteInfo<void> {
  const PaimentRoute({List<_i20.PageRouteInfo>? children})
      : super(
          PaimentRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaimentRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i13.PaimentPharmacyPage]
class PaimentPharmacyRoute extends _i20.PageRouteInfo<void> {
  const PaimentPharmacyRoute({List<_i20.PageRouteInfo>? children})
      : super(
          PaimentPharmacyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaimentPharmacyRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i14.PolitiquePage]
class PolitiqueRoute extends _i20.PageRouteInfo<void> {
  const PolitiqueRoute({List<_i20.PageRouteInfo>? children})
      : super(
          PolitiqueRoute.name,
          initialChildren: children,
        );

  static const String name = 'PolitiqueRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i15.RegisterPage]
class RegisterRoute extends _i20.PageRouteInfo<void> {
  const RegisterRoute({List<_i20.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i16.SplashScreenPage]
class SplashScreenRoute extends _i20.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i20.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i17.SuccesLivraisonMedicamentPage]
class SuccesLivraisonMedicamentRoute extends _i20.PageRouteInfo<void> {
  const SuccesLivraisonMedicamentRoute({List<_i20.PageRouteInfo>? children})
      : super(
          SuccesLivraisonMedicamentRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccesLivraisonMedicamentRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i18.SuccesLivraisonPage]
class SuccesLivraisonRoute extends _i20.PageRouteInfo<void> {
  const SuccesLivraisonRoute({List<_i20.PageRouteInfo>? children})
      : super(
          SuccesLivraisonRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccesLivraisonRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i19.UserInfoPage]
class UserInfoRoute extends _i20.PageRouteInfo<void> {
  const UserInfoRoute({List<_i20.PageRouteInfo>? children})
      : super(
          UserInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserInfoRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}
