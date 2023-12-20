// ignore: must_be_immutable
import 'package:BananaExpress/model/data/CategoryModel.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:BananaExpress/utils/Services/routing.dart';
import 'package:get/get.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardBoutiqueComponent extends StatelessWidget {
  String title, link;

  CardBoutiqueComponent({required this.title, required this.link});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(link);
      },
      child: Container(
          height: kSmHeight * 3,
          width: kSmWidth * .9,
          alignment: Alignment.center,
          padding: EdgeInsets.all(kMarginX),
          margin: EdgeInsets.all(Get.size.width * .02),
          decoration: BoxDecoration(
             
              borderRadius: BorderRadius.circular(8)),
          child: Text(
            title,
            textAlign: TextAlign.center,
          )),
    );
  }
}
