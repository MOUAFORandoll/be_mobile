// import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

// class RecuperationDeliveryZoneWidget extends StatelessWidget {
//   RecuperationDeliveryZoneWidget({
//     required this.title,
//     this.subTitle,
//     this.subInfo,
//     required this.onTap,
//   });
//   final String title;
//   final String? subTitle;
//   final String? subInfo;
//   final onTap;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: kMarginX, vertical: kMarginY),
//         padding: EdgeInsets.all(10).add(EdgeInsets.only(bottom: kMarginY)),
//         decoration: BoxDecoration(
//           color: ColorsApp.white,
//           borderRadius: BorderRadius.circular(5),
//           boxShadow: [
//             BoxShadow(
//               color: ColorsApp.primary.withOpacity(0.2),
//               spreadRadius: 2,
//               blurRadius: 5,
//               offset: Offset(0, 2),
//             ),
//             BoxShadow(
//               color: ColorsApp.black.withOpacity(0.2),
//               spreadRadius: 2,
//               blurRadius: 5,
//               offset: Offset(0, 2),
//             ),
//           ],
//         ),
//         child:
//             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//           Container(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                     child: Text(
//                   title,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: kTitle * 1.2,
//                        
//                     fontWeight: FontWeight.w700,
//                   ),
//                 )),
//                 if (subInfo!.length == 0)
//                   Container(
//                       child: Text(
//                     subTitle!,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: ColorsApp.grey.withOpacity(.5),
//                       fontSize: kBasics,
//                          
//                     ),
//                   )),
//                 if (subInfo!.length != 0)
//                   Container(
//                       child: Text(
//                     subInfo!,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: kBasics,
//                          
//                       color: ColorsApp.second,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   )),
//               ],
//             ),
//           ),
//           Container(
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: ColorsApp.green.withOpacity(.2),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Icon(FontAwesomeIcons.searchengin,
//                   size: 20, color: ColorsApp.primary)),
//         ]),
//       ),
//       onTap: onTap,
//     );
//   }
// }
