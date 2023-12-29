// ignore: must_be_immutable
import 'package:BananaExpress/components/Text/smallText.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddColis extends StatelessWidget {
  final title, onTap, color, icon;

  AddColis({this.icon, this.title, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            width: Get.size.width / 2.35,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            margin: EdgeInsets.all(5),
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: ColorsApp.grey)
                // color: (color == null) ? ColorsApp.blue : color,
                ),
            child: Column(
              children: [
                Center(
                  child: Icon(icon, color: color),
                ),
                smallText(text: title, color: color),
              ],
            )));
  }
}
