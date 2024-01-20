import 'package:BananaExpress/styles/textStyle.dart';
import 'package:flutter/material.dart'; 
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:shimmer/shimmer.dart';

import 'ShimmerProduit.dart';

class ShimmerHome extends StatelessWidget {
  const ShimmerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: ColorsApp.grey,
        highlightColor: Colors.blueGrey,
        child: Container(
          /*  margin: EdgeInsets.symmetric(
                                                horizontal: kMarginX), */
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ColorsApp.grey,
                      ),
                      height: kToolbarHeight / 1.7,
                      // width: kWidth * .75,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              child: Text(
                            "Rechercher",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: kBasics,
                            ),
                          )),
                          InkWell(
                              child: Icon(
                                Icons.search,
                                color: Colors.blue,
                              ),
                              onTap: () {}),
                        ],
                      )),
                  onTap: () {}),
              Container(
                margin: EdgeInsets.symmetric(vertical: kMarginY * .4),
                child: Text("Categories",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: kBasics,
                        color: ColorsApp.tird,
                        fontWeight: FontWeight.w600)),
              ),
              Container(
                height: kHeight * 1.3,
                margin: EdgeInsets.symmetric(vertical: kMarginY),
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_ctx, index) => Container(
                    // height: kHeight,
                    // width: kWidth,
                    alignment: Alignment.center,

                    margin: EdgeInsets.only(right: kMarginX),
                    decoration: BoxDecoration(
                        color: ColorsApp.grey,
                        border: Border.all(color: ColorsApp.grey),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(kMarginX),
                          child: Text(
                            '',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                            width: 100,
                            height: kHeight * 1.2,

                            // margin: EdgeInsets.only(bottom: 10),
                            // padding: EdgeInsets.symmetric(vertical: 4, horizontal: 1),
                            decoration: BoxDecoration(
                                color: ColorsApp.grey,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    bottomRight: Radius.circular(8)),
                                image: DecorationImage(
                                  image: AssetImage('assets/logo/logo.png'),
                                )))
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: kMarginY * .4),
                child: Text("Boutiques",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: kBasics,
                        color: ColorsApp.tird,
                        fontWeight: FontWeight.w600)),
              ),
              Container(
                height: kHeight / 7,
                // margin: EdgeInsets.symmetric(
                //     vertical: kMarginY),
                child: ListView.builder(
                  itemCount: 8,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_ctx, index) => Container(
                    width: kWidth / 4,
                    // height: kWidth / 3,
                    margin: EdgeInsets.only(right: kMarginX / 2),
                    child: Container(
                      // height: kHeight / 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: kHeight * .1,
                            width: kHeight * .1,
                            decoration: BoxDecoration(
                              color: ColorsApp.grey,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          Container(
                              // width: kWidth / 1.5,
                              child: Text(
                            '',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ShimmerProduit()
            ],
          )),
        ));
  }
}
