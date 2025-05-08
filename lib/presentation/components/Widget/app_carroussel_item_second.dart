// ignore_for_file: must_be_immutable

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

class AppCarrousselItemSecond extends StatelessWidget {
  AppCarrousselItemSecond(
      {required this.title,
      required this.description,
      required this.image,
      this.index = 0});
  var title, description, image, index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeApp.second,
      ),
      height: getHeight(context) * .67,
      padding:
          EdgeInsets.symmetric(vertical: kMarginY * 2, horizontal: kMarginX)
              .add(EdgeInsets.only(top: kMarginY * 2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide.none),
              ),
              padding: EdgeInsets.all(kMarginX),
              // margin: EdgeInsets.symmetric(
              //     vertical: kMarginY, horizontal: kMarginX * 3),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              )),
          Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide.none),
              ),
              margin: EdgeInsets.only(
                bottom: kMarginY * 2,
              ),
              padding: EdgeInsets.all(kMarginX * 2),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ColorsApp.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              )),
          // Container(
          //   margin: EdgeInsets.only(
          //     bottom: kMarginY * 5,
          //   ).add(EdgeInsets.symmetric(horizontal: kMarginX * 2)),
          //   height: getHeight(context) * .50,
          //   width: getHeight(context) * .50,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(350),
          //     image: DecorationImage(
          //       image: AssetImage(image),
          //       fit: index == 2 ? BoxFit.cover : BoxFit.contain,
          //     ),
          //   ),
          // ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 150,
            child: Container(
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
              padding: EdgeInsets.all(30),
              height: getHeight(context) * .80,
              width: getHeight(context) * .40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(200),
                // image: DecorationImage(
                //   image: AssetImage(image),
                //   fit: BoxFit.contain,
                // ),
              ),
            ),

            // backgroundImage: AssetImage(image), radius: 200
            // fit: index == 2 ? BoxFit.cover : BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
