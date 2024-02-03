import 'package:BananaExpress/core.dart';
import 'package:BananaExpress/infrastructure/_commons/network/app_requests.dart';
import 'package:dio/dio.dart';
import 'package:BananaExpress/utils/constants/apiRoute.dart';

import 'package:BananaExpress/application/database/database_cubit.dart';

class PharmacyRepo {
  final IAppRequests apiClient;

  PharmacyRepo({required this.apiClient});
  var dababase = sl.get<DatabaseCubit>();
  Future getUser() async {
    var getId = await dababase.getId();
    print('-----user---${getId}');
    if (getId != null) {
      Response a = await apiClient.getRequest(ApiRoutes.USER + '?id=${getId}');
      ;

      return a;
    } else {
      return null;
    }
  }

  Future findMedicament(search) async {
    print('-----search---${search}');

    Response a = await apiClient
        .getRequest(ApiRoutes.MEDICAMENT_SEARCH + '?name=${search}');

    return a;
  }
}
