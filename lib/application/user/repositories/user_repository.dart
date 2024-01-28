import 'package:BananaExpress/core.dart';
import 'package:BananaExpress/infrastructure/_commons/network/app_requests.dart';
import 'package:dio/dio.dart';
import 'package:BananaExpress/utils/constants/apiRoute.dart';

import '../../../utils/Services/ApiClientNew.dart';

import 'package:BananaExpress/application/export_bloc.dart';
import 'package:BananaExpress/application/database/database_cubit.dart';

class UserRepo {
  final IAppRequests apiClient;

  UserRepo({required this.apiClient});
  var dababase = sl.get<DatabaseCubit>();
  Future getUser() async {
    var getId = await dababase.getId();
    print('-----user---${getId}');
    if (getId != null) {
      Response a =
          await apiClient.getRequest(ApiRoutes.USER + '?id=${getId}');
      ;

      return a;
    } else {
      return null;
    }
  }

  Future userRefresh() async {
    var kk = await dababase.getKeyKen();
    if (kk != null) {
      Response a = await apiClient.postRequest(ApiRoutes.Refresh,
          body: {'refreshToken': kk['refreshToken']});

      dababase.saveKeyKen(a.data);
    } else {
      return null;
    }
  }

  Future updateUser(data) async {
    Response a = await apiClient.postRequest(ApiRoutes.UPDATE_USER, body: data);

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

        Response a =
            await apiClient.postRequest(ApiRoutes.LOCATION_USER, body: data);

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
    Response a = await apiClient.postRequest(ApiRoutes.LOGIN, body: data);

    return a;
  }

  Future SignUp(data) async {
    //print(data);
    Response a0 = await apiClient.postRequest(ApiRoutes.SIGNUP, body: data);

    return a0;
  }

  Future getListFieul(keySecret, page) async {
    Response a = await apiClient.getRequest(
        ApiRoutes.LIST_FIEUL + '?keySecret=${keySecret}&page=${page}');

    return a;
  }

  Future updateImageUser(data) async {
    Response a =
        await apiClient.postRequest(ApiRoutes.USER_IMAGE_UPDATE, body: data);

    return a;
  }
}
