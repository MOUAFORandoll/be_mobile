import 'package:BananaExpress/old/Views/ComplementView/PolitiqueView.dart';
import 'package:BananaExpress/old/Views/User/SettingView.dart';
import 'package:BananaExpress/old/Views/User/UserManageView.dart';
import 'package:BananaExpress/old/Views/User/forgotPassword.dart';
import 'package:BananaExpress/test.dart';
import 'package:flutter/material.dart';

import '../../old/Views/ComplementView/OnboardingScreen.dart';
import '../../old/Views/Home/HomeView.dart';
import '../../old/Views/Livraison/NewLivraisonView.dart';
import '../../presentation/home/home_page.dart';
import '../../presentation/layer/onboardingpage.dart';
import '../../presentation/layer/splashscreen.dart';
import '../../presentation/livraison/NewLivraisonPage.dart';
import '../../presentation/livraison/SuccesLivraisonview.dart';
import '../../presentation/livraison/SuccesReceptionview.dart';
import '../../presentation/livraison/SuccesRecuperationview.dart';
import '../../presentation/user/auth_page.dart';
import '../../presentation/user/register_view.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    // AppLinks.LOGIN: (_) => AuthView(),
    AppLinks.HOME: (_) => HomeView(),
    AppLinks.REGISTER: (_) => RegisterView(),
    AppLinks.FORGOT: (_) => ForgotPassordScreen(),
    AppLinks.SPLASHSCREEN: (_) => SplashScreenPage(),
    AppLinks.TEST: (_) => Test(),
    AppLinks.ONBOARDING: (_) => OnBoardingView(),
    AppLinks.SETTING: (_) => SettingView(),
    AppLinks.POLITIQUE: (_) => PolitiqueView(),
    AppLinks.USERVIEW: (_) => UserManageView(),
    // AppLinks.NOTIFICATION: (_) => NotificationView(),
    AppLinks.NEWLIVRAISON: (_) => Stack(
          children: [
            NewLivraisonView(),
          ],
        ),
    AppLinks.SUCCESSLIVRAISON: (_) => SuccesLivraisonview(),
    AppLinks.SUCCESSRECUPERATION: (_) => SuccesRecuperationview(),
    AppLinks.SUCCESSRECEPTION: (_) => SuccesReceptionview(),
  };
}

class AppLinks {
  static const String NEWLIVRAISON = '/newlivraison';
  static const String SUCCESSLIVRAISON = '/succeslivraison';
  static const String SETTING = '/setting';
  static const String TEST = '/TEST';
  static const String LOGIN = '/login';
  static const String HOME = '/home';
  static const String REGISTER = '/register';
  static const String ABOUTUS = '/aboutus';
  static const String FORGOT = '/forgot';
  static const String SPLASHSCREEN = '/splashscreen';
  static const String ONBOARDING = '/onboarding';
  static const String USERVIEW = '/userview';
  static const String NOTIFICATION = '/notifications';
  static const String POLITIQUE = '/politique';
  static const String SUCCESSRECUPERATION = '/srecup';
  static const String SUCCESSRECEPTION = '/srecep';
}
