import 'dart:convert';
import 'package:BananaExpress/model/data/LivraisonModel.dart';
import 'package:BananaExpress/model/socket/NotificationModel.dart';
import 'package:BananaExpress/utils/Services/apiUrl.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  SocketService();
  // late IO.Socket socket;
  IO.Socket socket = IO.io(ApiUrl.socketUrl, <String, dynamic>{
    "transports": ["websocket"],
    "autoConnect": true,
  });

  void listLivraison(canal, Function action) {
    socket.on('livraison', (data) {
      print(data);
      print(
          '-----00-livraison----**********${canal}**********************-------');
      if (data != null && data != 'null') {
        print(jsonDecode(data));
        if (jsonDecode(data)['recepteur'].toString() == canal.toString()) {
          print('-----------------');
          print(jsonDecode(data));
          action(LivraisonModel.fromJson(jsonDecode(data)['data']));
        }
      }
    });
    // });
    // print(socket.connected);
  }

  void livraisonFinish(canal, Function action) {
    socket.on('livraison_finish', (data) {
      print(data);
      if (data != null && data != 'null') {
        print(jsonDecode(data));
        if (jsonDecode(data)['recepteur'].toString() == canal.toString()) {
          print('-----------------');
          print(jsonDecode(data));
          action(jsonDecode(data)['data']);
        }
      }
    });
    // });
    // print(socket.connected);
  }

//recepteur ici est l'id du user
  void notifications(recepteur, Function action) {
    socket.on('notifications', (msg) {
      print(recepteur);
      print('------notifications----********************************-------');

      if (msg != null && msg != 'null') {
        if (jsonDecode(msg)['recepteur'].toString() == recepteur.toString()) {
          print('-----------------');
          print(jsonDecode(msg));
          action(NotificationModel.fromJson(jsonDecode(msg)));
        }
      }
      // socket.close();
      // setMessage("destination", msg["message"]);
    });
    // });
    print(socket.connected);
  }
}
