import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flavor/flavor.dart' as flv;

enum Environment { dev, stage, prod }

Map<String, dynamic> devConstants = {
  'env_path': 'assets/env/.dev',
};

Map<String, dynamic> stageConstants = {
  'env_path': 'assets/env/.stage',
};

Map<String, dynamic> prodConstants = {
  'env_path': 'assets/env/.prod',
};

abstract class IEnvManager {
  Future<void> setEnvironment({required String? env, required bool restart});
  String getBaseUrl();
  String getEnvName();
  bool getSandBox();
  String getkkiapayApikey();
  Future<Environment?> getEnvironment();
  flv.Environment getFlavorEnv();
}

class EnvManager implements IEnvManager {
  static const Environment defaultEnv = Environment.dev;
  static const emailEnv = 'env@app.com';
  static const envKey = 'ENV_KEY';

  init({Environment? env}) async {
    return _setEnvironment(env: env ?? await getEnvironment(), restart: false);
  }

  @override
  Future<Environment?> getEnvironment() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? env = preferences.getString(envKey);
    if (env == null) return defaultEnv;
    Environment? currentEnv;
    for (var e in Environment.values) {
      if (e.name == env) currentEnv = e;
    }
    return currentEnv;
  }

  @override
  Future<void> setEnvironment(
      {required String? env, required bool restart}) async {
    for (var e in Environment.values) {
      if (e.name == env) {
        return _setEnvironment(env: e, restart: restart);
      }
    }
  }

  Future<void> _setEnvironment(
      {required Environment? env, required bool restart}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Map<String, dynamic> config = {};
    if (env == null) {
      env = defaultEnv;
      config = stageConstants;
    } else {
      switch (env) {
        case Environment.dev:
          config = devConstants;
          break;
        case Environment.stage:
          config = stageConstants;
          break;
        case Environment.prod:
          config = prodConstants;
          break;
        default:
          config = stageConstants;
          break;
      }
    }
    await dotenv.load(fileName: config['env_path']);
    await preferences.setString(envKey, env.name);
  }

  @override
  String getBaseUrl() => dotenv.env['BASE_URL']!;

  @override
  String getEnvName() => dotenv.env['NAME']!;

  bool get isStaging => dotenv.env['NAME']! == 'staging';
  bool get isProdruction => dotenv.env['NAME']! == 'production';
  bool get isDevelopment => dotenv.env['NAME']! == 'testing';

  @override
  flv.Environment getFlavorEnv() {
    switch (getEnvName()) {
      case 'development':
        return flv.Environment.dev;
      case 'production':
        return flv.Environment.production;
      default:
        return flv.Environment.dev;
    }
  }

  @override
  bool getSandBox() => dotenv.env['SANDBOX'] == 'true' ? true : false;

  @override
  String getkkiapayApikey() => dotenv.env['KKIAPAY_KEY']!;
}
