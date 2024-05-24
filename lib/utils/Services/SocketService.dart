import 'dart:convert';
import 'package:BabanaExpress/infrastructure/_commons/network/request_url.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  SocketService();
  // late IO.Socket socket;
  IO.Socket socket = IO.io(RequestUrl().socketUrl, <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': true,
  });

  void HistoriqueUserLivraison(
      {required String recepteur, required Function action}) {
    socket.on('livraison', (data) {
      print(data);

      if (data != null && data != 'null') {
        if (jsonDecode(data)['recepteur'].toString() == recepteur.toString()) {
          action(jsonDecode(data)['data']);
        }
      }
    });
    // });
    // print(socket.connected);
  }

  void livraisonValidate(
      {required String recepteur, required Function action}) {
    socket.on('livraison_validate', (data) {
      print(data);
      if (data != null && data != 'null') {
        var decodedData = jsonDecode(data);
        if (decodedData['recepteur'].toString() == recepteur.toString()) {
          action(jsonDecode(data)['data']);
        }
      }
    });
  }

  void livraisonFinish({required String recepteur, required Function action}) {
    socket.on('livraison_finish', (data) {
      print(data);
      if (data != null && data != 'null') {
        print(jsonDecode(data));
        if (jsonDecode(data)['recepteur'].toString() == recepteur.toString()) {
          print('-----------------');
          print(jsonDecode(data));
          action(jsonDecode(data)['data']);
        }
      }
    });
  }

  void livraisonProduit({required String recepteur, required Function action}) {
    socket.on('livraison_produit', (data) {
      print(data);
      if (data != null && data != 'null') {
        print(jsonDecode(data));
        if (jsonDecode(data)['recepteur'].toString() == recepteur.toString()) {
          print('-----------------');
          print(jsonDecode(data));
          action(jsonDecode(data)['data']);
        }
      }
    });
  }

  void livraisonMedicament(
      {required String recepteur, required Function action}) {
    socket.on('livraison_medicament', (data) {
      print(data);

      if (data != null && data != 'null') {
        print(jsonDecode(data));
        if (jsonDecode(data)['recepteur'].toString() == recepteur.toString()) {
          print('-----------------');
          print(jsonDecode(data));
          action(jsonDecode(data)['data']);
        }
      }
    });
  }

  void transactionCredit(
      {required String recepteur, required Function action}) {
    socket.on('transaction', (data) {
      print(data);
      if (data != null && data != 'null') {
        print(jsonDecode(data));
        if (jsonDecode(data)['recepteur'].toString() == recepteur.toString()) {
          print('------------iciiiiiCest moi-----');
          action(jsonDecode(data)['data']['montant']);
        }
      }
    });
    // });
    // print(socket.connected);
  }
  
  void callCenter({required String recepteur, required Function action}) {
    socket.on('service_client', (data) {
      print(data);
      if (data != null && data != 'null') {
        if (jsonDecode(data)['recepteur'].toString() == recepteur.toString()) {
          action(jsonDecode(data)['data']);
        }
      }
    });
    // });
    // print(socket.connected);
  }

//recepteur ici est l'id du user
  void notifications(recepteur, Function action) {
    // socket.on('notifications', (msg) {
    //   print(recepteur);
    //   print('------notifications----********************************-------');

    //   if (msg != null && msg != 'null') {
    //     if (jsonDecode(msg)['recepteur'].toString() == recepteur.toString()) {
    //       print('-----------------');
    //       print(jsonDecode(msg));
    //       action(NotificationModel.fromJson(jsonDecode(msg)));
    //     }
    //   }
    //   // socket.close();
    //   // setMessage('destination', msg['message']);
    // });
    // // });
    // print(socket.connected);
  }
}
