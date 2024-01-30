import 'package:BananaExpress/infrastructure/_commons/network/env_config.dart';

class RequestUrl {
  String baseUrl = EnvManager().getBaseUrl();
  String   socketUrl
 = EnvManager().  getSocketUrl
();
  String get apiUrl => '$baseUrl';
  String get imageBaseUrl => baseUrl;
}
