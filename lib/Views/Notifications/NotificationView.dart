
// import 'package:BananaExpress/components/Widget/NotificationComponent.dart';
// import 'package:BananaExpress/components/Widget/app_loading.dart';
// import 'package:BananaExpress/controller/GeneralController.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class NotificationView extends StatelessWidget {
   
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<GeneralController>(builder: (_general) {
//       return _general.isLoadNotification == 0
//           ? AppLoading()
//           : SingleChildScrollView(
//               child: ListView.builder(
//                   physics: NeverScrollableScrollPhysics(),
//                   controller: _general.controllerScrollNotification,
//                   shrinkWrap: true,
//                   // scrollDirection: Axis.horizontal,
//                   itemCount: _general.notificationList.length,
//                   itemBuilder: (_ctx, x) =>
//                       (x == _general.notificationList.length - 1 &&
//                               _general.loaddata)
//                           ? Container(
//                               alignment: Alignment.center,
//                               margin: EdgeInsets.all(10),
//                               child: CircularProgressIndicator())
//                           : NotificationComponent(
//                               notification: _general.notificationList[x])),
//             );

//       // Builds 1000 ListTiles
//     });
//   }
// }
