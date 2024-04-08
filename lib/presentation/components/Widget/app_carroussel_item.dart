// ignore_for_file: must_be_immutable

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

class AppCarrousselItem extends StatelessWidget {
  AppCarrousselItem(
      {required this.title,
      required this.description,
      required this.image,
      this.index = 0});
  var title, description, image, index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsApp.primary,
      ),
      padding: EdgeInsets.only(
          // top: getHeight(context) * .20,
          ),
      child: Column(
        children: [
          Container(
            height: getHeight(context) * .75,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: index == 2 ? BoxFit.cover : BoxFit.contain,
              ),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide.none),
              ),
              margin: EdgeInsets.only(
                bottom: kMarginY,
              ),
              padding: EdgeInsets.all(kMarginX),
              // margin: EdgeInsets.symmetric(
              //     vertical: kMarginY, horizontal: kMarginX * 3),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ColorsApp.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              )),
        ],
      ),
    );
  }
}
