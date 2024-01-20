import 'package:dio/dio.dart' hide Response;
import 'package:BananaExpress/utils/Services/ApiClient.dart';
import 'package:BananaExpress/utils/constants/apiRoute.dart';
import 'package:get/get.dart';

import '../../../utils/datebase.dart';

class ManageRepo extends GetxService {
  var apiClient = new ApiClient();
  final dababase = new DataBaseController();

  Future getUser() async {
    var getU = await dababase.getKey();

    if (getU != null) {
      Response a =
          await apiClient.getData(ApiRoutes.USER + '?keySecret=${getU}');
      ;

      return a;
    } else {
      return new Response(body: {
        'data': [],
      }, statusCode: 200);
    }
  }

  Future userRefresh() async {
    var kk = await dababase.getKeyKen();
    if (kk != null) {
      Response a = await apiClient
          .postData(ApiRoutes.Refresh, {'refreshToken': kk['refreshToken']});

      dababase.saveKeyKen(a.body);
    } else {
      return new Response(body: {'data': []}, statusCode: 200);
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
        return new Response(body: {'data': []}, statusCode: 203);
      }
      // } else {
      //   return new Response(body: {'data': []}, statusCode: 200);
      // }
    } else {
      return new Response(body: {'data': []}, statusCode: 200);
    }
  }

  Future Login(data) async {
    Response a = await apiClient.postData(ApiRoutes.LOGIN, data);

    return a;
  }

  Future SignUp(data) async {
    //print(data);
    Response a0 = await apiClient.postData(ApiRoutes.SIGNUP, data);
    if (a0.statusCode == 201) {
      var logdata = {
        'phone': data['phone'].toString(),
        'password': data['password']
      };

      Response a = await this.Login(logdata);
      return a;
    } else {
      return a0;
    }
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
