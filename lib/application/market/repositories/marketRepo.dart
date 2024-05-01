import 'package:BabanaExpress/infrastructure/_commons/exceptions.dart';
import 'package:BabanaExpress/infrastructure/_commons/network/app_requests.dart'; 
import 'package:BabanaExpress/infrastructure/_commons/throw_error.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

import '../../../utils/constants/apiRoute.dart';

class MarketRepo {
  final IAppRequests apiClient;
  MarketRepo({required this.apiClient});
  final key = 'AIzaSyB2lLkho9yRrZ9DgZ4btFOZ6x22-zZTJ38';
  Future newLivraisonMarket(data) async {
    Response a = await apiClient.postRequest(ApiRoutes.LIVRAISONS + '/produit',
        body: data);

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

  Future calculFraisMarket(data) async {
    Response a = await apiClient.postRequest(ApiRoutes.LIVRAISONS + '/frais',
        body: data);

    return a;
  }

  Future getHistoryLivraisons(keySecret) async {
    Response a = await apiClient.getRequest(
        ApiRoutes.LIVRAISONS + '/produit' + '/user?keySecret=${keySecret}');

    return a;
  }

  Future getProduits() async {
    Response a = await apiClient.getRequest(ApiRoutes.PRODUITS);

    return a;
  }

  Future test(indexC) async {
    Response a = await apiClient.getRequest(
      ApiRoutes.TEST + '/' + indexC.toString(),
    );

    return a;
  }
}
