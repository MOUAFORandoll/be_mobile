import 'package:BabanaExpress/infrastructure/_commons/exceptions.dart';
import 'package:BabanaExpress/infrastructure/_commons/network/app_requests.dart'; 
import 'package:BabanaExpress/infrastructure/_commons/throw_error.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

import '../../../utils/constants/apiRoute.dart';

class LivraisonRepo {
  final IAppRequests apiClient;
  LivraisonRepo({required this.apiClient});
  final key = 'AIzaSyB2lLkho9yRrZ9DgZ4btFOZ6x22-zZTJ38';
  Future newLivraison(data) async {
    Response a = await apiClient.postRequest(ApiRoutes.LIVRAISONS, body: data);
    
    return a;
  }
  
  Future getMapPlaceInfo(long, lat) async {
    Response a =
        await apiClient.getRequest('/location/user?long=${long}&lat=${lat}');

    return a;
  }

  Future downloadRapportLivraison(id) async {
    Response response =
        await apiClient.getRequest('/imprimer/facture-livraison/${id}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      String ret = response.data['url'];
      String path = (await getTemporaryDirectory()).path;
      print(
        ret.split('/')[ret.split('/').length - 1],
      );
      var name = ret.split('/')[ret.split('/').length - 1];
      print('$path/$name');
      await apiClient.download(ret, path: '$path/$name');
      print('$path/$name');
      return '$path/$name';
    } else {
      throw ServerException(errorThrow(response));
    }
  }

  Future autoCompleteMapPlace(search) async {
    Response a = await apiClient
        .getRequest('/point_localisations/autocomplete?search=${search}');

    return a;
  }

  Future searchMapPlaceInfo(name, type) async {
    Response a = await apiClient.getRequest(
        '/point_localisations/findposition?name=${name}&type=${type}');

    return a;
  }

  Future calculFraisLivraison(data) async {
    Response a = await apiClient.postRequest(ApiRoutes.LIVRAISONS + '/frais',
        body: data);

    return a;
  }

  Future recuperationColis(data) async {
    Response a = await apiClient
        .patchRequest(ApiRoutes.LIVRAISONS + '/recuperation', body: data);

    return a;
  }

  Future receptionColis(data) async {
    Response a = await apiClient
        .patchRequest(ApiRoutes.LIVRAISONS + '/reception', body: data);

    return a;
  }

  Future getHistoryLivraisons(keySecret) async {
    Response a = await apiClient
        .getRequest(ApiRoutes.LIVRAISONS + '/user?keySecret=${keySecret}');

    return a;
  }

  Future getInfoLivraisonsForHistory(keySecret) async {
    Response a = await apiClient
        .getRequest(ApiRoutes.LIVRAISONS + '?keySecret=${keySecret}');

    return a;
  }

  Future getInfoLivraisonsForBabana(id) async {
    Response a = await apiClient
        .getRequest(ApiRoutes.LIVRAISONS + 'babana/info?id=${id}');

    return a;
  }

  Future getLivraisonPointByVille(id) async {
    Response a =
        await apiClient.getRequest(ApiRoutes.LIVRAISON_POINT + '?ville=${id}');

    return a;
  }

  Future getPointRecuperationUser(keySecret) async {
    Response a = await apiClient
        .getRequest(ApiRoutes.LIVRAISON_POINT + '/user?keySecret=${keySecret}');

    return a;
  }

  Future test(indexC) async {
    Response a = await apiClient.getRequest(
      ApiRoutes.TEST + '/' + indexC.toString(),
    );

    return a;
  }

  Future getCategory() async {
    Response a = await apiClient.getRequest(
      ApiRoutes.CATEGORY,
    );

    return a;
  }

  Future getVille() async {
    Response a = await apiClient.getRequest(
      ApiRoutes.VILLE,
    );

    return a;
  }

  Future getModePaiement() async {
    Response a = await apiClient.getRequest(
      ApiRoutes.MODEPAIEMENT,
    );

    return a;
  }

  Future getListNotifications(index, keySecret) async {
    Response a = await apiClient.getRequest(
      ApiRoutes.LIST_NOTIFICATIONS +
          '?page=${index.toString()}&keySecret=${keySecret.toString()}',
    );

    return a;
  }

  Future readNotifications(idNotification) async {
    Response a = await apiClient.getRequest(
      ApiRoutes.READ_NOTIFICATIONS + '?id=${idNotification.toString()}',
    );

    return a;
  }

  /**
   * 
  findPlaceAutoComplete() async {
    try {
     var connect = Dio.Dio();
      final response = await connect.get(
          'https://maps.googleapis.com/maps/api/place/autocomplete/json?key=${key}&input=${placeTexteController.text}');

      if (response.body != null) {
        print(response.body);
        
        final jsonResponse = response.body;

        if (jsonResponse.containsKey('predictions')) {
          _listTextPLace = [];
          final predictions = jsonResponse['predictions'];

          for (var prediction in predictions) {
            if (prediction.containsKey('description')) {
              _listTextPLace.add(prediction['description']);
            }
          }
        } else {
          _listTextPLace = [];
        }

        update();
      } else {
        _listTextPLace = [];
        update();
      }
    } catch (e) {}
  }

  getPlace(text) async {
    loader.open();
    var longitude;
    var latitude;
    var connect = Dio.Dio();
    String url = 'https://places.googleapis.com/v1/places:searchText';
    
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'X-Goog-Api-Key': key,
      'X-Goog-FieldMask':
          'places.displayName,places.formattedAddress,places.location'
    };
    Map<String, dynamic> requestBody = {'textQuery': text};

    final response = await connect.post(url,
        options: Dio.Options(headers: headers), data: requestBody);

    if (response.data != null) {
      print(response.data);
      var _loca = Location.fromJson(response.data['places'][0]['location']);

      print(_loca);
      longitude = _loca.longitude;
      latitude = _loca.latitude;
      _placeTexteController.text = text;

      update();
       EasyLoading.dismiss();
    }

    return {'longitude': longitude, 'latitude': latitude};
  }
  
   */
}
