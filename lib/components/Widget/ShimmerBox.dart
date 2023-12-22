import 'package:BananaExpress/styles/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class ShimmerBox extends StatelessWidget {
  ShimmerBox({this.height});
  var height;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: ColorsApp.grey,
        highlightColor: Colors.blueGrey,
        child: Container(
            height: kHeight / 8,
            width: kHeight / 8,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: ColorsApp.grey, borderRadius: BorderRadius.circular(8)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [])));
  }
}
