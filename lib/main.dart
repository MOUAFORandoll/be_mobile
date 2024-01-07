import 'package:BananaExpress/controller/GeneralController.dart';
import 'package:BananaExpress/utils/Services/NotificationService.dart';
import 'package:BananaExpress/utils/Services/core.dart';
import 'package:BananaExpress/utils/Services/routing.dart';
import 'package:BananaExpress/utils/Services/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import 'styles/colorApp.dart';
import 'styles/textStyle.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initializePlatformNotifications();
  // await FlutterDownloader.initialize(debug: true);

  await initServices();

// await MyBinding().onInit();

  runApp(MyApp());
  await initApp();

// await init();
}

final _darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: ColorsApp.primary,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  // accentColor: Colors.white,
  // accentIconTheme: IconThemeData(color: ColorsApp.primary),
  dividerColor: ColorsApp.primary,
  textTheme: TextTheme(
    bodyText2: TextStyle(fontFamily: 'Montserrat', color: ColorsApp.primary),
  ),
);

final _lightTheme = ThemeData(
  // primaryColor: Colors.white,
  brightness: Brightness.light,
  iconTheme: IconThemeData(
    color: ColorsApp.primary,
  ),
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: kBasics + 1,
        color: ColorsApp.primary,
        fontWeight: FontWeight.w700),
  ),
  dividerColor: Colors.white54,
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kBasics,
      color: ColorsApp.primary,
    ),
    displayLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      fontSize: kBasics,
      color: ColorsApp.primary,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kBasics,
      color: ColorsApp.primary,
    ),
    displaySmall: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kBasics,
      color: ColorsApp.primary,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kBasics,
      color: ColorsApp.primary,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kBasics,
      color: ColorsApp.primary,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kTitle,
      color: ColorsApp.primary,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kTitle,
      color: ColorsApp.primary,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kTitle,
      color: ColorsApp.primary,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kBasics,
      color: ColorsApp.primary,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kBasics,
      color: ColorsApp.primary,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kBasics,
      color: ColorsApp.primary,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: kBasics,
      color: ColorsApp.primary,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.grey,
    backgroundColor: ColorsApp.bg,
    errorColor: ColorsApp.second,
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // if (Theme.of(context).brightness == Brightness.dark) {
    //   box.write('isDark', true);
    // } else {
    //   box.write('isDark', false);
    // }

    // Get.find<GeneralController>().getThemeInit(context);

    return GetMaterialApp(
      translations: Transalations(),
      locale: Get.find<GeneralController>().lan,
      theme: _lightTheme,
      darkTheme: _darkTheme,
      themeMode: ThemeMode.light, //ThemeMode.system,
      debugShowCheckedModeBanner: false,
      // initialBinding: MyBinding(),
      initialRoute: AppLinks.SPLASHSCREEN,
      getPages: AppRoutes.pages,
    );
  }
}


// flutter pub run flutter_launcher_icons:main