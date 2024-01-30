// import 'package:BananaExpress/presentation/components/exportcomponent.dart';
 

// import 'package:get/get.dart';

// class AppLangButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // width: kSmWidth * .6,
//       // margin: EdgeInsets.only(
//       //     top: Get.height * .005,
//       //     left: Get.width * .008),

//       child: BlocBuilder<AppActionCubit, AppActionState>(builder: (context, state) {
//       return DropdownButton<String>(
//             value: actionControl.lang.value,
//             borderRadius: BorderRadius.circular(10),
//             icon: Container(
//               // padding: EdgeInsets.only(top: 4),
//               child: Icon(
//                 Icons.keyboard_arrow_down_outlined,
//                 color: ColorsApp.primary,
//               ),
//             ),
//             iconSize: 25,
//             underline: SizedBox(),
//             style: TextStyle(color: ColorsApp.primary, fontSize: 20),
//             onChanged: (newValue) {
//               // actionControl.updateLanguage(newValue ?? '');
//             },
//             items:
//                 <String>[...actionControl.locale.map((e) => e['name'])].map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Center(
//                   child: Text(
//                     value,
//                     style: TextStyle(color: ColorsApp.primary, fontSize: 15),
//                   ),
//                 ),
//               );
//             }).toList()),
//       ),
//     );
//   }
// }
