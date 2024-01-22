import 'package:BananaExpress/Views/Livraison/NewLivraisonView.dart';
import 'package:BananaExpress/Views/Livraison/SuccesLivraisonview.dart';
import 'package:BananaExpress/Views/Livraison/SuccesReceptionview.dart';
import 'package:BananaExpress/Views/Livraison/SuccesRecuperationview.dart';
import '../../ui/home/views/HomeView.dart';
import '../../ui/layer/OnboardingScreen.dart';
  
import 'package:BananaExpress/Views/ComplementView/PolitiqueView.dart';
import 'package:BananaExpress/Views/User/SettingView.dart';
import 'package:BananaExpress/Views/User/UserManageView.dart';
import 'package:BananaExpress/Views/User/forgotPassword.dart';
import 'package:BananaExpress/test.dart';
import 'package:BananaExpress/ui/user/views/auth_view.dart';
import 'package:BananaExpress/ui/user/views/register_view.dart';
import 'package:BananaExpress/utils/Services/core.dart';
import 'package:flutter/material.dart';

import '../../ui/layer/SplashScreen.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    
    AppLinks.LOGIN: (_) => AuthView(),
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
    AppLinks.NEWLIVRAISON: (_) => NewLivraisonView(),
    AppLinks.SUCCESSLIVRAISON: (_) => SuccesLivraisonview(),
    AppLinks.SUCCESSRECUPERATION: (_) => SuccesRecuperationview(),
    AppLinks.SUCCESSRECEPTION: (_) => SuccesReceptionview(),
  };
}

class AppLinks {
  static const String NEWLIVRAISON = "/newlivraison";
  static const String SUCCESSLIVRAISON = "/succeslivraison";
  static const String SETTING = "/setting";
  static const String TEST = "/TEST";
  static const String LOGIN = "/login";
  static const String HOME = "/home";
  static const String REGISTER = "/register";
  static const String ABOUTUS = "/aboutus";
  static const String FORGOT = "/forgot"; 
  static const String SPLASHSCREEN = "/splashscreen";
  static const String ONBOARDING = "/onboarding";
  static const String USERVIEW = "/userview";
  static const String NOTIFICATION = "/notifications";
  static const String POLITIQUE = "/politique";
  static const String SUCCESSRECUPERATION = "/srecup";
  static const String SUCCESSRECEPTION = "/srecep";
}
