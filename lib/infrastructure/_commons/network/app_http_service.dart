import 'package:BananaExpress/infrastructure/_commons/network/interceptors/request_headers_interceptor.dart';
import 'package:BananaExpress/infrastructure/_commons/network/request_url.dart';
import 'package:BananaExpress/utils/Services/apiUrl.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AppHttpService {
  static Dio? _instance;

  static String baseUrl = RequestUrl().apiUrl;

  AppHttpService._internal();

  static Dio getInstance({bool? isPostRequest}) {
    if (_instance != null) {
      return _instance!;
    }

    _instance = Dio()
          ..options.baseUrl = baseUrl
          ..options.followRedirects = false
          ..options.connectTimeout = const Duration(minutes: 5)
          ..options.receiveTimeout = const Duration(minutes: 5)
          ..options.validateStatus = (status) {
            return status! < 501;
          }
        // ..interceptors.add(PrettyDioLogger(requestHeader: true, compact: true))
        // ..interceptors.add(RequestHeaderInterceptorJsonImpl() )

        ;
    return _instance!;
  }
}
