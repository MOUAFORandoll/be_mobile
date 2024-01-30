import 'dart:io';

import 'package:BananaExpress/presentation/components/exportcomponent.dart';

// ignore: must_be_immutable
class ImageComp extends StatelessWidget {
  File file;
  int index;
  ImageComp({
    required this.file,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return /* Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: */ /*  Stack(children: [ */
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.white),
            margin: EdgeInsets.only(right: 5),
            height: getHeight(context) / 2,
            width: getWith(context) / 2.4,
            child: Image.file(
              file,
              fit: BoxFit.cover,
            ))
        // Positioned(
        //     right: 0,
        //     top: 0,
        //     child: Container(
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.only(
        //                 topLeft: Radius.circular(10),
        //                 bottomLeft: Radius.circular(10)),
        //             color: Colors.white),
        //         padding: EdgeInsets.all(5),
        //         child: InkWell(
        //             child: Icon(Icons.close, color: Colors.red, size: 15),
        //             onTap: () async {
        //               // await Get.find<BoutiqueController>().deleteImage(index);
        //             })))
        // ]),
        /*  ) */;
  }
}
