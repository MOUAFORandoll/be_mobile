import 'package:BananaExpress/utils/Services/apiUrl.dart';
import 'package:dio/dio.dart';

class ApiClient {
  Dio dio = Dio(BaseOptions(
    baseUrl: ApiUrl.baseUrl,
    connectTimeout:
        Duration(seconds: 600), // Temps d'attente de connexion en millisecondes
    receiveTimeout: Duration(
        seconds:
            600), // Temps d'attente pour recevoir des données en millisecondes
  ));

  Future<Response> getData(url) async {
    Response rep = await dio.get(url);
    return rep;
  }

  Future<Response> postData(url, data) async {
    Response rep = await dio.post(url.toString(), data: data);
    return rep;
  }

  Future<Response> patchData(url, data) async {
    // //print(this.httpClient.defaultContentType);
    //print(data);
    Response rep = await dio.patch(url.toString(), data: data);
    return rep;
  }
}
