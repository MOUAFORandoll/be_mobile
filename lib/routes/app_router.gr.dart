// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i30;
import 'package:BabanaExpress/application/model/data/LivraisonMarketModel.dart'
    as _i33;
import 'package:BabanaExpress/application/model/exportmodel.dart' as _i32;
import 'package:BabanaExpress/presentation/components/exportcomponent.dart'
    as _i31;
import 'package:BabanaExpress/presentation/compte/PaiementDepotPage.dart'
    as _i17;
import 'package:BabanaExpress/presentation/compte/WalletView.dart' as _i29;
import 'package:BabanaExpress/presentation/home/HomePage.dart' as _i4;
import 'package:BabanaExpress/presentation/layer/onboardingpage.dart' as _i15;
import 'package:BabanaExpress/presentation/layer/splashpage.dart' as _i24;
import 'package:BabanaExpress/presentation/livraison/LivraisonDataPage.dart'
    as _i6;
import 'package:BabanaExpress/presentation/livraison/MapPagePointLivraisonColis.dart'
    as _i8;
import 'package:BabanaExpress/presentation/livraison/MapPagePointRecuperation.dart'
    as _i11;
import 'package:BabanaExpress/presentation/livraison/NewLivraisonPage.dart'
    as _i14;
import 'package:BabanaExpress/presentation/livraison/PaiementPage.dart' as _i18;
import 'package:BabanaExpress/presentation/livraison/SuccesLivraisonPage.dart'
    as _i27;
import 'package:BabanaExpress/presentation/market/HistoriqueLivraisonMarketPage.dart'
    as _i3;
import 'package:BabanaExpress/presentation/market/InfolieuxlivraisonMarketPage.dart'
    as _i5;
import 'package:BabanaExpress/presentation/market/LivraisonMarketDataPage.dart'
    as _i7;
import 'package:BabanaExpress/presentation/market/MapPagePointLivraisonMarket.dart'
    as _i9;
import 'package:BabanaExpress/presentation/market/PaiementMarketPage.dart'
    as _i16;
import 'package:BabanaExpress/presentation/market/ProduitPage.dart' as _i21;
import 'package:BabanaExpress/presentation/market/ShoppingPage.dart' as _i23;
import 'package:BabanaExpress/presentation/market/SuccesLivraisonMarketPage.dart'
    as _i25;
import 'package:BabanaExpress/presentation/pharmacy/MapPagePointLivraisonMedoc.dart'
    as _i10;
import 'package:BabanaExpress/presentation/pharmacy/NewLivraisonMedicamentPage.dart'
    as _i13;
import 'package:BabanaExpress/presentation/pharmacy/PaiementPharmacyPage.dart'
    as _i19;
import 'package:BabanaExpress/presentation/pharmacy/SuccesLivraisonMedicamentPage.dart'
    as _i26;
import 'package:BabanaExpress/presentation/user/AuthPage.dart' as _i1;
import 'package:BabanaExpress/presentation/user/ForgotPasswordPage.dart' as _i2;
import 'package:BabanaExpress/presentation/user/PolitiquePage.dart' as _i20;
import 'package:BabanaExpress/presentation/user/RegisterPage.dart' as _i22;
import 'package:BabanaExpress/presentation/user/user_info_page.dart' as _i28;
import 'package:BabanaExpress/test.dart' as _i12;

abstract class $AppRouter extends _i30.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i30.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthPage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ForgotPasswordPage(),
      );
    },
    HistoriqueLivraisonMarketRoute.name: (routeData) {
      final args = routeData.argsAs<HistoriqueLivraisonMarketRouteArgs>(
          orElse: () => const HistoriqueLivraisonMarketRouteArgs());
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.HistoriqueLivraisonMarketPage(key: args.key),
      );
    },
    HomeRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
    InfoLieuxLivraisonMarketRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.InfoLieuxLivraisonMarketPage(),
      );
    },
    LivraisonDataRoute.name: (routeData) {
      final args = routeData.argsAs<LivraisonDataRouteArgs>();
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.LivraisonDataPage(livraison: args.livraison),
      );
    },
    LivraisonMarketDataRoute.name: (routeData) {
      final args = routeData.argsAs<LivraisonMarketDataRouteArgs>();
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.LivraisonMarketDataPage(livraison: args.livraison),
      );
    },
    MapRoutePointLivraisonColis.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.MapPagePointLivraisonColis(),
      );
    },
    MapRoutePointLivraisonMarket.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.MapPagePointLivraisonMarket(),
      );
    },
    MapRoutePointLivraisonMedocs.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.MapPagePointLivraisonMedocs(),
      );
    },
    MapRoutePointRecuperation.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.MapPagePointRecuperation(),
      );
    },
    MyTestRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.MyTestPage(),
      );
    },
    NewLivraisonMedicamentRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.NewLivraisonMedicamentPage(),
      );
    },
    NewLivraisonRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.NewLivraisonPage(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.OnBoardingPage(),
      );
    },
    PaiementMarketRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.PaiementMarketPage(),
      );
    },
    PaimentDepotRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.PaimentDepotPage(),
      );
    },
    PaimentRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.PaimentPage(),
      );
    },
    PaimentPharmacyRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.PaimentPharmacyPage(),
      );
    },
    PolitiqueRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.PolitiquePage(),
      );
    },
    ProduitRoute.name: (routeData) {
      final args = routeData.argsAs<ProduitRouteArgs>();
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.ProduitPage(produit: args.produit),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.RegisterPage(),
      );
    },
    ShoppingRoute.name: (routeData) {
      final args = routeData.argsAs<ShoppingRouteArgs>(
          orElse: () => const ShoppingRouteArgs());
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i23.ShoppingPage(key: args.key),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.SplashScreenPage(),
      );
    },
    SuccesLivraisonMarketRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.SuccesLivraisonMarketPage(),
      );
    },
    SuccesLivraisonMedicamentRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.SuccesLivraisonMedicamentPage(),
      );
    },
    SuccesLivraisonRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.SuccesLivraisonPage(),
      );
    },
    UserInfoRoute.name: (routeData) {
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i28.UserInfoPage(),
      );
    },
    WalletRoute.name: (routeData) {
      final args = routeData.argsAs<WalletRouteArgs>(
          orElse: () => const WalletRouteArgs());
      return _i30.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.WalletPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthPage]
class AuthRoute extends _i30.PageRouteInfo<void> {
  const AuthRoute({List<_i30.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ForgotPasswordPage]
class ForgotPasswordRoute extends _i30.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i30.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HistoriqueLivraisonMarketPage]
class HistoriqueLivraisonMarketRoute
    extends _i30.PageRouteInfo<HistoriqueLivraisonMarketRouteArgs> {
  HistoriqueLivraisonMarketRoute({
    _i31.Key? key,
    List<_i30.PageRouteInfo>? children,
  }) : super(
          HistoriqueLivraisonMarketRoute.name,
          args: HistoriqueLivraisonMarketRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HistoriqueLivraisonMarketRoute';

  static const _i30.PageInfo<HistoriqueLivraisonMarketRouteArgs> page =
      _i30.PageInfo<HistoriqueLivraisonMarketRouteArgs>(name);
}

class HistoriqueLivraisonMarketRouteArgs {
  const HistoriqueLivraisonMarketRouteArgs({this.key});

  final _i31.Key? key;

  @override
  String toString() {
    return 'HistoriqueLivraisonMarketRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i30.PageRouteInfo<void> {
  const HomeRoute({List<_i30.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i5.InfoLieuxLivraisonMarketPage]
class InfoLieuxLivraisonMarketRoute extends _i30.PageRouteInfo<void> {
  const InfoLieuxLivraisonMarketRoute({List<_i30.PageRouteInfo>? children})
      : super(
          InfoLieuxLivraisonMarketRoute.name,
          initialChildren: children,
        );

  static const String name = 'InfoLieuxLivraisonMarketRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LivraisonDataPage]
class LivraisonDataRoute extends _i30.PageRouteInfo<LivraisonDataRouteArgs> {
  LivraisonDataRoute({
    required _i32.LivraisonModel livraison,
    List<_i30.PageRouteInfo>? children,
  }) : super(
          LivraisonDataRoute.name,
          args: LivraisonDataRouteArgs(livraison: livraison),
          initialChildren: children,
        );

  static const String name = 'LivraisonDataRoute';

  static const _i30.PageInfo<LivraisonDataRouteArgs> page =
      _i30.PageInfo<LivraisonDataRouteArgs>(name);
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
/// [_i7.LivraisonMarketDataPage]
class LivraisonMarketDataRoute
    extends _i30.PageRouteInfo<LivraisonMarketDataRouteArgs> {
  LivraisonMarketDataRoute({
    required _i33.LivraisonMarketModel livraison,
    List<_i30.PageRouteInfo>? children,
  }) : super(
          LivraisonMarketDataRoute.name,
          args: LivraisonMarketDataRouteArgs(livraison: livraison),
          initialChildren: children,
        );

  static const String name = 'LivraisonMarketDataRoute';

  static const _i30.PageInfo<LivraisonMarketDataRouteArgs> page =
      _i30.PageInfo<LivraisonMarketDataRouteArgs>(name);
}

class LivraisonMarketDataRouteArgs {
  const LivraisonMarketDataRouteArgs({required this.livraison});

  final _i33.LivraisonMarketModel livraison;

  @override
  String toString() {
    return 'LivraisonMarketDataRouteArgs{livraison: $livraison}';
  }
}

/// generated route for
/// [_i8.MapPagePointLivraisonColis]
class MapRoutePointLivraisonColis extends _i30.PageRouteInfo<void> {
  const MapRoutePointLivraisonColis({List<_i30.PageRouteInfo>? children})
      : super(
          MapRoutePointLivraisonColis.name,
          initialChildren: children,
        );

  static const String name = 'MapRoutePointLivraisonColis';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i9.MapPagePointLivraisonMarket]
class MapRoutePointLivraisonMarket extends _i30.PageRouteInfo<void> {
  const MapRoutePointLivraisonMarket({List<_i30.PageRouteInfo>? children})
      : super(
          MapRoutePointLivraisonMarket.name,
          initialChildren: children,
        );

  static const String name = 'MapRoutePointLivraisonMarket';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i10.MapPagePointLivraisonMedocs]
class MapRoutePointLivraisonMedocs extends _i30.PageRouteInfo<void> {
  const MapRoutePointLivraisonMedocs({List<_i30.PageRouteInfo>? children})
      : super(
          MapRoutePointLivraisonMedocs.name,
          initialChildren: children,
        );

  static const String name = 'MapRoutePointLivraisonMedocs';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i11.MapPagePointRecuperation]
class MapRoutePointRecuperation extends _i30.PageRouteInfo<void> {
  const MapRoutePointRecuperation({List<_i30.PageRouteInfo>? children})
      : super(
          MapRoutePointRecuperation.name,
          initialChildren: children,
        );

  static const String name = 'MapRoutePointRecuperation';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i12.MyTestPage]
class MyTestRoute extends _i30.PageRouteInfo<void> {
  const MyTestRoute({List<_i30.PageRouteInfo>? children})
      : super(
          MyTestRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyTestRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i13.NewLivraisonMedicamentPage]
class NewLivraisonMedicamentRoute extends _i30.PageRouteInfo<void> {
  const NewLivraisonMedicamentRoute({List<_i30.PageRouteInfo>? children})
      : super(
          NewLivraisonMedicamentRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewLivraisonMedicamentRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i14.NewLivraisonPage]
class NewLivraisonRoute extends _i30.PageRouteInfo<void> {
  const NewLivraisonRoute({List<_i30.PageRouteInfo>? children})
      : super(
          NewLivraisonRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewLivraisonRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i15.OnBoardingPage]
class OnBoardingRoute extends _i30.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i30.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i16.PaiementMarketPage]
class PaiementMarketRoute extends _i30.PageRouteInfo<void> {
  const PaiementMarketRoute({List<_i30.PageRouteInfo>? children})
      : super(
          PaiementMarketRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaiementMarketRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i17.PaimentDepotPage]
class PaimentDepotRoute extends _i30.PageRouteInfo<void> {
  const PaimentDepotRoute({List<_i30.PageRouteInfo>? children})
      : super(
          PaimentDepotRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaimentDepotRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i18.PaimentPage]
class PaimentRoute extends _i30.PageRouteInfo<void> {
  const PaimentRoute({List<_i30.PageRouteInfo>? children})
      : super(
          PaimentRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaimentRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i19.PaimentPharmacyPage]
class PaimentPharmacyRoute extends _i30.PageRouteInfo<void> {
  const PaimentPharmacyRoute({List<_i30.PageRouteInfo>? children})
      : super(
          PaimentPharmacyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaimentPharmacyRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i20.PolitiquePage]
class PolitiqueRoute extends _i30.PageRouteInfo<void> {
  const PolitiqueRoute({List<_i30.PageRouteInfo>? children})
      : super(
          PolitiqueRoute.name,
          initialChildren: children,
        );

  static const String name = 'PolitiqueRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i21.ProduitPage]
class ProduitRoute extends _i30.PageRouteInfo<ProduitRouteArgs> {
  ProduitRoute({
    required _i32.ProduitModel produit,
    List<_i30.PageRouteInfo>? children,
  }) : super(
          ProduitRoute.name,
          args: ProduitRouteArgs(produit: produit),
          initialChildren: children,
        );

  static const String name = 'ProduitRoute';

  static const _i30.PageInfo<ProduitRouteArgs> page =
      _i30.PageInfo<ProduitRouteArgs>(name);
}

class ProduitRouteArgs {
  const ProduitRouteArgs({required this.produit});

  final _i32.ProduitModel produit;

  @override
  String toString() {
    return 'ProduitRouteArgs{produit: $produit}';
  }
}

/// generated route for
/// [_i22.RegisterPage]
class RegisterRoute extends _i30.PageRouteInfo<void> {
  const RegisterRoute({List<_i30.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i23.ShoppingPage]
class ShoppingRoute extends _i30.PageRouteInfo<ShoppingRouteArgs> {
  ShoppingRoute({
    _i31.Key? key,
    List<_i30.PageRouteInfo>? children,
  }) : super(
          ShoppingRoute.name,
          args: ShoppingRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ShoppingRoute';

  static const _i30.PageInfo<ShoppingRouteArgs> page =
      _i30.PageInfo<ShoppingRouteArgs>(name);
}

class ShoppingRouteArgs {
  const ShoppingRouteArgs({this.key});

  final _i31.Key? key;

  @override
  String toString() {
    return 'ShoppingRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i24.SplashScreenPage]
class SplashScreenRoute extends _i30.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i30.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i25.SuccesLivraisonMarketPage]
class SuccesLivraisonMarketRoute extends _i30.PageRouteInfo<void> {
  const SuccesLivraisonMarketRoute({List<_i30.PageRouteInfo>? children})
      : super(
          SuccesLivraisonMarketRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccesLivraisonMarketRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i26.SuccesLivraisonMedicamentPage]
class SuccesLivraisonMedicamentRoute extends _i30.PageRouteInfo<void> {
  const SuccesLivraisonMedicamentRoute({List<_i30.PageRouteInfo>? children})
      : super(
          SuccesLivraisonMedicamentRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccesLivraisonMedicamentRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i27.SuccesLivraisonPage]
class SuccesLivraisonRoute extends _i30.PageRouteInfo<void> {
  const SuccesLivraisonRoute({List<_i30.PageRouteInfo>? children})
      : super(
          SuccesLivraisonRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccesLivraisonRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i28.UserInfoPage]
class UserInfoRoute extends _i30.PageRouteInfo<void> {
  const UserInfoRoute({List<_i30.PageRouteInfo>? children})
      : super(
          UserInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserInfoRoute';

  static const _i30.PageInfo<void> page = _i30.PageInfo<void>(name);
}

/// generated route for
/// [_i29.WalletPage]
class WalletRoute extends _i30.PageRouteInfo<WalletRouteArgs> {
  WalletRoute({
    _i31.Key? key,
    List<_i30.PageRouteInfo>? children,
  }) : super(
          WalletRoute.name,
          args: WalletRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'WalletRoute';

  static const _i30.PageInfo<WalletRouteArgs> page =
      _i30.PageInfo<WalletRouteArgs>(name);
}

class WalletRouteArgs {
  const WalletRouteArgs({this.key});

  final _i31.Key? key;

  @override
  String toString() {
    return 'WalletRouteArgs{key: $key}';
  }
}
