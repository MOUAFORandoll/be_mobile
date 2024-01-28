import 'package:dio/dio.dart';

import 'app_http_service.dart';

abstract class IAppRequests {
  Future<Response> getRequest(
    String request, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<Response> postRequest(
    String request, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
    Map<String, dynamic>? headers,
  });

  Future<Response> patchRequest(
    String request, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  });

  Future<Response> putRequest(
    String request, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
  });

  Future<Response> deleteRequest(
    String request, {
    Map<String, dynamic>? headers,
  });
}

class AppRequests implements IAppRequests {
  @override
  Future<Response> getRequest(
    String request, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    final options = Options(headers: headers);
    return await AppHttpService.getInstance().get(
      request,
      queryParameters: queryParameters,
      options: options,
    );
  }

  @override
  Future<Response> postRequest(
    String request, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
    Map<String, dynamic>? headers,
  }) async {
    final options = Options(headers: headers);
    return AppHttpService.getInstance(isPostRequest: true).post(
      request,
      queryParameters: queryParameters,
      data: body,
      options: options,
    );
  }

  @override
  Future<Response> patchRequest(
    String request, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) async {
    final options = Options(headers: headers);
    return AppHttpService.getInstance().patch(
      request,
      queryParameters: queryParameters,
      data: body,
      options: options,
    );
  }

  @override
  Future<Response> putRequest(
    String request, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
  }) async {
    final options = Options(headers: headers);
    return AppHttpService.getInstance()
        .put(request, options: options, data: body);
  }

  @override
  Future<Response> deleteRequest(
    String request, {
    Map<String, dynamic>? headers,
  }) async {
    final options = Options(headers: headers);
    return AppHttpService.getInstance().delete(
      request,
      options: options,
    );
  }
}
