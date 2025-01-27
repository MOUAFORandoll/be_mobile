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
    Response _reponse = await apiClient
        .postRequest(ApiRoutes.LIVRAISONS + '/type-1', body: data);

    return _reponse;
  }

  Future getMapPlaceInfo(long, lat) async {
    Response _reponse =
        await apiClient.getRequest('/location/user?long=${long}&lat=${lat}');

    return _reponse;
  }

  Future getConversationColis(idColis) async {
    Response _reponse = await apiClient
        .getRequest(ApiRoutes.LIVRAISONS + '/conversation/${idColis}');

    return _reponse;
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
    Response _reponse = await apiClient
        .getRequest('/point_localisations/autocomplete?search=${search}');

    return _reponse;
  }

  Future searchMapPlaceInfo(name, type) async {
    Response _reponse = await apiClient.getRequest(
        '/point_localisations/findposition?name=${name}&type=${type}');

    return _reponse;
  }

  Future calculFraisLivraison(data) async {
    Response _reponse = await apiClient
        .postRequest(ApiRoutes.LIVRAISONS + '/frais', body: data);

    return _reponse;
  }

  Future recuperationColis(data) async {
    Response _reponse = await apiClient
        .patchRequest(ApiRoutes.LIVRAISONS + '/recuperation', body: data);

    return _reponse;
  }

  Future receptionColis(data) async {
    Response _reponse = await apiClient
        .patchRequest(ApiRoutes.LIVRAISONS + '/reception', body: data);

    return _reponse;
  }

  Future getHistoryLivraisons(keySecret) async {
    Response _reponse = await apiClient
        .getRequest(ApiRoutes.LIVRAISONS + '/user?keySecret=${keySecret}');

    return _reponse;
  }

  Future getLivraisonPointByVille(id) async {
    Response _reponse =
        await apiClient.getRequest(ApiRoutes.LIVRAISON_POINT + '?ville=${id}');

    return _reponse;
  }

  Future getPointRecuperationUser(keySecret) async {
    Response _reponse = await apiClient
        .getRequest(ApiRoutes.LIVRAISON_POINT + '/user?keySecret=${keySecret}');

    return _reponse;
  }

  Future test(indexC) async {
    Response _reponse = await apiClient.getRequest(
      ApiRoutes.TEST + '/' + indexC.toString(),
    );

    return _reponse;
  }

  Future getCategory() async {
    Response _reponse = await apiClient.getRequest(
      ApiRoutes.CATEGORY,
    );

    return _reponse;
  }

  Future getVille() async {
    Response _reponse = await apiClient.getRequest(
      ApiRoutes.VILLE,
    );

    return _reponse;
  }

  Future getModePaiement() async {
    Response _reponse = await apiClient.getRequest(
      ApiRoutes.MODEPAIEMENT,
    );

    return _reponse;
  }

  Future getListNotifications(index, keySecret) async {
    Response _reponse = await apiClient.getRequest(
      ApiRoutes.LIST_NOTIFICATIONS +
          '?page=${index.toString()}&keySecret=${keySecret.toString()}',
    );

    return _reponse;
  }

  Future readNotifications(idNotification) async {
    Response _reponse = await apiClient.getRequest(
      ApiRoutes.READ_NOTIFICATIONS + '?id=${idNotification.toString()}',
    );

    return _reponse;
  }

  Future newLivraisonType2(data) async {
    Response _reponse = await apiClient
        .postRequest(ApiRoutes.LIVRAISONS + '/type-2', body: data);

    return _reponse;
  }

  Future calculFraisLivraisonType2(data) async {
    Response _reponse = await apiClient
        .postRequest(ApiRoutes.LIVRAISONS + '/frais', body: data);

    return _reponse;
  }

  Future verifyLivraisonStatePaiement(livraisonId) async {
    Response _reponse = await apiClient.getRequest(
      ApiRoutes.LIVRAISONS + '/verifier-etat/${livraisonId}',
    );

    return _reponse;
  }

  Future getCurrentLivraisonsState(keySecret) async {
    Response _reponse = await apiClient.getRequest(ApiRoutes.LIVRAISONS +
        '/current-user-livraison-state?keySecret=${keySecret}');

    return _reponse;
  }
}
