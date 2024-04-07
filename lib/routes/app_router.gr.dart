// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i22;
import 'package:BabanaExpress/application/model/exportmodel.dart' as _i23;
import 'package:BabanaExpress/presentation/components/exportcomponent.dart'
    as _i24;
import 'package:BabanaExpress/presentation/compte/PaiementDepotPage.dart'
    as _i12;
import 'package:BabanaExpress/presentation/compte/WalletView.dart' as _i21;
import 'package:BabanaExpress/presentation/home/HomePage.dart' as _i3;
import 'package:BabanaExpress/presentation/layer/onboardingpage.dart' as _i11;
import 'package:BabanaExpress/presentation/layer/splashpage.dart' as _i17;
import 'package:BabanaExpress/presentation/livraison/LivraisonDataPage.dart'
    as _i4;
import 'package:BabanaExpress/presentation/livraison/MapPagePointLivraisonColis%20copy.dart'
    as _i5;
import 'package:BabanaExpress/presentation/livraison/MapPagePointRecuperation.dart'
    as _i7;
import 'package:BabanaExpress/presentation/livraison/NewLivraisonPage.dart'
    as _i10;
import 'package:BabanaExpress/presentation/livraison/PaiementPage.dart' as _i13;
import 'package:BabanaExpress/presentation/livraison/SuccesLivraisonPage.dart'
    as _i19;
import 'package:BabanaExpress/presentation/pharmacy/MapPagePointLivraisonMedoc.dart'
    as _i6;
import 'package:BabanaExpress/presentation/pharmacy/NewLivraisonMedicamentPage.dart'
    as _i9;
import 'package:BabanaExpress/presentation/pharmacy/PaiementPharmacyPage.dart'
    as _i14;
import 'package:BabanaExpress/presentation/pharmacy/SuccesLivraisonMedicamentPage.dart'
    as _i18;
import 'package:BabanaExpress/presentation/user/AuthPage.dart' as _i1;
import 'package:BabanaExpress/presentation/user/ForgotPasswordPage.dart' as _i2;
import 'package:BabanaExpress/presentation/user/PolitiquePage.dart' as _i15;
import 'package:BabanaExpress/presentation/user/RegisterPage.dart' as _i16;
import 'package:BabanaExpress/presentation/user/user_info_page.dart' as _i20;
import 'package:BabanaExpress/test.dart' as _i8;

abstract class $AppRouter extends _i22.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i22.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthPage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ForgotPasswordPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    LivraisonDataRoute.name: (routeData) {
      final args = routeData.argsAs<LivraisonDataRouteArgs>();
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.LivraisonDataPage(livraison: args.livraison),
      );
    },
    MapRoutePointLivraisonColis.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.MapPagePointLivraisonColis(),
      );
    },
    MapRoutePointLivraisonMedocs.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.MapPagePointLivraisonMedocs(),
      );
    },
    MapRoutePointRecuperation.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.MapPagePointRecuperation(),
      );
    },
    MyTestRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.MyTestPage(),
      );
    },
    NewLivraisonMedicamentRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.NewLivraisonMedicamentPage(),
      );
    },
    NewLivraisonRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.NewLivraisonPage(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.OnBoardingPage(),
      );
    },
    PaimentDepotRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.PaimentDepotPage(),
      );
    },
    PaimentRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.PaimentPage(),
      );
    },
    PaimentPharmacyRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.PaimentPharmacyPage(),
      );
    },
    PolitiqueRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.PolitiquePage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.RegisterPage(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.SplashScreenPage(),
      );
    },
    SuccesLivraisonMedicamentRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.SuccesLivraisonMedicamentPage(),
      );
    },
    SuccesLivraisonRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.SuccesLivraisonPage(),
      );
    },
    UserInfoRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.UserInfoPage(),
      );
    },
    WalletRoute.name: (routeData) {
      final args = routeData.argsAs<WalletRouteArgs>(
          orElse: () => const WalletRouteArgs());
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WalletPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthPage]
class AuthRoute extends _i22.PageRouteInfo<void> {
  const AuthRoute({List<_i22.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ForgotPasswordPage]
class ForgotPasswordRoute extends _i22.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i22.PageRouteInfo<void> {
  const HomeRoute({List<_i22.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LivraisonDataPage]
class LivraisonDataRoute extends _i22.PageRouteInfo<LivraisonDataRouteArgs> {
  LivraisonDataRoute({
    required _i23.LivraisonModel livraison,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          LivraisonDataRoute.name,
          args: LivraisonDataRouteArgs(livraison: livraison),
          initialChildren: children,
        );

  static const String name = 'LivraisonDataRoute';

  static const _i22.PageInfo<LivraisonDataRouteArgs> page =
      _i22.PageInfo<LivraisonDataRouteArgs>(name);
}

class LivraisonDataRouteArgs {
  const LivraisonDataRouteArgs({required this.livraison});

  final _i23.LivraisonModel livraison;

  @override
  String toString() {
    return 'LivraisonDataRouteArgs{livraison: $livraison}';
  }
}

/// generated route for
/// [_i5.MapPagePointLivraisonColis]
class MapRoutePointLivraisonColis extends _i22.PageRouteInfo<void> {
  const MapRoutePointLivraisonColis({List<_i22.PageRouteInfo>? children})
      : super(
          MapRoutePointLivraisonColis.name,
          initialChildren: children,
        );

  static const String name = 'MapRoutePointLivraisonColis';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MapPagePointLivraisonMedocs]
class MapRoutePointLivraisonMedocs extends _i22.PageRouteInfo<void> {
  const MapRoutePointLivraisonMedocs({List<_i22.PageRouteInfo>? children})
      : super(
          MapRoutePointLivraisonMedocs.name,
          initialChildren: children,
        );

  static const String name = 'MapRoutePointLivraisonMedocs';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MapPagePointRecuperation]
class MapRoutePointRecuperation extends _i22.PageRouteInfo<void> {
  const MapRoutePointRecuperation({List<_i22.PageRouteInfo>? children})
      : super(
          MapRoutePointRecuperation.name,
          initialChildren: children,
        );

  static const String name = 'MapRoutePointRecuperation';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i8.MyTestPage]
class MyTestRoute extends _i22.PageRouteInfo<void> {
  const MyTestRoute({List<_i22.PageRouteInfo>? children})
      : super(
          MyTestRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyTestRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i9.NewLivraisonMedicamentPage]
class NewLivraisonMedicamentRoute extends _i22.PageRouteInfo<void> {
  const NewLivraisonMedicamentRoute({List<_i22.PageRouteInfo>? children})
      : super(
          NewLivraisonMedicamentRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewLivraisonMedicamentRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i10.NewLivraisonPage]
class NewLivraisonRoute extends _i22.PageRouteInfo<void> {
  const NewLivraisonRoute({List<_i22.PageRouteInfo>? children})
      : super(
          NewLivraisonRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewLivraisonRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i11.OnBoardingPage]
class OnBoardingRoute extends _i22.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i22.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i12.PaimentDepotPage]
class PaimentDepotRoute extends _i22.PageRouteInfo<void> {
  const PaimentDepotRoute({List<_i22.PageRouteInfo>? children})
      : super(
          PaimentDepotRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaimentDepotRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i13.PaimentPage]
class PaimentRoute extends _i22.PageRouteInfo<void> {
  const PaimentRoute({List<_i22.PageRouteInfo>? children})
      : super(
          PaimentRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaimentRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i14.PaimentPharmacyPage]
class PaimentPharmacyRoute extends _i22.PageRouteInfo<void> {
  const PaimentPharmacyRoute({List<_i22.PageRouteInfo>? children})
      : super(
          PaimentPharmacyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaimentPharmacyRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i15.PolitiquePage]
class PolitiqueRoute extends _i22.PageRouteInfo<void> {
  const PolitiqueRoute({List<_i22.PageRouteInfo>? children})
      : super(
          PolitiqueRoute.name,
          initialChildren: children,
        );

  static const String name = 'PolitiqueRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i16.RegisterPage]
class RegisterRoute extends _i22.PageRouteInfo<void> {
  const RegisterRoute({List<_i22.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i17.SplashScreenPage]
class SplashScreenRoute extends _i22.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i22.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i18.SuccesLivraisonMedicamentPage]
class SuccesLivraisonMedicamentRoute extends _i22.PageRouteInfo<void> {
  const SuccesLivraisonMedicamentRoute({List<_i22.PageRouteInfo>? children})
      : super(
          SuccesLivraisonMedicamentRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccesLivraisonMedicamentRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i19.SuccesLivraisonPage]
class SuccesLivraisonRoute extends _i22.PageRouteInfo<void> {
  const SuccesLivraisonRoute({List<_i22.PageRouteInfo>? children})
      : super(
          SuccesLivraisonRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccesLivraisonRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i20.UserInfoPage]
class UserInfoRoute extends _i22.PageRouteInfo<void> {
  const UserInfoRoute({List<_i22.PageRouteInfo>? children})
      : super(
          UserInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserInfoRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i21.WalletPage]
class WalletRoute extends _i22.PageRouteInfo<WalletRouteArgs> {
  WalletRoute({
    _i24.Key? key,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          WalletRoute.name,
          args: WalletRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'WalletRoute';

  static const _i22.PageInfo<WalletRouteArgs> page =
      _i22.PageInfo<WalletRouteArgs>(name);
}

class WalletRouteArgs {
  const WalletRouteArgs({this.key});

  final _i24.Key? key;

  @override
  String toString() {
    return 'WalletRouteArgs{key: $key}';
  }
}
