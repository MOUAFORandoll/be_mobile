import 'package:BananaExpress/styles/theme.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:flutter/material.dart';
import 'package:BananaExpress/styles/textStyle.dart';

// ignore: must_be_immutable
class BigtitleText extends StatelessWidget {
  String text;
  var color;
  double size;
  // String content;
  bool bolder;
  BigtitleText(
      {this.text = '',
      this.size = 14,
      this.bolder = false,
      this.color = ColorsApp.primary});
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxWidth: getWith(context)),
        child: Text(text,
            overflow: TextOverflow.ellipsis,
            // textAlign: TextAlign.left,
            style: bolder
                ? TexteStyle()
                    .blargeTextStyle
                    .copyWith(color: color, fontSize: size)
                : TexteStyle()
                    .largeTextStyle
                    .copyWith(color: color, fontSize: size)));
  }
}
/*
  
                */
