import 'package:dio/dio.dart';
import 'package:BananaExpress/utils/constants/apiRoute.dart';

import '../../../utils/Services/ApiClientNew.dart';
import 'package:get_it/get_it.dart';
import '../../../utils/datebase.dart';
import '../../databasecubit/cubit/databasecubit_cubit.dart';

final sl = GetIt.instance;

class UserRepo {
  var apiClient = new ApiClient();
  var dababase = sl.get<DatabaseCubit>();
  Future getUser() async {
    var getU = await dababase.getKey();

    if (getU != null) {
      Response a =
          await apiClient.getData(ApiRoutes.USER + '?keySecret=${getU}');
      ;

      return a;
    } else {
      return null;
    }
  }

  Future userRefresh() async {
    var kk = await dababase.getKeyKen();
    if (kk != null) {
      Response a = await apiClient
          .postData(ApiRoutes.Refresh, {'refreshToken': kk['refreshToken']});

      dababase.saveKeyKen(a.data);
    } else {
      return null;
    }
  }

  Future updateUser(data) async {
    Response a = await apiClient.postData(ApiRoutes.UPDATE_USER, data);

    return a;
  }

  Future newConnexion() async {
    var getU = await dababase.getKey();

    if (getU != null) {
      try {
        var loca = await new Dio().get('https://ipapi.co/json/');

        var data = {
          'ip': loca.data['ip'],
          'ville': loca.data['city'],
          'latitude': loca.data['latitude'].toString(),
          'keySecret': getU,
          'longitude': loca.data['longitude'].toString()
        };
        await dababase.saveLonLat(data);

        Response a = await apiClient.postData(ApiRoutes.LOCATION_USER, data);

        // //print('ssnewlocatio-------------------------');
        // //print(a.body);

        return a;
      } catch (e) {
        return null;
      }
      // } else {
      //   return new Response(body: {'data': []}, statusCode: 200);
      // }
    } else {
      return null;
    }
  }

  Future Login(data) async {
    Response a = await apiClient.postData(ApiRoutes.LOGIN, data);

    return a;
  }

  Future SignUp(data) async {
    //print(data);
    Response a0 = await apiClient.postData(ApiRoutes.SIGNUP, data);

    return a0;
  }

  Future getListFieul(keySecret, page) async {
    Response a = await apiClient
        .getData(ApiRoutes.LIST_FIEUL + '?keySecret=${keySecret}&page=${page}');

    return a;
  }

  Future updateImageUser(data) async {
    Response a = await apiClient.postData(ApiRoutes.USER_IMAGE_UPDATE, data);

    return a;
  }
}
