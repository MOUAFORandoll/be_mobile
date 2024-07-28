import 'package:BabanaExpress/infrastructure/_commons/network/app_requests.dart';
import 'package:dio/dio.dart';

import '../../../utils/constants/apiRoutes.dart';

class CompteRepo {
  final IAppRequests apiClient;
  CompteRepo({required this.apiClient});
  final key = 'AIzaSyB2lLkho9yRrZ9DgZ4btFOZ6x22-zZTJ38';

  Future getListTransaction(keySecret) async {
    Response a = await apiClient.getRequest(
        ApiRoutes.TRANSACTION_READ + '?keySecret=' + keySecret.toString());

    return a;
  }

  Future retraitCompte(data) async {
    Response a =
        await apiClient.postRequest(ApiRoutes.TRANSACTION_RETRAIT, body: data);

    return a;
  }

  Future creditCompte(data) async {
    Response a =
        await apiClient.postRequest(ApiRoutes.TRANSACTION_DEPOT, body: data);

    return a;
  }
}
