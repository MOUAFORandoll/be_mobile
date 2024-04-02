// ignore: must_be_immutable import 'package:BabanaExpress/presentation/model/data/CategoryModel.dart';

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'package:BabanaExpress/utils/constants/assets.dart';
import 'icon_svg.dart';

// ignore: must_be_immutable
class AppBoutiqueOption extends StatelessWidget {
  String title;
  var onTap;
  int index;
  AppBoutiqueOption(
      {required this.title, required this.onTap, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          // decoration: BoxDecoration(
          //   color: ColorsApp.tird,
          // ),
          margin: EdgeInsets.symmetric(
            horizontal: kMarginX,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: getHeight(context) / 7.5,
                  width: getHeight(context) / 7.5,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: ColorsApp.grey,
                      // border: Border.all(
                      //   color: ColorsApp.white,
                      // ),
                      boxShadow: [
                        BoxShadow(
                          color: ColorsApp.white,
                          blurRadius: 1, // Soften the shaodw
                          spreadRadius: 8,
                          offset: Offset(-1.0, 1.8),
                        )
                      ],
                      borderRadius: BorderRadius.circular(300)),
                  child: SvgIcon(
                      icon: index == 0
                          ? Assets.produits
                          : index == 1
                              ? Assets.commandes
                              : index == 2
                                  ? Assets.ventes
                                  : index == 3
                                      ? Assets.short
                                      : index == 4
                                          ? Assets.setting
                                          : Assets.setting)),
              Container(
                // height: getHeight(context),
                // width: getWith(context),
                // decoration: BoxDecoration(
                //   color: ColorsApp.tird,
                // ),
                margin: EdgeInsets.symmetric(
                  vertical: kMarginY,
                ),
                child: Text(title,
                    style: TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w600,
                        fontSize: 12)),
              ),
            ],
          ),
        ));
  }
}
