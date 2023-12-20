// ignore: must_be_immutable import 'package:BananaExpress/model/data/CategoryModel.dart';

import 'package:BananaExpress/styles/textStyle.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppTabComponent extends StatelessWidget {
  var libelle, onTap;
  bool selected;
  AppTabComponent({required this.libelle, this.onTap, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          height: kSmHeight / 1.4,
          width: kWidth / 3.7,
          alignment: Alignment.center,
          padding: EdgeInsets.all(5),
          // margin: EdgeInsets.only(right: kMarginX),
          decoration: BoxDecoration(
              color: selected ? ColorsApp.tird : Colors.transparent,
              border:
                  Border.all(color: selected ? ColorsApp.tird : ColorsApp.grey),
              borderRadius: BorderRadius.circular(8)),
          child: Text(libelle,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontFamily: 'Lato',
                  color: !selected ? ColorsApp.grey : ColorsApp.white,
                  fontSize: kDescription,
                  fontWeight: FontWeight.w700)),
        ));
  }
}
