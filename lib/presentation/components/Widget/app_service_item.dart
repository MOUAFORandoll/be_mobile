// ignore_for_file: must_be_immutable

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:flutter_svg/svg.dart';

class AppServiceItem extends StatelessWidget {
  final String title;
  final String image;
  final int index;
  final onTap;

  AppServiceItem(
      {Key? key,
      required this.title,
      required this.image,
      this.index = 0,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            color: ColorsApp.grey,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 236, 232, 232),
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(-5, 5),
            )
          ],
        ),
        width: getWidth(context) * 0.9, // Adjusted width to take more space
        margin: EdgeInsets.symmetric(vertical: kMarginY / 4),
        padding: EdgeInsets.symmetric(
            vertical: kMarginY * 2,
            horizontal: kMarginX / 4), // Added padding for inner spacing
        alignment: Alignment.center,
        child: /*  Row(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Align items to the center

          mainAxisAlignment:
              MainAxisAlignment.center, // Align items to the center
          children: [ */
            // Container(
            //   // decoration: BoxDecoration(
            //   //   color: ColorsApp.primary,
            //   //   borderRadius: BorderRadius.circular(10),
            //   // ),
            //   height: getHeight(context) * 0.05,
            //   width: getWidth(context) * 0.10,
            //   child: SvgPicture.asset(
            //     image, // Use the passed image parameter

            //     fit: BoxFit.contain,
            //   ),
            // ),
            // SizedBox(
            //     width: 8.0),    //   Expanded(
            // child:
            Text(
          title,
          textAlign: TextAlign.start,
          style: TextStyle(
            // color: ColorsApp.white,
            fontSize: kDescription * 1.2,
            fontWeight: FontWeight.w600,
          ),
        ),
        //   ),
        // ],
      ),
      // ),
    );
  }
}
