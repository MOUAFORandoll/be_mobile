import 'package:BabanaExpress/infrastructure/_commons/network/app_requests.dart';
import 'package:dio/dio.dart';

import '../../../utils/constants/apiRoutes.dart';

class CallCenterRepo {
  final IAppRequests apiClient;
  CallCenterRepo({required this.apiClient});
  final key = 'AIzaSyB2lLkho9yRrZ9DgZ4btFOZ6x22-zZTJ38';
  Future newMessage(data) async {
    Response response =
        await apiClient.postRequest(ApiRoutes.CALLCENTERUSER, body: data);

    return response;
  }

  Future getMessage(keySecret) async {
    Response response = await apiClient
        .getRequest(ApiRoutes.CALLCENTERUSER + '?keySecret=${keySecret}');

    return response;
  }

  Future deleteMessage(idMessage) async {
    Response response = await apiClient
        .deleteRequest(ApiRoutes.CALLCENTERUSER + '/${idMessage}');

    return response;
  }

  Future updateMessage(idMessage, data) async {
    Response response = await apiClient
        .patchRequest(ApiRoutes.CALLCENTERUSER + '/${idMessage}', body: data);

    return response;
  }
}
