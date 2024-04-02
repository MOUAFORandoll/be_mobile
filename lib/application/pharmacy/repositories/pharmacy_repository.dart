import 'package:BabanaExpress/core.dart';
import 'package:BabanaExpress/infrastructure/_commons/network/app_requests.dart';
import 'package:dio/dio.dart';
import 'package:BabanaExpress/utils/constants/apiRoute.dart';

import 'package:BabanaExpress/application/database/database_cubit.dart';

class PharmacyRepo {
  final IAppRequests apiClient;

  PharmacyRepo({required this.apiClient});
  var dababase = sl.get<DatabaseCubit>();

  Future newLivraisonMedicament(data) async {
    Response a =
        await apiClient.postRequest(ApiRoutes.LIVRAISON_MEDICAMENT, body: data);

    return a;
  }

  Future calculFraisLivraison(data) async {
    Response a = await apiClient
        .postRequest(ApiRoutes.LIVRAISON_MEDICAMENT + '/frais', body: data);

    return a;
  }

  Future getHistoryLivraisonsMedicaments(keySecret) async {
    Response a = await apiClient.getRequest(
        ApiRoutes.LIVRAISON_MEDICAMENT + '/user?keySecret=${keySecret}');

    return a;
  }

  Future findMedicament(search) async {
    print('-----search---${search}');

    Response a = await apiClient
        .getRequest(ApiRoutes.MEDICAMENT_SEARCH + '?name=${search}');

    return a;
  }
}
