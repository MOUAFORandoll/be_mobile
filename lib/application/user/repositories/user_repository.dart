import 'package:BabanaExpress/core.dart';
import 'package:BabanaExpress/infrastructure/_commons/network/app_requests.dart';
import 'package:dio/dio.dart';
import 'package:BabanaExpress/utils/constants/apiRoutes.dart';

import 'package:BabanaExpress/application/database/database_cubit.dart';

class UserRepo {
  final IAppRequests apiClient;

  UserRepo({required this.apiClient});
  var dababase = sl.get<DatabaseCubit>();
  Future getUser() async {
    var getId = await dababase.getId();
    print('-----user---${getId}');
    if (getId != null) {
      Response _reponse =
          await apiClient.getRequest(ApiRoutes.USER + '?id=${getId}');

      return _reponse;
    } else {
      return null;
    }
  }

  Future getModePaiement() async {
    Response _reponse = await apiClient.getRequest('/modepaiement/read');

    return _reponse;
  }

  Future getVilleQuartier(long, lat) async {
    Response _reponse =
        await apiClient.getRequest('/location/user?long=${long}&lat=${lat}');
    ;

    return _reponse;
  }

  Future userRefresh() async {
    var kk = await dababase.getKeyKen();
    if (kk != null) {
      Response _reponse = await apiClient.postRequest(ApiRoutes.Refresh,
          body: {'refreshToken': kk['refreshToken']});

      dababase.saveKeyKen(_reponse.data);
    } else {
      return null;
    }
  }

  Future updateUser(data) async {
    Response _reponse =
        await apiClient.postRequest(ApiRoutes.UPDATE_USER, body: data);

    return _reponse;
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

        Response _reponse =
            await apiClient.postRequest(ApiRoutes.LOCATION_USER, body: data);

        // //print('ssnewlocatio-------------------------');
        // //print(a.body);

        return _reponse;
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

  Future verifUserExist(data) async {
    Response _reponse =
        await apiClient.postRequest(ApiRoutes.VERIFY_EXIST, body: data);

    return _reponse;
  }

  Future login(data) async {
    Response _reponse =
        await apiClient.postRequest(ApiRoutes.LOGIN, body: data);

    return _reponse;
  }

  Future loginSocial(data) async {
    Response _reponse =
        await apiClient.postRequest(ApiRoutes.LOGINSOCIAL, body: data);

    return _reponse;
  }

  Future sendCode(data) async {
    Response _reponse =
        await apiClient.postRequest(ApiRoutes.SEND_CODE, body: data);

    return _reponse;
  }

  Future verifyCode(data) async {
    Response _reponse =
        await apiClient.postRequest(ApiRoutes.VERIFY_CODE, body: data);

    return _reponse;
  }

  Future resetPassword(data) async {
    Response _reponse =
        await apiClient.postRequest(ApiRoutes.REST_PASSWORD, body: data);

    return _reponse;
  }

  Future signUp(data) async {
    //print(data);
    Response _reponse =
        await apiClient.postRequest(ApiRoutes.SIGNUP, body: data);

    return _reponse;
  }

  Future getListFieul(keySecret, page) async {
    Response _reponse = await apiClient.getRequest(
        ApiRoutes.LIST_FIEUL + '?keySecret=${keySecret}&page=${page}');

    return _reponse;
  }

  Future updateImageUser(data) async {
    Response _reponse =
        await apiClient.postRequest(ApiRoutes.USER_IMAGE_UPDATE, body: data);

    return _reponse;
  }
}
