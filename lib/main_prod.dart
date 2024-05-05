import 'package:BabanaExpress/application/compte/repositories/compteRepo.dart';
import 'package:BabanaExpress/application/connected/connected_bloc.dart';
import 'package:BabanaExpress/application/database/database_cubit.dart';
import 'package:BabanaExpress/application/market/repositories/marketRepo.dart';
import 'package:BabanaExpress/application/pharmacy/repositories/pharmacy_repository.dart';
import 'package:BabanaExpress/application/splash/splash_bloc.dart';

import 'package:BabanaExpress/application/livraison/repositories/livraisonRepo.dart';
import 'package:BabanaExpress/application/user/repositories/user_repository.dart';
import 'package:BabanaExpress/presentation/app.dart';

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/Services/NotificationService.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'infrastructure/_commons/network/env_config.dart';
import 'presentation/_commons/theming/app_theme.dart';
import 'routes/app_router.dart';
import 'core.dart' as co;
import 'core.dart';
import 'package:BabanaExpress/application/export_bloc.dart';

import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await EnvManager().init(env: Environment.prod);

  co.init();

  await NotificationService().initializePlatformNotifications();
  configLoading();

  runApp(
    EasyLocalization(
        supportedLocales: supportedLocales,
        path: 'assets/translations',
        fallbackLocale: const Locale('fr', 'FR'),
        child: Phoenix(child: AppContent())),
  );
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}

class CustomAnimation extends EasyLoadingAnimation {
  CustomAnimation();

  @override
  Widget buildWidget(
    Widget child,
    AnimationController controller,
    AlignmentGeometry alignment,
  ) {
    return Opacity(
      opacity: controller.value,
      child: RotationTransition(
        turns: controller,
        child: child,
      ),
    );
  }
}

var supportedLocales = const [
  Locale('en', 'US'),
  Locale('fr', 'FR'),
];
 