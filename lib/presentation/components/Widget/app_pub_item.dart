// ignore_for_file: must_be_immutable

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:flutter_svg/svg.dart';

class AppPubItem extends StatelessWidget {
  AppPubItem(
      {required this.title,
      required this.description,
      required this.image,
      this.index = 0});
  var title, description, image, index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(context) / 3,
      child: Stack(
        children: [
          // 1. Image as the background
          Positioned.fill(
            child: SvgPicture.asset(
              Assets.box,
              height: getHeight(context) * .50,
              width: getHeight(context) * .50,
              fit: BoxFit.contain, // Ensures the image covers the whole area
            ),
          ),

          // 2. Your content on top of the image
          Positioned(
            top: 20,
            left: 10,
            child: Container(
              margin: EdgeInsets.symmetric(
                  vertical: kMarginY * 2, horizontal: kMarginX * 3),
              // padding: EdgeInsets.all(kMarginX),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        width: getWidth(context) * .8,
                        child: Text(
                          title,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: ColorsApp.white,
                            fontSize: kTitle,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
                        width: getWidth(context) * .5,
                        child: Text(
                          description,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: ColorsApp.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
