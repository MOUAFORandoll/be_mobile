import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SeacrhIngCompo extends StatelessWidget {
  final String? title;
  final onTap;
  final bool actif;

  SeacrhIngCompo({
    Key? key,
    this.onTap,
    required this.title,
    required this.actif,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: actif ? ColorsApp.second : Colors.white,
            ),
            padding: EdgeInsets.symmetric(vertical: 10),
            margin: EdgeInsets.only(top: kMarginX),
            child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.settings,
                        color: Colors.blue,
                      )),
                  //
                  Text(title!),
                  // Container(
                  //     margin: EdgeInsets.only(right: 10),
                  //     child: Icon(
                  //       Icons.search,
                  //       color: Colors.blue,
                  //     ))
                ])),
        onTap: onTap);
  }
}
