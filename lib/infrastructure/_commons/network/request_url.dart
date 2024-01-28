import 'package:BananaExpress/infrastructure/_commons/network/env_config.dart';

class RequestUrl {
  String baseUrl = EnvManager().getBaseUrl();
  String get apiUrl => '$baseUrl/api/v1';
  String get imageBaseUrl => baseUrl;
}
