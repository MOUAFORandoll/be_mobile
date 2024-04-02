// ignore: must_be_immutable

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

// ignore: must_be_immutable
class BtnManageView extends StatelessWidget {
  var title, onTap;
  bool selected;
  BtnManageView(
      {required this.title, required this.onTap, required this.selected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          // height: getHeight(context) * 1.2,
          width: getWith(context) * 0.5,
          padding: EdgeInsets.all(kMarginX / 1.1),
          margin:
              EdgeInsets.symmetric(vertical: kMarginY, horizontal: kMarginX),
          decoration: BoxDecoration(
              color: selected ? null : ColorsApp.grey,
              borderRadius: BorderRadius.circular(8)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Container(
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.only(
                //         topRight: Radius.circular(10),
                //         topLeft: Radius.circular(10)),
                //     child: Image.asset('assets/om.png',
                //         height: getHeight(context) ,
                //         width: getWith(context) * .5,
                //         fit: BoxFit.cover),
                //   ),
                // ),

                // Container(
                //     decoration: BoxDecoration(
                //         color: ColorsApp.grey,
                //         borderRadius: BorderRadius.circular(20)),
                //     //  alignment: Alignment.center,
                //     padding: EdgeInsets.all(10),
                //     child: Icon(
                //       IconData(category.icon, fontFamily: 'MaterialIcons'),
                //       color: Colors.white,
                //     )),
                Container(
                  width: getWith(context),
                  alignment: Alignment.center,
                  // margin: EdgeInsets.only(
                  //     top: getHeight(context) * .005, left: getWith(context) * .008),
                  child: Text(title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                ),
              ])),
    );
  }
}
