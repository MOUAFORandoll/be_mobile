import 'package:BananaExpress/model/data/ProduitModel.dart';
import 'package:BananaExpress/utils/Services/ApiClient.dart';
import 'package:BananaExpress/utils/Services/storageService2.dart';
import 'package:BananaExpress/utils/constants/apiRoute.dart';
import 'package:BananaExpress/controller/DataBaseController.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class LivreurRepo extends GetxService {
  final ApiClient apiClient;
  LivreurRepo({required this.apiClient});
  final dababase = Get.find<DataBaseController>();

  Future getLivreur() async {
    //print('--long---------------');
    //print(await s.getLonLat());

    var longlat = await dababase.getLonLat();
    Response a = await apiClient.postData(ApiRoutes.LIVREUR,
        {'longitude': longlat!['long'], 'latitude': longlat['lat']});
    ;
    //print(a.body);
    return a;
  }
}
