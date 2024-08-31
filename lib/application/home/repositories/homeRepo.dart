import 'package:BabanaExpress/infrastructure/_commons/network/app_requests.dart';
import 'package:dio/dio.dart';

import '../../../utils/constants/apiRoutes.dart';

class HomeRepo {
  final IAppRequests apiClient;
  HomeRepo({required this.apiClient});

  Future getHomeLivraisonsState(keySecret) async {
    print(
        '---------keySecret-------------------------*ataEvent***${keySecret}');
    Response _reponse = await apiClient
        .getRequest('/livraisons/user-home-state?keySecret=${keySecret}');

    return _reponse;
  }

  Future getServices() async {
    Response _reponse = await apiClient.getRequest(ApiRoutes.SERVICES);

    return _reponse;
  }

  Future findLivraisonById(idLivraison) async {
    Response _reponse = await apiClient.getRequest(
        ApiRoutes.LIVRAISONS + '/info-home-user?idLivraison=${idLivraison}');

    return _reponse;
  }
}
