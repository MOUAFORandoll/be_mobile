import 'dart:developer';

import 'package:BabanaExpress/infrastructure/_commons/network/request_url.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';
import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:potatoes/libs.dart';
import 'package:potatoes/potatoes.dart' as potatoes;

class ApiLinks extends potatoes.Links {
  const ApiLinks();

  @override
  String get devUrl => RequestUrl().apiUrl;

  @override
  // TODO: implement productionUrl
  String get productionUrl => RequestUrl().apiUrl;

  @override
  String get stagingUrl => RequestUrl().apiUrl;
}

class ApiService extends potatoes.ApiService {
  final CacheOptions? cacheOptions;

  const ApiService(super._dio, [this.cacheOptions]);

  @override
  Future<T> compute<T>(Future<Response<dynamic>> request,
      {String? mapperKey,
      T Function(Map<String, dynamic> p1)? mapper,
      T Function(String p1)? messageMapper}) async {
    assert(mapper == null || messageMapper == null);
    try {
      Response response = await request;

      if (response.data != null) {
        return defaultExtractResult(
            response.data, mapperKey, mapper, messageMapper);
      } else {
        if (response.data['error'] != null) {
          throw response.data['error'];
        }
        throw response.data['detail'];
      }
    } on DioException catch (e) {
      throw potatoes.ApiError.fromDio(e);
    } on Map<String, dynamic> catch (errors, s) {
      // API error as Map
      throw ApiError.fromApi(errors, s);
    } on String catch (e) {
      // API error as single string. Is either 'error' or 'detail'
      throw ApiError.unknown(e);
    } catch (e, s) {
      throw potatoes.ApiError.unknown(e.toString(), s);
    }
  }

  PaginatedList<T> toPaginatedList<T>(
      Map<String, dynamic> data, T Function(Map<String, dynamic> item) mapper) {
    return PaginatedList(
        items: (data['content'] as List<dynamic>)
            .map((e) => mapper(e as Map<String, dynamic>))
            .toList(),
        page: data['page'],
        total: data['total']);
  }
}

class ApiError extends potatoes.ApiError {
  final Map<String, String>? errors;

  ApiError.fromDio(super.dio)
      : errors = null,
        super.fromDio();

  const ApiError.unknown(super.message, [super.trace])
      : errors = null,
        super.unknown();

  ApiError.fromApi(Map<String, dynamic> errors, [StackTrace? trace])
      : errors = errors.map((key, value) => MapEntry(key, value.toString())),
        super.unknown(null, trace);

  @override
  bool get isUnauthenticatedError =>
      super.statusCode == 400 || super.isUnauthenticatedError;

  @override
  List<Object?> get props => [...super.props, errors];
}

Future<CacheOptions> cacheStoreOptions() {
  return getTemporaryDirectory().then((directory) {
    return CacheOptions(
      store: HiveCacheStore(directory.path),
      maxStale: const Duration(days: 1),
      policy: CachePolicy.noCache,
    );
  });
}


//  ApiService(Dio dio, [this.cacheOptions]) : super(dio) {
//     dio.interceptors.add(
//       InterceptorsWrapper(
//         onRequest: (options, handler) async {
//           // Ajout du token d'authentification à chaque requête
//           final prefs = await SharedPreferences.getInstance();
//           final token = prefs.getString('auth_token');
//           if (token != null) {
//             options.headers['Authorization'] = 'Bearer $token';
//           }
//           return handler.next(options);
//         },
//         onError: (DioException error, handler) async {
//           if (error.response?.statusCode == 401) {
//             // Token expiré, essayons de le rafraîchir
//             if (await _refreshToken()) {
//               // Retry the request with the new token
//               return handler.resolve(await _retry(error.requestOptions));
//             }
//           }
//           return handler.next(error);
//         },
//       ),
//     );
//   }

//   Future<bool> _refreshToken() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final refreshToken = prefs.getString('refresh_token');
//       if (refreshToken == null) return false;

//       final response = await _dio.post('/refresh-token', data: {'refresh_token': refreshToken});
//       if (response.statusCode == 200) {
//         final newToken = response.data['token'];
//         final newRefreshToken = response.data['refresh_token'];
//         await prefs.setString('auth_token', newToken);
//         await prefs.setString('refresh_token', newRefreshToken);
//         return true;
//       }
//     } catch (e) {
//       print('Erreur lors du rafraîchissement du token: $e');
//     }
//     return false;
//   }

//   Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
//     final options = Options(
//       method: requestOptions.method,
//       headers: requestOptions.headers,
//     );
//     return dio.request<dynamic>(requestOptions.path,
//         data: requestOptions.data,
//         queryParameters: requestOptions.queryParameters,
//         options: options);
//   }