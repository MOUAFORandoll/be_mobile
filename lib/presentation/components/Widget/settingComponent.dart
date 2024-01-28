// ignore: must_be_immutable
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:get/get.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SettingComponent extends StatelessWidget {
  Widget action;
  String title = '';
  var onTap;
  SettingComponent(
      {required this.title, required this.action, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            height: getHeight(context),
            // width: getWith(context),
            padding: EdgeInsets.all(kMarginX),
            margin: EdgeInsets.symmetric(horizontal: kMarginX, vertical: 5),
            decoration: BoxDecoration(
                // ,
                color: ColorsApp.grey,
                borderRadius: BorderRadius.circular(8)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    // width: getWith(context) * .6,
                    margin: EdgeInsets.only(
                        top: Get.height * .005, left: Get.width * .008),
                    child: Text(title,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(color: ColorsApp.primary, fontSize: 15)),
                  ),
                  action
                ])),
        onTap: onTap);
  }
}
