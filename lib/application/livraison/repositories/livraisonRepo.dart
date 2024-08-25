import 'package:BabanaExpress/infrastructure/_commons/exceptions.dart';
import 'package:BabanaExpress/infrastructure/_commons/network/app_requests.dart';
import 'package:BabanaExpress/infrastructure/_commons/throw_error.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

import '../../../utils/constants/apiRoutes.dart';

class LivraisonRepo {
  final IAppRequests apiClient;
  LivraisonRepo({required this.apiClient});
  final key = 'AIzaSyB2lLkho9yRrZ9DgZ4btFOZ6x22-zZTJ38';
  Future newLivraisonType1(data) async {
    Response a = await apiClient.postRequest(ApiRoutes.LIVRAISONS + '/type-1',
        body: data);

    return a;
  }

  Future getMapPlaceInfo(long, lat) async {
    Response a =
        await apiClient.getRequest('/location/user?long=${long}&lat=${lat}');

    return a;
  }

  Future getConversationColis(idColis) async {
    Response a = await apiClient
        .getRequest(ApiRoutes.LIVRAISONS + '/conversation/${idColis}');

    return a;
  }

  Future downloadRapportLivraison(id) async {
    Response response =
        await apiClient.getRequest('/imprimer/facture-livraison/${id}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      String ret = response.data['url'];
      String path = (await getTemporaryDirectory()).path;
      print(
        ret.split('/')[ret.split('/').length - 1],
      );
      var name = ret.split('/')[ret.split('/').length - 1];
      print('$path/$name');
      await apiClient.download(ret, path: '$path/$name');
      print('$path/$name');
      return '$path/$name';
    } else {
      throw ServerException(errorThrow(response));
    }
  }

  Future autoCompleteMapPlace(search) async {
    Response a = await apiClient
        .getRequest('/point_localisations/autocomplete?search=${search}');

    return a;
  }

  Future searchMapPlaceInfo(name, type) async {
    Response a = await apiClient.getRequest(
        '/point_localisations/findposition?name=${name}&type=${type}');

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

  Future newLivraisonType2(data) async {
    Response a = await apiClient.postRequest(ApiRoutes.LIVRAISONS + '/type-2',
        body: data);

    return a;
  }

  Future calculFraisLivraisonType2(data) async {
    Response a = await apiClient.postRequest(ApiRoutes.LIVRAISONS + '/frais',
        body: data);

    return a;
  }

  Future verifyLivraisonStatePaiement(livraisonId) async {
    Response a = await apiClient.getRequest(
      ApiRoutes.LIVRAISONS + '/verifier-etat/${livraisonId}',
    );

    return a;
  }

  Future getCurrentLivraisonsState(keySecret) async {
    Response a = await apiClient.getRequest(ApiRoutes.LIVRAISONS +
        '/current-user-livraison-state?keySecret=${keySecret}');

    return a;
  }
}
