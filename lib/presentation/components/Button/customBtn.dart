// ignore: must_be_immutable
import 'package:BananaExpress/old/components/Text/smallText.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final title, onTap, color, validator;

  CustomBtn({this.validator, this.title, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            width: getWith(context) * .95,
            padding: EdgeInsets.all(13),
            // margin: EdgeInsets.all(10),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: (color == null) ? ColorsApp.tird : color,
            ),
            child: ((validator == null) ? false : validator)
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : smallText(text: title)));
  }
}
