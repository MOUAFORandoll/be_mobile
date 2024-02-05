import 'package:BananaExpress/infrastructure/_commons/network/app_requests.dart'; 
import 'package:dio/dio.dart';
 
import '../../../utils/constants/apiRoute.dart';

class LivraisonRepo {
  final IAppRequests apiClient;
  LivraisonRepo({required this.apiClient});

  Future newLivraison(data) async {
    Response a = await apiClient.postRequest(ApiRoutes.LIVRAISONS, body: data);

    return a;
  }

  Future calculFraisLivraison(data) async {
    Response a = await apiClient.postRequest(ApiRoutes.LIVRAISONS + '/frais',
        body: data);

    return a;
  }

  Future recuperationColis(data) async {
    Response a = await apiClient
        .patchRequest(ApiRoutes.LIVRAISONS + '/recuperation', body: data);

    return a;
  }

  Future receptionColis(data) async {
    Response a = await apiClient
        .patchRequest(ApiRoutes.LIVRAISONS + '/reception', body: data);

    return a;
  }
  
  Future getHistoryLivraisons(keySecret) async {
    Response a = await apiClient
        .getRequest(ApiRoutes.LIVRAISONS + '/user?keySecret=${keySecret}');

    return a;
  }
  
  Future getInfoLivraisonsForHistory(keySecret) async {
    Response a = await apiClient
        .getRequest(ApiRoutes.LIVRAISONS + '?keySecret=${keySecret}');

    return a;
  }
   

  Future getInfoLivraisonsForBabana(id) async {
    Response a = await apiClient
        .getRequest(ApiRoutes.LIVRAISONS + 'babana/info?id=${id}');

    return a;
  }

  Future getLivraisonPointByVille(id) async {
    Response a =
        await apiClient.getRequest(ApiRoutes.LIVRAISON_POINT + '?ville=${id}');

    return a;
  }

  Future getPointRecuperationUser(keySecret) async {
    Response a = await apiClient
        .getRequest(ApiRoutes.LIVRAISON_POINT + '/user?keySecret=${keySecret}');

    return a;
  }
   

  Future test(indexC) async {
    Response a = await apiClient.getRequest(
      ApiRoutes.TEST + '/' + indexC.toString(),
    );

    return a;
  }

  Future getCategory() async {
    Response a = await apiClient.getRequest(
      ApiRoutes.CATEGORY,
    );

    return a;
  }

  Future getVille() async {
    Response a = await apiClient.getRequest(
      ApiRoutes.VILLE,
    );

    return a;
  }

  Future getModePaiement() async {
    Response a = await apiClient.getRequest(
      ApiRoutes.MODEPAIEMENT,
    );

    return a;
  }

  Future getListNotifications(index, keySecret) async {
    Response a = await apiClient.getRequest(
      ApiRoutes.LIST_NOTIFICATIONS +
          '?page=${index.toString()}&keySecret=${keySecret.toString()}',
    );

    return a;
  }
 

  Future readNotifications(idNotification) async {
    Response a = await apiClient.getRequest(
      ApiRoutes.READ_NOTIFICATIONS + '?id=${idNotification.toString()}',
    );

    return a;
  }
}
