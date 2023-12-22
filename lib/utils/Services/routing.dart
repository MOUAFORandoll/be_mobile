import 'package:BananaExpress/Views/Livraison/NewLivraisonView.dart';
import 'package:BananaExpress/Views/Livraison/SuccesLivraisonview.dart';
import 'package:BananaExpress/Views/Notifications/NotificationView.dart';
import 'package:BananaExpress/Views/ComplementView/OnboardingScreen.dart';
import 'package:BananaExpress/Views/FirstScreen.dart';
import 'package:BananaExpress/Views/ComplementView/SplashScreen.dart';
import 'package:BananaExpress/Views/Home/HomeView.dart';
import 'package:BananaExpress/Views/ComplementView/PolitiqueView.dart';
import 'package:BananaExpress/Views/User/RegisterScreen.dart';
import 'package:BananaExpress/Views/User/SettingView.dart';
import 'package:BananaExpress/Views/User/UserManageView.dart';
import 'package:BananaExpress/Views/User/forgotPassword.dart';
import 'package:BananaExpress/test.dart';
import 'package:BananaExpress/utils/Services/core.dart';
import 'package:BananaExpress/Views/User/LoginScreen.dart';
import 'package:get/get.dart';

var transitionX = Transition.leftToRight;

class AppRoutes {
  static final pages = [
    GetPage(
        name: AppLinks.FIRST,
        page: () {
          secondInit();
          return FirstScreen();
        },
        transition: transitionX),
    GetPage(
        name: AppLinks.LOGIN,
        page: () => LoginScreen(),
        transition: transitionX),
    GetPage(
        name: AppLinks.HOME,
        children: [],
        page: () => HomeView(),
        transition: transitionX),
    GetPage(
        name: AppLinks.REGISTER,
        page: () => RegisterScreen(),
        transition: transitionX),
    GetPage(
      name: AppLinks.FORGOT,
      page: () => ForgotPassordScreen(),
      transition: transitionX,
    ),
    GetPage(
        name: AppLinks.SPLASHSCREEN,
        page: () => SplashScreenPage(),
        transition: transitionX),
    GetPage(name: AppLinks.TEST, page: () => Test()),
    GetPage(
        name: AppLinks.ONBOARDING,
        page: () => OnBoardingView(),
        transition: transitionX),
    GetPage(
        name: AppLinks.SETTING,
        page: () => SettingView(),
        transition: transitionX),
    GetPage(
        name: AppLinks.POLITIQUE,
        page: () => PolitiqueView(),
        transition: transitionX),
    GetPage(
        name: AppLinks.USERVIEW,
        page: () => UserManageView(),
        transition: transitionX),
    GetPage(
        name: AppLinks.NOTIFICATION,
        page: () => NotificationView(),
        transition: transitionX),
    GetPage(
        name: AppLinks.NEWLIVRAISON,
        page: () => NewLivraisonView(),
        transition: transitionX),
    GetPage(
        name: AppLinks.SUCCESSLIVRAISON,
        page: () => SuccesLivraisonview(),
        transition: transitionX),
  ];
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
  static const String FIRST = "/first";
  static const String SPLASHSCREEN = "/splashscreen";
  static const String ONBOARDING = "/onboarding";
  static const String USERVIEW = "/userview";
  static const String NOTIFICATION = "/notifications";
  static const String POLITIQUE = "/politique";
}
