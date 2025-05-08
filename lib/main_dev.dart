import 'package:BabanaExpress/config_loading_file.dart';
import 'package:BabanaExpress/presentation/app.dart';

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/Services/NotificationService.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:potatoes/common/services/api_service.dart';
import 'package:potatoes_secured_preferences/potatoes_secured_preferences.dart';
import 'infrastructure/_commons/network/env_config.dart';
import 'core.dart' as co;
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:BabanaExpress/common/bloc/user_cubit.dart';
import 'package:BabanaExpress/common/services/api_service.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await EnvManager().init(env: Environment.dev);

  co.init();

  await NotificationService().initializePlatformNotifications();
  configLoadingLoading();
  final cacheOptions = await cacheStoreOptions();
  Links.instance = const ApiLinks();
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  const FlutterSecureStorage secureStorage = FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true));
  runApp(
    EasyLocalization(
        supportedLocales: supportedLocales,
        path: 'assets/translations',
        fallbackLocale: const Locale('fr', 'FR'),
        child: Phoenix(
            child: AppContent(
          navigatorKey: GlobalKey(),
          preferences: preferences,
          secureStorage: secureStorage,
          cacheOptions: cacheOptions,
        ))),
  );
}

var supportedLocales = const [
  Locale('en', 'US'),
  Locale('fr', 'FR'),
];
