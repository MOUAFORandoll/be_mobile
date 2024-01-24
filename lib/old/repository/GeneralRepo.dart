
import 'package:BananaExpress/utils/Services/ApiClient.dart'; 
import 'package:BananaExpress/utils/constants/apiRoute.dart'; 
import 'package:get/get.dart'; 
class GeneralRepo extends GetxService {
  final ApiClient apiClient;
  GeneralRepo({required this.apiClient});

  Future test(indexC) async {
    Response a = await apiClient.getData(
      ApiRoutes.TEST + '/' + indexC.toString(),
    );

    return a;
  }

  Future getCategory() async {
    Response a = await apiClient.getData(
      ApiRoutes.CATEGORY,
    );

    return a;
  }

  Future getVille() async {
    Response a = await apiClient.getData(
      ApiRoutes.VILLE,
    );

    return a;
  }

  Future getModePaiement() async {
    Response a = await apiClient.getData(
      ApiRoutes.MODEPAIEMENT,
    );

    return a;
  }

  Future getListNotifications(index, keySecret) async {
    Response a = await apiClient.getData(
      ApiRoutes.LIST_NOTIFICATIONS +
          '?page=${index.toString()}&keySecret=${keySecret.toString()}',
    );

    return a;
  }

  Future getHome(keySecret) async {
    Response a = await apiClient.getData(
      ApiRoutes.HOME + '?keySecret=${keySecret.toString()}',
    );

    return a;
  }

  Future readNotifications(idNotification) async {
    Response a = await apiClient.getData(
      ApiRoutes.READ_NOTIFICATIONS + '?id=${idNotification.toString()}',
    );

    return a;
  }
}
