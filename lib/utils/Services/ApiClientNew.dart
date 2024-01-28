import 'package:BananaExpress/utils/Services/apiUrl.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;

  ApiClient()
      : _dio = Dio(BaseOptions(
          baseUrl: ApiUrl.baseUrl,
          connectTimeout: Duration(
              seconds: 60), // Temps d'attente de connexion en millisecondes
          receiveTimeout: Duration(
              seconds:
                  60), // Temps d'attente pour recevoir des données en millisecondes
        ));

  Future<Response> getData(String url) async {
    try {
      return await _dio.get(url);
    } catch (e) {
      // Gestion des erreurs
      print('Erreur lors de la requête GET : $e');
      rethrow; // Renvoie l'erreur pour qu'elle puisse être gérée ailleurs si nécessaire
    }
  }

  Future<Response> postData(String url, dynamic data) async {
    try {
      return await _dio.post(url, data: data);
    } catch (e) {
      // Gestion des erreurs
      print('Erreur lors de la requête POST : $e');
      rethrow; // Renvoie l'erreur pour qu'elle puisse être gérée ailleurs si nécessaire
    }
  }

  Future<Response> patchData(String url, dynamic data) async {
    try {
      return await _dio.patch(url, data: data);
    } catch (e) {
      // Gestion des erreurs
      print('Erreur lors de la requête PATCH : $e');
      rethrow; // Renvoie l'erreur pour qu'elle puisse être gérée ailleurs si nécessaire
    }
  }
}
