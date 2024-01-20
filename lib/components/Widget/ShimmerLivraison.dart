import 'package:BananaExpress/styles/textStyle.dart';
import 'package:flutter/material.dart'; 
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLivraison extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsApp.grey,
      highlightColor: Colors.blueGrey,
      child: Container(
          height: kHeight * .9,
          // margin: EdgeInsets.symmetric(horizontal: kMarginX),
          child: SizedBox(
              height: kHeight * .9,
              child: Stack(children: [
                GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 0.0,
                        childAspectRatio: 10,
                        mainAxisExtent: 100,
                        mainAxisSpacing: 10.0),
                    itemCount: 6,
                    itemBuilder: (_ctx, index) => Container(
                          height: 4.2,
                          width: kWidth,
                          alignment: Alignment.center,
                          // padding: EdgeInsets.all(kMarginX),
                          margin: EdgeInsets.symmetric(horizontal: kMarginX),
                          decoration: BoxDecoration(
                              color: ColorsApp.grey,
                              borderRadius: BorderRadius.circular(8)),
                        ))
              ]))),
    );
  }
}
