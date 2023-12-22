import 'package:BananaExpress/model/data/ProduitModel.dart';
import 'package:BananaExpress/utils/Services/ApiClient.dart';
import 'package:BananaExpress/utils/constants/apiRoute.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class LivraisonRepo extends GetxService {
  final ApiClient apiClient;
  LivraisonRepo({required this.apiClient});

  Future newLivraison(data) async {
    Response a = await apiClient.postData(ApiRoutes.LIVRAISONS, data);

    return a;
  }

  Future recuperationColis(data) async {
    Response a =
        await apiClient.patchData(ApiRoutes.LIVRAISONS + "/recuperation", data);

    return a;
  }

  Future receptionColis(data) async {
    Response a =
        await apiClient.patchData(ApiRoutes.LIVRAISONS + "/reception", data);

    return a;
  }

  Future getHistoryLivraisons(keySecret) async {
    Response a = await apiClient
        .getData(ApiRoutes.LIVRAISONS + '/user?keySecret=${keySecret}');

    return a;
  }

  Future getInfoLivraisonsForHistory(keySecret) async {
    Response a = await apiClient
        .getData(ApiRoutes.LIVRAISONS + '?keySecret=${keySecret}');

    return a;
  }

  Future getHistoryLivraisonsBabana(keySecret) async {
    Response a = await apiClient
        .getData(ApiRoutes.LIVRAISONS + '/babana?keySecret=${keySecret}');

    return a;
  }

  Future getInfoLivraisonsForBabana(id) async {
    Response a =
        await apiClient.getData(ApiRoutes.LIVRAISONS + 'babana/info?id=${id}');

    return a;
  }

  Future getLivraison_point() async {
    Response a = await apiClient.getData(ApiRoutes.LIVRAISON_POINT);

    return a;
  }

  Future verifyCom(data) async {
    Response a = await apiClient.postData(ApiRoutes.VERIFY, data);

    return a;
  }
}
