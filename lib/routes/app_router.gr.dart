// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:BabanaExpress/presentation/callcenter/CallCenterPage.dart'
    as _i2;
import 'package:BabanaExpress/presentation/components/exportcomponent.dart'
    as _i17;
import 'package:BabanaExpress/presentation/compte/PaiementDepotPage.dart'
    as _i10;
import 'package:BabanaExpress/presentation/compte/WalletView.dart' as _i15;
import 'package:BabanaExpress/presentation/home/HomePage.dart' as _i5;
import 'package:BabanaExpress/presentation/layer/onboarding_page.dart' as _i9;
import 'package:BabanaExpress/presentation/layer/splash_page.dart' as _i13;
import 'package:BabanaExpress/presentation/user/auth_page.dart' as _i1;
import 'package:BabanaExpress/presentation/user/complete_profil_page.dart'
    as _i3;
import 'package:BabanaExpress/presentation/user/forgot_password_page.dart'
    as _i4;
import 'package:BabanaExpress/presentation/user/login_page.dart' as _i6;
import 'package:BabanaExpress/presentation/user/new_password_page.dart' as _i8;
import 'package:BabanaExpress/presentation/user/politique_page.dart' as _i11;
import 'package:BabanaExpress/presentation/user/register_page.dart' as _i12;
import 'package:BabanaExpress/presentation/user/user_info_page.dart' as _i14;
import 'package:BabanaExpress/test.dart' as _i7;

abstract class $AppRouter extends _i16.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthPage(),
      );
    },
    CallCenterRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CallCenterPage(),
      );
    },
    CompleteProfilRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CompleteProfilPage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ForgotPasswordPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.LoginPage(),
      );
    },
    MyTestRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.MyTestPage(),
      );
    },
    NewPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<NewPasswordRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.NewPasswordPage(identifiant: args.identifiant),
      );
    },
    OnBoardingRoute.name: (routeData) {
      final args = routeData.argsAs<OnBoardingRouteArgs>(
          orElse: () => const OnBoardingRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.OnBoardingPage(key: args.key),
      );
    },
    PaiementDepotRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.PaiementDepotPage(),
      );
    },
    PolitiqueRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.PolitiquePage(),
      );
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.RegisterPage(
          key: args.key,
          identifiant: args.identifiant,
        ),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SplashScreenPage(),
      );
    },
    UserInfoRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.UserInfoPage(),
      );
    },
    WalletRoute.name: (routeData) {
      final args = routeData.argsAs<WalletRouteArgs>(
          orElse: () => const WalletRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WalletPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthPage]
class AuthRoute extends _i16.PageRouteInfo<void> {
  const AuthRoute({List<_i16.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CallCenterPage]
class CallCenterRoute extends _i16.PageRouteInfo<void> {
  const CallCenterRoute({List<_i16.PageRouteInfo>? children})
      : super(
          CallCenterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CallCenterRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CompleteProfilPage]
class CompleteProfilRoute extends _i16.PageRouteInfo<void> {
  const CompleteProfilRoute({List<_i16.PageRouteInfo>? children})
      : super(
          CompleteProfilRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompleteProfilRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ForgotPasswordPage]
class ForgotPasswordRoute extends _i16.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i16.PageRouteInfo<void> {
  const HomeRoute({List<_i16.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LoginPage]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute({List<_i16.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MyTestPage]
class MyTestRoute extends _i16.PageRouteInfo<void> {
  const MyTestRoute({List<_i16.PageRouteInfo>? children})
      : super(
          MyTestRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyTestRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i8.NewPasswordPage]
class NewPasswordRoute extends _i16.PageRouteInfo<NewPasswordRouteArgs> {
  NewPasswordRoute({
    required String identifiant,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          NewPasswordRoute.name,
          args: NewPasswordRouteArgs(identifiant: identifiant),
          initialChildren: children,
        );

  static const String name = 'NewPasswordRoute';

  static const _i16.PageInfo<NewPasswordRouteArgs> page =
      _i16.PageInfo<NewPasswordRouteArgs>(name);
}

class NewPasswordRouteArgs {
  const NewPasswordRouteArgs({required this.identifiant});

  final String identifiant;

  @override
  String toString() {
    return 'NewPasswordRouteArgs{identifiant: $identifiant}';
  }
}

/// generated route for
/// [_i9.OnBoardingPage]
class OnBoardingRoute extends _i16.PageRouteInfo<OnBoardingRouteArgs> {
  OnBoardingRoute({
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          OnBoardingRoute.name,
          args: OnBoardingRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i16.PageInfo<OnBoardingRouteArgs> page =
      _i16.PageInfo<OnBoardingRouteArgs>(name);
}

class OnBoardingRouteArgs {
  const OnBoardingRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'OnBoardingRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.PaiementDepotPage]
class PaiementDepotRoute extends _i16.PageRouteInfo<void> {
  const PaiementDepotRoute({List<_i16.PageRouteInfo>? children})
      : super(
          PaiementDepotRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaiementDepotRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i11.PolitiquePage]
class PolitiqueRoute extends _i16.PageRouteInfo<void> {
  const PolitiqueRoute({List<_i16.PageRouteInfo>? children})
      : super(
          PolitiqueRoute.name,
          initialChildren: children,
        );

  static const String name = 'PolitiqueRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i12.RegisterPage]
class RegisterRoute extends _i16.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    _i17.Key? key,
    required String identifiant,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(
            key: key,
            identifiant: identifiant,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i16.PageInfo<RegisterRouteArgs> page =
      _i16.PageInfo<RegisterRouteArgs>(name);
}

class RegisterRouteArgs {
  const RegisterRouteArgs({
    this.key,
    required this.identifiant,
  });

  final _i17.Key? key;

  final String identifiant;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key, identifiant: $identifiant}';
  }
}

/// generated route for
/// [_i13.SplashScreenPage]
class SplashScreenRoute extends _i16.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i14.UserInfoPage]
class UserInfoRoute extends _i16.PageRouteInfo<void> {
  const UserInfoRoute({List<_i16.PageRouteInfo>? children})
      : super(
          UserInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserInfoRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i15.WalletPage]
class WalletRoute extends _i16.PageRouteInfo<WalletRouteArgs> {
  WalletRoute({
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          WalletRoute.name,
          args: WalletRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'WalletRoute';

  static const _i16.PageInfo<WalletRouteArgs> page =
      _i16.PageInfo<WalletRouteArgs>(name);
}

class WalletRouteArgs {
  const WalletRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'WalletRouteArgs{key: $key}';
  }
}
