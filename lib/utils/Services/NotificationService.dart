import 'dart:async';

import 'package:BabanaExpress/application/database/database_cubit.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/application/livraison/livraison_bloc.dart';
import 'package:BabanaExpress/application/model/data/LivraisonModel.dart';
import 'package:BabanaExpress/core.dart';
import 'package:BabanaExpress/main.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';

import '../../application/model/socket/NotificationModel.dart';

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
            });

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _localNotifications.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {
      final String? payload = notificationResponse.payload;

      print('p----------------------ayload');
      if (payload != null) {
        var context = Payload.fromJson(payload as Map<String, dynamic>);
        BlocProvider.of<LivraisonBloc>(context.context!)
            .add(LivraisonEvent.getLivraison());
      }
    });
  }

  Future<void> livraisonNotification(
      {required content, required context}) async {
    var livraison = LivraisonModel.fromJson(content);
    DatabaseCubit database = sl.get<DatabaseCubit>();
    var user = await database.getUser();
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
      livraison.livreur!.id == user!.id
          ? 'Vous avez une livraison a effectuer'
          : 'Votre livraison est ' +
              (livraison.status == 0
                  ? 'En attente'
                  : livraison.status == 1
                      ? 'En cours'
                      : 'Effectuee'),
      platformChannelSpecifics,
      payload: Payload(
        context: context,
        titre: 'Livraison',
      ).toString(),
    );
  }

  Future<void> livraisonValidateNotification(
      {required content, required context}) async {
    var livraison = LivraisonModel.fromJson(content);

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
      'Votre requette de livraison du ' +
          livraison.date +
          ' a été enregistrée et est en cours de traitement', // Notification body
      platformChannelSpecifics,
      payload: 'Livraison',
    );
  }

  Future<void> livraisonFinishNotification(
      {required content, required context}) async {
    var livraison = LivraisonModel.fromJson(content);

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
      'Votre de livraison du ' +
          livraison.date +
          ' a été effectuée avec succes', // Notification body
      platformChannelSpecifics,
      payload: 'Livraison',
    );
  }
}
