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

  Future getHistoryLivraisons(id) async {
    Response a =
        await apiClient.getData(ApiRoutes.LIVRAISONS + '/user?id=${id}');

    return a;
  }

  Future getInfoLivraisonsForHistory(id) async {
    Response a = await apiClient.getData(ApiRoutes.LIVRAISONS + '?id=${id}');

    return a;
  }

  Future getHistoryLivraisonsBabana(idBabana) async {
    Response a = await apiClient
        .getData(ApiRoutes.LIVRAISONS + '/babana?idBabana=${idBabana}');

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
