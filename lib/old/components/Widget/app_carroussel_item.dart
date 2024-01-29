// ignore_for_file: must_be_immutable

import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:flutter/material.dart';

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
        color: ColorsApp.tird,
      ),
      padding: EdgeInsets.only(
        top: getHeight(context) * .60,
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
        color: ColorsApp.red,
              
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide.none),
              ),
              margin: EdgeInsets.only(
                top: getHeight(context) * .10,
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
