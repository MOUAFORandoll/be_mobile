import 'package:BananaExpress/styles/colorApp.dart';
import 'package:flutter/material.dart';
import 'package:BananaExpress/styles/textStyle.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  String text;
  // String content;
  bool bolder;
  BigText({this.text = '', this.bolder = false});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: kSmWidth,
        alignment: Alignment.center,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 20,
              color: ColorsApp.primary,
              fontWeight: bolder ? FontWeight.w600 : FontWeight.normal),
        ));
  }
}
