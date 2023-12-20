import 'dart:convert';
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
  void commande(canal, Function action) {
    // MessageModel messageModel = MessageModel(sourceId: widget.sourceChat.id.toString(),targetId: );

    // socket.connect();
    // socket.emit("signin", 350);

    // socket.onConnect((data) {
    //   print("Connected");
    //   print(socket.connected);
    socket.on('commande', (msg) {
      print(canal);

      if (jsonDecode(msg)['canal'].toString() == canal.toString()) {
        print('-----------------');
        print(jsonDecode(msg)['data']);
        action(jsonDecode(msg)['data']);
      }
      // socket.close();
      // setMessage("destination", msg["message"]);
    });
    // });
    print(socket.connected);
  }

  void transaction(canal, Function action) {
    // MessageModel messageModel = MessageModel(sourceId: widget.sourceChat.id.toString(),targetId: );
    // socket = IO.io(ApiUrl.socketUrl, <String, dynamic>{
    //   "transports": ["websocket"],
    //   "autoConnect": true,
    // });
    // socket.connect();
    // socket.emit("signin", 350);

    // socket.onConnect((data) {
    // print("Connected");
    // print(socket.connected);
    socket.on('transaction', (msg) {
      print(canal);

      if (jsonDecode(msg)['canal'].toString() == canal.toString()) {
        print('-----------------');
        print(jsonDecode(msg)['data']);
        action(jsonDecode(msg)['data']);
      }
      // socket.close();
      // setMessage("destination", msg["message"]);
    });
    // });
    print(socket.connected);
  }

  void boutique(canal, Function action) {
    // MessageModel messageModel = MessageModel(sourceId: widget.sourceChat.id.toString(),targetId: );
    // socket = IO.io(ApiUrl.socketUrl, <String, dynamic>{
    //   "transports": ["websocket"],
    //   "autoConnect": true,
    // });
    // // socket.connect();
    // // socket.emit("signin", 350);

    // socket.onConnect((data) {
    //   print("Connected");
    //   print(socket.connected);
    socket.on('boutique', (msg) {
      print(canal);

      if (jsonDecode(msg)['canal'].toString() == canal.toString()) {
        print('-----------boutique------');
        print(jsonDecode(msg)['data']);
        action(jsonDecode(msg)['data']);
      }
      // socket.close();
      // setMessage("destination", msg["message"]);
    });
    // });
    print(socket.connected);
  }

  void negociation(canal, Function action) {
    // MessageModel messageModel = MessageModel(sourceId: widget.sourceChat.id.toString(),targetId: );
    // socket = IO.io(ApiUrl.socketUrl, <String, dynamic>{
    //   "transports": ["websocket"],
    //   "autoConnect": true,
    // });
    // // socket.connect();
    // // socket.emit("signin", 350);

    // socket.onConnect((data) {
    // print("Connected au canal negociation $canal ");
    //   print(socket.connected);
    socket.on('negociation', (msg) {
      print(canal);
      print('-...............');
      print(jsonDecode(msg)['canal'].toString());

      if (jsonDecode(msg)['canal'].toString() == canal.toString()) {
        print('-----------------');
        print(jsonDecode(msg)['data']);
        action(jsonDecode(msg)['data']);
      }
      // socket.close();
      // setMessage("destination", msg["message"]);
    });
    // });
    print(socket.connected);
  }

  void service_client(canal, Function action) {
    // MessageModel messageModel = MessageModel(sourceId: widget.sourceChat.id.toString(),targetId: );
    // socket = IO.io(ApiUrl.socketUrl, <String, dynamic>{
    //   "transports": ["websocket"],
    //   "autoConnect": true,
    // });
    // // socket.connect();
    // // socket.emit("signin", 350);

    // socket.onConnect((data) {
    // print("Connected au canal negociation $canal ");
    //   print(socket.connected);
    socket.on('service_client', (msg) {
      print(canal);
      print('-...............');
      print(jsonDecode(msg)['canal'].toString());

      if (jsonDecode(msg)['canal'].toString() == canal.toString()) {
        print('-----------------');
        print(jsonDecode(msg)['data']);
        action(jsonDecode(msg)['data']);
      }
      // socket.close();
      // setMessage("destination", msg["message"]);
    });
    // });
    print(socket.connected);
  }

  void general(Function action) {
    socket.on('general', (msg) {
      // print('00-----------------');
      // print(jsonDecode(msg));
      action(jsonDecode(msg));
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
