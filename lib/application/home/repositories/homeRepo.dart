import 'package:BabanaExpress/infrastructure/_commons/network/app_requests.dart';
import 'package:dio/dio.dart';

import '../../../utils/constants/apiRoutes.dart';

class HomeRepo {
  final IAppRequests apiClient;
  HomeRepo({required this.apiClient});

  Future getHomeLivraisonsState(keySecret) async {
    Response a = await apiClient.getRequest(
        ApiRoutes.LIVRAISONS + '/user-home-state?keySecret=${keySecret}');

    return a;
  }

  Future getServices() async {
    Response a = await apiClient.getRequest(ApiRoutes.SERVICES);

    return a;
  }

  Future findLivraisonById(idLivraison) async {
    Response a = await apiClient.getRequest(
        ApiRoutes.LIVRAISONS + '/info-home-user?idLivraison=${idLivraison}');

    return a;
  }
}
