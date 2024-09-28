import 'package:BabanaExpress/config_loading_file.dart';
import 'package:BabanaExpress/presentation/app.dart';

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/Services/NotificationService.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'infrastructure/_commons/network/env_config.dart';
import 'core.dart' as co;
import 'package:flutter_phoenix/flutter_phoenix.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await EnvManager().init(env: Environment.prod);

  co.init();

  await NotificationService().initializePlatformNotifications();
  configLoadingLoading();

  // runApp(
  //   EasyLocalization(
  //       supportedLocales: supportedLocales,
  //       path: 'assets/translations',
  //       fallbackLocale: const Locale('fr', 'FR'),
  //       child: Phoenix(child: AppContent())),
  // );
}

var supportedLocales = const [
  Locale('en', 'US'),
  Locale('fr', 'FR'),
];
