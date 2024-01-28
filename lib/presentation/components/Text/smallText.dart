import 'package:BananaExpress/styles/colorApp.dart';
import 'package:flutter/material.dart';
import 'package:BananaExpress/styles/textStyle.dart';

// ignore: must_be_immutable
class smallText extends StatelessWidget {
  String text;
  Color color;
  bool bolder;
  double size;
  bool al;
  double width;
  // String content;
  // bool marginBool;
  smallText(
      {this.text = '',
      this.color = ColorsApp.white,
      this.bolder = false,
      this.al = false,
      this.size = 12,
      this.width = 0.0});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width == 0 ? getWith(context) : width,
        alignment: al ? null : Alignment.center,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: size,
              color: color,
              fontWeight: bolder ? FontWeight.w700 : FontWeight.normal),
        ));
  }
}
