import 'package:BabanaExpress/infrastructure/_commons/network/app_requests.dart';
import 'package:dio/dio.dart';

import '../../../utils/constants/apiRoutes.dart';

class CompteRepo {
  final IAppRequests apiClient;
  CompteRepo({required this.apiClient});
  final key = 'AIzaSyB2lLkho9yRrZ9DgZ4btFOZ6x22-zZTJ38';

  Future getListTransaction(keySecret) async {
    Response _reponse = await apiClient.getRequest(
        ApiRoutes.TRANSACTION_READ + '?keySecret=' + keySecret.toString());

    return _reponse;
  }

  Future retraitCompte(data) async {
    Response _reponse =
        await apiClient.postRequest(ApiRoutes.TRANSACTION_RETRAIT, body: data);

    return _reponse;
  }

  Future creditCompte(data) async {
    Response _reponse =
        await apiClient.postRequest(ApiRoutes.TRANSACTION_DEPOT, body: data);

    return _reponse;
  }
}
