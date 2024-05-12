// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i33;
import 'package:BabanaExpress/application/model/data/LivraisonMarketModel.dart'
    as _i36;
import 'package:BabanaExpress/application/model/exportmodel.dart' as _i35;
import 'package:BabanaExpress/presentation/callcenter/CallCenterPage.dart'
    as _i2;
import 'package:BabanaExpress/presentation/components/exportcomponent.dart'
    as _i34;
import 'package:BabanaExpress/presentation/compte/PaiementDepotPage.dart'
    as _i20;
import 'package:BabanaExpress/presentation/compte/WalletView.dart' as _i32;
import 'package:BabanaExpress/presentation/home/HomePage.dart' as _i7;
import 'package:BabanaExpress/presentation/layer/onboardingpage.dart' as _i18;
import 'package:BabanaExpress/presentation/layer/splashpage.dart' as _i27;
import 'package:BabanaExpress/presentation/livraison/HistoriqueLivraisonPage.dart'
    as _i6;
import 'package:BabanaExpress/presentation/livraison/LivraisonDataPage.dart'
    as _i9;
import 'package:BabanaExpress/presentation/livraison/MapPagePointLivraisonColis.dart'
    as _i11;
import 'package:BabanaExpress/presentation/livraison/MapPagePointRecuperation.dart'
    as _i14;
import 'package:BabanaExpress/presentation/livraison/NewLivraisonPage.dart'
    as _i17;
import 'package:BabanaExpress/presentation/livraison/PaiementPage.dart' as _i21;
import 'package:BabanaExpress/presentation/livraison/SuccesLivraisonPage.dart'
    as _i30;
import 'package:BabanaExpress/presentation/market/HistoriqueLivraisonMarketPage.dart'
    as _i4;
import 'package:BabanaExpress/presentation/market/InfolieuxlivraisonMarketPage.dart'
    as _i8;
import 'package:BabanaExpress/presentation/market/LivraisonMarketDataPage.dart'
    as _i10;
import 'package:BabanaExpress/presentation/market/MapPagePointLivraisonMarket.dart'
    as _i12;
import 'package:BabanaExpress/presentation/market/PaiementMarketPage.dart'
    as _i19;
import 'package:BabanaExpress/presentation/market/ProduitPage.dart' as _i24;
import 'package:BabanaExpress/presentation/market/ShoppingPage.dart' as _i26;
import 'package:BabanaExpress/presentation/market/SuccesLivraisonMarketPage.dart'
    as _i28;
import 'package:BabanaExpress/presentation/pharmacy/HistoriqueLivraisonMedicamentPage.dart'
    as _i5;
import 'package:BabanaExpress/presentation/pharmacy/MapPagePointLivraisonMedoc.dart'
    as _i13;
import 'package:BabanaExpress/presentation/pharmacy/NewLivraisonMedicamentPage.dart'
    as _i16;
import 'package:BabanaExpress/presentation/pharmacy/PaiementPharmacyPage.dart'
    as _i22;
import 'package:BabanaExpress/presentation/pharmacy/SuccesLivraisonMedicamentPage.dart'
    as _i29;
import 'package:BabanaExpress/presentation/user/AuthPage.dart' as _i1;
import 'package:BabanaExpress/presentation/user/ForgotPasswordPage.dart' as _i3;
import 'package:BabanaExpress/presentation/user/PolitiquePage.dart' as _i23;
import 'package:BabanaExpress/presentation/user/RegisterPage.dart' as _i25;
import 'package:BabanaExpress/presentation/user/user_info_page.dart' as _i31;
import 'package:BabanaExpress/test.dart' as _i15;

abstract class $AppRouter extends _i33.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i33.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthPage(),
      );
    },
    CallCenterRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CallCenterPage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ForgotPasswordPage(),
      );
    },
    HistoriqueLivraisonMarketRoute.name: (routeData) {
      final args = routeData.argsAs<HistoriqueLivraisonMarketRouteArgs>(
          orElse: () => const HistoriqueLivraisonMarketRouteArgs());
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.HistoriqueLivraisonMarketPage(key: args.key),
      );
    },
    HistoriqueLivraisonMedicamentRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.HistoriqueLivraisonMedicamentPage(),
      );
    },
    HistoriqueLivraisonRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.HistoriqueLivraisonPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.HomePage(),
      );
    },
    InfoLieuxLivraisonMarketRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.InfoLieuxLivraisonMarketPage(),
      );
    },
    LivraisonDataRoute.name: (routeData) {
      final args = routeData.argsAs<LivraisonDataRouteArgs>();
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.LivraisonDataPage(livraison: args.livraison),
      );
    },
    LivraisonMarketDataRoute.name: (routeData) {
      final args = routeData.argsAs<LivraisonMarketDataRouteArgs>();
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.LivraisonMarketDataPage(livraison: args.livraison),
      );
    },
    MapRoutePointLivraisonColis.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.MapPagePointLivraisonColis(),
      );
    },
    MapRoutePointLivraisonMarket.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.MapPagePointLivraisonMarket(),
      );
    },
    MapRoutePointLivraisonMedocs.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.MapPagePointLivraisonMedocs(),
      );
    },
    MapRoutePointRecuperation.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.MapPagePointRecuperation(),
      );
    },
    MyTestRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.MyTestPage(),
      );
    },
    NewLivraisonMedicamentRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.NewLivraisonMedicamentPage(),
      );
    },
    NewLivraisonRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.NewLivraisonPage(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.OnBoardingPage(),
      );
    },
    PaiementMarketRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.PaiementMarketPage(),
      );
    },
    PaimentDepotRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.PaimentDepotPage(),
      );
    },
    PaimentRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.PaimentPage(),
      );
    },
    PaimentPharmacyRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.PaimentPharmacyPage(),
      );
    },
    PolitiqueRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.PolitiquePage(),
      );
    },
    ProduitRoute.name: (routeData) {
      final args = routeData.argsAs<ProduitRouteArgs>();
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.ProduitPage(produit: args.produit),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.RegisterPage(),
      );
    },
    ShoppingRoute.name: (routeData) {
      final args = routeData.argsAs<ShoppingRouteArgs>(
          orElse: () => const ShoppingRouteArgs());
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i26.ShoppingPage(key: args.key),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.SplashScreenPage(),
      );
    },
    SuccesLivraisonMarketRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i28.SuccesLivraisonMarketPage(),
      );
    },
    SuccesLivraisonMedicamentRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i29.SuccesLivraisonMedicamentPage(),
      );
    },
    SuccesLivraisonRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i30.SuccesLivraisonPage(),
      );
    },
    UserInfoRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i31.UserInfoPage(),
      );
    },
    WalletRoute.name: (routeData) {
      final args = routeData.argsAs<WalletRouteArgs>(
          orElse: () => const WalletRouteArgs());
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.WalletPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthPage]
class AuthRoute extends _i33.PageRouteInfo<void> {
  const AuthRoute({List<_i33.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CallCenterPage]
class CallCenterRoute extends _i33.PageRouteInfo<void> {
  const CallCenterRoute({List<_i33.PageRouteInfo>? children})
      : super(
          CallCenterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CallCenterRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ForgotPasswordPage]
class ForgotPasswordRoute extends _i33.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i33.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HistoriqueLivraisonMarketPage]
class HistoriqueLivraisonMarketRoute
    extends _i33.PageRouteInfo<HistoriqueLivraisonMarketRouteArgs> {
  HistoriqueLivraisonMarketRoute({
    _i34.Key? key,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          HistoriqueLivraisonMarketRoute.name,
          args: HistoriqueLivraisonMarketRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HistoriqueLivraisonMarketRoute';

  static const _i33.PageInfo<HistoriqueLivraisonMarketRouteArgs> page =
      _i33.PageInfo<HistoriqueLivraisonMarketRouteArgs>(name);
}

class HistoriqueLivraisonMarketRouteArgs {
  const HistoriqueLivraisonMarketRouteArgs({this.key});

  final _i34.Key? key;

  @override
  String toString() {
    return 'HistoriqueLivraisonMarketRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.HistoriqueLivraisonMedicamentPage]
class HistoriqueLivraisonMedicamentRoute extends _i33.PageRouteInfo<void> {
  const HistoriqueLivraisonMedicamentRoute({List<_i33.PageRouteInfo>? children})
      : super(
          HistoriqueLivraisonMedicamentRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoriqueLivraisonMedicamentRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HistoriqueLivraisonPage]
class HistoriqueLivraisonRoute extends _i33.PageRouteInfo<void> {
  const HistoriqueLivraisonRoute({List<_i33.PageRouteInfo>? children})
      : super(
          HistoriqueLivraisonRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoriqueLivraisonRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HomePage]
class HomeRoute extends _i33.PageRouteInfo<void> {
  const HomeRoute({List<_i33.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i8.InfoLieuxLivraisonMarketPage]
class InfoLieuxLivraisonMarketRoute extends _i33.PageRouteInfo<void> {
  const InfoLieuxLivraisonMarketRoute({List<_i33.PageRouteInfo>? children})
      : super(
          InfoLieuxLivraisonMarketRoute.name,
          initialChildren: children,
        );

  static const String name = 'InfoLieuxLivraisonMarketRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i9.LivraisonDataPage]
class LivraisonDataRoute extends _i33.PageRouteInfo<LivraisonDataRouteArgs> {
  LivraisonDataRoute({
    required _i35.LivraisonModel livraison,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          LivraisonDataRoute.name,
          args: LivraisonDataRouteArgs(livraison: livraison),
          initialChildren: children,
        );

  static const String name = 'LivraisonDataRoute';

  static const _i33.PageInfo<LivraisonDataRouteArgs> page =
      _i33.PageInfo<LivraisonDataRouteArgs>(name);
}

class LivraisonDataRouteArgs {
  const LivraisonDataRouteArgs({required this.livraison});

  final _i35.LivraisonModel livraison;

  @override
  String toString() {
    return 'LivraisonDataRouteArgs{livraison: $livraison}';
  }
}

/// generated route for
/// [_i10.LivraisonMarketDataPage]
class LivraisonMarketDataRoute
    extends _i33.PageRouteInfo<LivraisonMarketDataRouteArgs> {
  LivraisonMarketDataRoute({
    required _i36.LivraisonMarketModel livraison,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          LivraisonMarketDataRoute.name,
          args: LivraisonMarketDataRouteArgs(livraison: livraison),
          initialChildren: children,
        );

  static const String name = 'LivraisonMarketDataRoute';

  static const _i33.PageInfo<LivraisonMarketDataRouteArgs> page =
      _i33.PageInfo<LivraisonMarketDataRouteArgs>(name);
}

class LivraisonMarketDataRouteArgs {
  const LivraisonMarketDataRouteArgs({required this.livraison});

  final _i36.LivraisonMarketModel livraison;

  @override
  String toString() {
    return 'LivraisonMarketDataRouteArgs{livraison: $livraison}';
  }
}

/// generated route for
/// [_i11.MapPagePointLivraisonColis]
class MapRoutePointLivraisonColis extends _i33.PageRouteInfo<void> {
  const MapRoutePointLivraisonColis({List<_i33.PageRouteInfo>? children})
      : super(
          MapRoutePointLivraisonColis.name,
          initialChildren: children,
        );

  static const String name = 'MapRoutePointLivraisonColis';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i12.MapPagePointLivraisonMarket]
class MapRoutePointLivraisonMarket extends _i33.PageRouteInfo<void> {
  const MapRoutePointLivraisonMarket({List<_i33.PageRouteInfo>? children})
      : super(
          MapRoutePointLivraisonMarket.name,
          initialChildren: children,
        );

  static const String name = 'MapRoutePointLivraisonMarket';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i13.MapPagePointLivraisonMedocs]
class MapRoutePointLivraisonMedocs extends _i33.PageRouteInfo<void> {
  const MapRoutePointLivraisonMedocs({List<_i33.PageRouteInfo>? children})
      : super(
          MapRoutePointLivraisonMedocs.name,
          initialChildren: children,
        );

  static const String name = 'MapRoutePointLivraisonMedocs';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i14.MapPagePointRecuperation]
class MapRoutePointRecuperation extends _i33.PageRouteInfo<void> {
  const MapRoutePointRecuperation({List<_i33.PageRouteInfo>? children})
      : super(
          MapRoutePointRecuperation.name,
          initialChildren: children,
        );

  static const String name = 'MapRoutePointRecuperation';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i15.MyTestPage]
class MyTestRoute extends _i33.PageRouteInfo<void> {
  const MyTestRoute({List<_i33.PageRouteInfo>? children})
      : super(
          MyTestRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyTestRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i16.NewLivraisonMedicamentPage]
class NewLivraisonMedicamentRoute extends _i33.PageRouteInfo<void> {
  const NewLivraisonMedicamentRoute({List<_i33.PageRouteInfo>? children})
      : super(
          NewLivraisonMedicamentRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewLivraisonMedicamentRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i17.NewLivraisonPage]
class NewLivraisonRoute extends _i33.PageRouteInfo<void> {
  const NewLivraisonRoute({List<_i33.PageRouteInfo>? children})
      : super(
          NewLivraisonRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewLivraisonRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i18.OnBoardingPage]
class OnBoardingRoute extends _i33.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i33.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i19.PaiementMarketPage]
class PaiementMarketRoute extends _i33.PageRouteInfo<void> {
  const PaiementMarketRoute({List<_i33.PageRouteInfo>? children})
      : super(
          PaiementMarketRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaiementMarketRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i20.PaimentDepotPage]
class PaimentDepotRoute extends _i33.PageRouteInfo<void> {
  const PaimentDepotRoute({List<_i33.PageRouteInfo>? children})
      : super(
          PaimentDepotRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaimentDepotRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i21.PaimentPage]
class PaimentRoute extends _i33.PageRouteInfo<void> {
  const PaimentRoute({List<_i33.PageRouteInfo>? children})
      : super(
          PaimentRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaimentRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i22.PaimentPharmacyPage]
class PaimentPharmacyRoute extends _i33.PageRouteInfo<void> {
  const PaimentPharmacyRoute({List<_i33.PageRouteInfo>? children})
      : super(
          PaimentPharmacyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaimentPharmacyRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i23.PolitiquePage]
class PolitiqueRoute extends _i33.PageRouteInfo<void> {
  const PolitiqueRoute({List<_i33.PageRouteInfo>? children})
      : super(
          PolitiqueRoute.name,
          initialChildren: children,
        );

  static const String name = 'PolitiqueRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i24.ProduitPage]
class ProduitRoute extends _i33.PageRouteInfo<ProduitRouteArgs> {
  ProduitRoute({
    required _i35.ProduitModel produit,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          ProduitRoute.name,
          args: ProduitRouteArgs(produit: produit),
          initialChildren: children,
        );

  static const String name = 'ProduitRoute';

  static const _i33.PageInfo<ProduitRouteArgs> page =
      _i33.PageInfo<ProduitRouteArgs>(name);
}

class ProduitRouteArgs {
  const ProduitRouteArgs({required this.produit});

  final _i35.ProduitModel produit;

  @override
  String toString() {
    return 'ProduitRouteArgs{produit: $produit}';
  }
}

/// generated route for
/// [_i25.RegisterPage]
class RegisterRoute extends _i33.PageRouteInfo<void> {
  const RegisterRoute({List<_i33.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i26.ShoppingPage]
class ShoppingRoute extends _i33.PageRouteInfo<ShoppingRouteArgs> {
  ShoppingRoute({
    _i34.Key? key,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          ShoppingRoute.name,
          args: ShoppingRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ShoppingRoute';

  static const _i33.PageInfo<ShoppingRouteArgs> page =
      _i33.PageInfo<ShoppingRouteArgs>(name);
}

class ShoppingRouteArgs {
  const ShoppingRouteArgs({this.key});

  final _i34.Key? key;

  @override
  String toString() {
    return 'ShoppingRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i27.SplashScreenPage]
class SplashScreenRoute extends _i33.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i33.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i28.SuccesLivraisonMarketPage]
class SuccesLivraisonMarketRoute extends _i33.PageRouteInfo<void> {
  const SuccesLivraisonMarketRoute({List<_i33.PageRouteInfo>? children})
      : super(
          SuccesLivraisonMarketRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccesLivraisonMarketRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i29.SuccesLivraisonMedicamentPage]
class SuccesLivraisonMedicamentRoute extends _i33.PageRouteInfo<void> {
  const SuccesLivraisonMedicamentRoute({List<_i33.PageRouteInfo>? children})
      : super(
          SuccesLivraisonMedicamentRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccesLivraisonMedicamentRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i30.SuccesLivraisonPage]
class SuccesLivraisonRoute extends _i33.PageRouteInfo<void> {
  const SuccesLivraisonRoute({List<_i33.PageRouteInfo>? children})
      : super(
          SuccesLivraisonRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccesLivraisonRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i31.UserInfoPage]
class UserInfoRoute extends _i33.PageRouteInfo<void> {
  const UserInfoRoute({List<_i33.PageRouteInfo>? children})
      : super(
          UserInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserInfoRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i32.WalletPage]
class WalletRoute extends _i33.PageRouteInfo<WalletRouteArgs> {
  WalletRoute({
    _i34.Key? key,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          WalletRoute.name,
          args: WalletRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'WalletRoute';

  static const _i33.PageInfo<WalletRouteArgs> page =
      _i33.PageInfo<WalletRouteArgs>(name);
}

class WalletRouteArgs {
  const WalletRouteArgs({this.key});

  final _i34.Key? key;

  @override
  String toString() {
    return 'WalletRouteArgs{key: $key}';
  }
}
