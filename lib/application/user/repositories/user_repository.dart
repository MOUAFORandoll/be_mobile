import 'package:BabanaExpress/core.dart';
import 'package:BabanaExpress/infrastructure/_commons/network/app_requests.dart';
import 'package:dio/dio.dart';
import 'package:BabanaExpress/utils/constants/apiRoute.dart';

import 'package:BabanaExpress/application/database/database_cubit.dart';

class UserRepo {
  final IAppRequests apiClient;

  UserRepo({required this.apiClient});
  var dababase = sl.get<DatabaseCubit>();
  Future getUser() async {
    var getId = await dababase.getId();
    print('-----user---${getId}');
    if (getId != null) {
      Response a = await apiClient.getRequest(ApiRoutes.USER + '?id=${getId}');

      return a;
    } else {
      return null;
    }
  }

  Future getModePaiement() async {
    Response a = await apiClient.getRequest('/modepaiement/read');

    return a;
  }

  Future getVilleQuartier(long, lat) async {
    Response a =
        await apiClient.getRequest('/location/user?long=${long}&lat=${lat}');
    ;

    return a;
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
  Future LoginSocial(data) async {
    Response a = await apiClient.postRequest(ApiRoutes.LOGINSOCIAL, body: data);

    return a;
  }
  Future SendCode(data) async {
    Response a = await apiClient.postRequest(ApiRoutes.SEND_CODE, body: data);

    return a;
  }

  Future VerifyCode(data) async {
    Response a = await apiClient.postRequest(ApiRoutes.VERIFY_CODE, body: data);

    return a;
  }

  Future ResetPassword(data) async {
    Response a =
        await apiClient.postRequest(ApiRoutes.REST_PASSWORD, body: data);

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
