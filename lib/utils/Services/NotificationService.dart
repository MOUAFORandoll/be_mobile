import 'dart:async';

import 'package:BabanaExpress/application/model/data/LivraisonMarketModel.dart';
import 'package:BabanaExpress/application/model/data/LivraisonMedicamentModel.dart';
import 'package:BabanaExpress/application/model/data/LivraisonModel.dart';
import 'package:BabanaExpress/application/model/data/MessageModel.dart';
import 'package:BabanaExpress/core.dart';
import 'package:BabanaExpress/main_prod.dart';
import 'package:BabanaExpress/presentation/callcenter/CallCenterPage.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/presentation/compte/WalletView.dart';
import 'package:BabanaExpress/presentation/home/HomePage.dart'; 
import 'package:BabanaExpress/routes/app_router.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';

class Payload {
  late final BuildContext? context;
  late final String? titre;

  Payload({this.context, this.titre});

  Map<String, dynamic> toJson() => {
        'context': context,
        'titre': titre,
      };
  Payload.fromJson(Map<String, dynamic> json) {
    context = json['context'];
    titre = json['titre'];
  }
  @override
  String toString() {
    return toJson().toString();
  }
}

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

class NotificationService {
  NotificationService();

  final _localNotifications = FlutterLocalNotificationsPlugin();
  final BehaviorSubject<String> behaviorSubject = BehaviorSubject();
  Future<void> initializePlatformNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('launcher_icon');
    final StreamController<ReceivedNotification>
        didReceiveLocalNotificationStream =
        StreamController<ReceivedNotification>.broadcast();

    DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
      onDidReceiveLocalNotification:
          (int id, String? title, String? body, String? payload) async {
        didReceiveLocalNotificationStream.add(
          ReceivedNotification(
            id: id,
            title: title,
            body: body,
            payload: payload,
          ),
        );
      },
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _localNotifications.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse response) {
      final String? payload = response.payload;
      if (payload != null) {
        print('--------${payload}----------actionnn');
        if (payload == 'Depot') {
          sl.get<AppRouter>().pushNamed(WalletPage.routeName);
        }
        if (payload == 'Call Center') {
          sl.get<AppRouter>().pushNamed(CallCenterPage.routeName);
        }
        if (payload == 'Livraison') {
          sl.get<AppRouter>().pushNamed(HomePage.routeName);
        }
        // else {
        // final context = Payload.fromJson(payload as Map<String, dynamic>);
        // BlocProvider.of<LivraisonBloc>(context.context!)
        //     .add(LivraisonEvent.getLivraison());
        // }
      }
    });
  }

  Future<void> livraisonNotification(
      {required content, required context}) async {
    var livraison = LivraisonModel.fromJson(content);
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'BabanaExpress_general_1', // Channel ID
      'BabanaExpress livraison', // Channel name
      channelDescription: 'Information de livraison', // Channel description
      importance: Importance.max,
      priority: Priority.high,
      // autoCancel: false,
      setAsGroupSummary: true,
      styleInformation: BigTextStyleInformation(
        '<Notification Content>',
        htmlFormatBigText: true,
        contentTitle: 'Livraison',
        summaryText: 'Livraison',
      ),
      icon: 'launcher_icon',
      largeIcon: DrawableResourceAndroidBitmap(
          'launcher_icon'), // Replace with the name of your custom large icon file
    );
    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
        DarwinNotificationDetails(threadIdentifier: 'thread_id');
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      1,
      'Livraison',
      'Votre livraison est ' +
          (livraison.status == 0
              ? 'En attente'
              : livraison.status == 1
                  ? 'En cours'
                  : 'Effectuee'),
      platformChannelSpecifics,
      payload: 'Livraison',
    );
  }

  Future<void> livraisonMedicamensNotification(
      {required content, required context}) async {
    var livraison = LivraisonMedicamentModel.fromJson(content);
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'BabanaExpress_general_1', // Channel ID
      'BabanaExpress livraison', // Channel name
      channelDescription: 'Information de livraison', // Channel description
      importance: Importance.max,
      priority: Priority.high,
      // autoCancel: false,
      setAsGroupSummary: true,
      styleInformation: BigTextStyleInformation(
        '<Notification Content>',
        htmlFormatBigText: true,
        contentTitle: 'Livraison',
        summaryText: 'Livraison',
      ),
      icon: 'launcher_icon',
      largeIcon: DrawableResourceAndroidBitmap(
          'launcher_icon'), // Replace with the name of your custom large icon file
    );
    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
        DarwinNotificationDetails(threadIdentifier: 'thread_id');
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      1,
      'Livraison de medicaments',
      'Votre livraison de medicaments est ' +
          (livraison.status == 0
              ? 'En attente'
              : livraison.status == 1
                  ? 'En cours'
                  : 'Effectuee'),
      platformChannelSpecifics,
      payload: 'Livraison',
    );
  }

  Future<void> livraisonProduitsNotification(
      {required content, required context}) async {
    var livraison = LivraisonMarketModel.fromJson(content);
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'BabanaExpress_general_1', // Channel ID
      'BabanaExpress livraison', // Channel name
      channelDescription: 'Information de livraison', // Channel description
      importance: Importance.max,
      priority: Priority.high,
      // autoCancel: false,
      setAsGroupSummary: true,
      styleInformation: BigTextStyleInformation(
        '<Notification Content>',
        htmlFormatBigText: true,
        contentTitle: 'Livraison',
        summaryText: 'Livraison',
      ),
      icon: 'launcher_icon',
      largeIcon: DrawableResourceAndroidBitmap(
          'launcher_icon'), // Replace with the name of your custom large icon file
    );
    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
        DarwinNotificationDetails(threadIdentifier: 'thread_id');
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      1,
      'Livraison de produits',
      'Votre livraison de produits est ' +
          (livraison.status == 0
              ? 'En attente'
              : livraison.status == 1
                  ? 'En cours'
                  : 'Effectuee'),
      platformChannelSpecifics,
      payload: 'Livraison',
    );
  }

  Future<void> livraisonValidateNotification(
      {required content, required context}) async {
    // var livraison = LivraisonModel.fromJson(content);

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'BabanaExpress_general_2', // Channel ID
      'BabanaExpress livraison', // Channel name
      channelDescription: 'Information de livraison', // Channel description
      importance: Importance.max,
      priority: Priority.high,
      // autoCancel: false,
      setAsGroupSummary: true,
      styleInformation: BigTextStyleInformation(
        '<Notification Content>',
        htmlFormatBigText: true,
        contentTitle: 'Livraison',
        summaryText: 'Livraison',
      ),
      icon: 'launcher_icon',
      largeIcon: DrawableResourceAndroidBitmap(
          'launcher_icon'), // Replace with the name of your custom large icon file
    );
    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
        DarwinNotificationDetails(threadIdentifier: 'thread_id');
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      2,
      'Livraison Enregistrée',
      'Votre requette de livraison a été enregistrée et est en cours de traitement', // Notification body
      platformChannelSpecifics,
      payload: 'Livraison',
    );
  }

  Future<void> livraisonFinishNotification(
      {required content, required context}) async {
    // var livraison = LivraisonModel.fromJson(content);

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'BabanaExpress_general_2', // Channel ID
      'BabanaExpress livraison', // Channel name
      channelDescription: 'Information de livraison', // Channel description
      importance: Importance.max,
      priority: Priority.high,
      // autoCancel: false,
      // setAsGroupSummary: true,
      styleInformation: BigTextStyleInformation(
        '<Notification Content>',
        htmlFormatBigText: true,
        contentTitle: 'Livraison',
        summaryText: 'Livraison',
      ),
      icon: 'launcher_icon',
      largeIcon: DrawableResourceAndroidBitmap(
          'launcher_icon'), // Replace with the name of your custom large icon file
    );
    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
        DarwinNotificationDetails(threadIdentifier: 'thread_id');
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      2,
      'Livraison Terminée',
      'Votre livraison a été effectuée avec succes✅', // Notification body
      platformChannelSpecifics,
      payload: 'Livraison',
    );
  }

  Future<void> depotFinishNotification(
      {required content, required context}) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'BabanaExpress_credit', // Channel ID
      'BabanaExpress Depot', // Channel name
      channelDescription:
          'Information de Recharge compte', // Channel description
      importance: Importance.max,
      priority: Priority.high,
      // autoCancel: false,
      // setAsGroupSummary: true,
      styleInformation: BigTextStyleInformation(
        '<Notification Content>',
        htmlFormatBigText: true,
        contentTitle: 'Recharge',
        summaryText: 'Recharge',
      ),
      icon: 'launcher_icon',
      largeIcon: DrawableResourceAndroidBitmap(
          'launcher_icon'), // Replace with the name of your custom large icon file
    );
    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
        DarwinNotificationDetails(threadIdentifier: 'thread_id');
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      2,
      'Recharge Babana Express',
      'Votre recharge de ${content} XAF a été effectuée avec succes', // Notification body
      platformChannelSpecifics,
      payload: 'Depot',
    );
  }

  Future<void> callCenterNotification(
      {required MessageModel content, required context}) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'BabanaExpress Call Center', // Channel ID
      'BabanaExpress Call Center', // Channel name
      channelDescription: 'Call Center', // Channel description
      importance: Importance.max,
      priority: Priority.high,
      // autoCancel: false,
      // setAsGroupSummary: true,
      styleInformation: BigTextStyleInformation(
        '<Notification Content>',
        htmlFormatBigText: true,
        contentTitle: 'Call Center',
        summaryText: 'Call Center',
      ),
      icon: 'launcher_icon',
      largeIcon: DrawableResourceAndroidBitmap(
          'launcher_icon'), // Replace with the name of your custom large icon file
    );
    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
        DarwinNotificationDetails(threadIdentifier: 'thread_id');
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      2,
      'Call Center',
      content.message, // Notification body
      platformChannelSpecifics,
      payload: 'Call Center',
    );
  }
}
