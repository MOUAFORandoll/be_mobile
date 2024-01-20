import 'package:BananaExpress/components/Button/app_button.dart';
import 'package:BananaExpress/controller/GeneralController.dart'; 
import 'package:BananaExpress/styles/textStyle.dart'; 
import 'package:flutter/material.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:get/get.dart';

import '../../utils/constants/assets.dart';

// ignore: must_be_immutable
class EmptyLivraisonsComponent extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: kHeight / 6),
        padding: EdgeInsets.symmetric(vertical: kMarginY),
        decoration: BoxDecoration(
         color: ColorsApp.bg,

       
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: kHeight / 3.5,
                margin: EdgeInsets.only(left: kMarginX),
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage(Assets.empty_shop)))),
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: kMarginX, vertical: kMarginY),
                child: Text(
                  "Hey, Your History Is Empty !",
                  style:
                      TextStyle(fontSize: kBasics, fontWeight: FontWeight.w700),
                )),
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: kMarginX, vertical: kMarginY),
                child: Text(
                  "Retourner en arriere et debuter avec les livraisons.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: kDescription,
                  ),
                )),
            Container(
                margin: EdgeInsets.only(bottom: kMarginY),
                padding: EdgeInsets.symmetric(
                    horizontal: kMarginX, vertical: kMarginY),
                child: AppButton(
                  size: MainAxisSize.max,
                  bgColor: ColorsApp.tird,
                  text: 'Go Back',
                  onTap: () {
                    Get.find<GeneralController>().setGoHome();
                  },
                ))
          ],
        ));
  }
}
