import 'package:BananaExpress/styles/textStyle.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class PolitiqueView extends StatefulWidget {
  PolitiqueView({Key? key}) : super(key: key);

  @override
  _PolitiqueViewState createState() => _PolitiqueViewState();
}

class _PolitiqueViewState extends State<PolitiqueView> {
  TextEditingController titre = TextEditingController();

  TextEditingController description = TextEditingController();

  TextEditingController email = TextEditingController();

  bool validator = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
            // controller: _scrollController,
            slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Container(
                    margin: EdgeInsets.zero,
                    // padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(

                        // borderRadius: BorderRadius.circular(20),
                        ),
                    child: Icon(Icons.arrow_back_ios_new,
                        color: Colors.white, size: 25.0),
                  ),
                  onTap: () {
                    // Get.back();
                  },
                ),
              ],
            )),
            flexibleSpace: FlexibleSpaceBar(
                background: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                  Container(
                      height: getHeight(context) * .08,
                      width: getWith(context) * 1.2,
                      // margin: EdgeInsets.symmetric(
                      //     horizontal: kMarginX * 10),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8),
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        //  Border.all(color: borderColor),
                        color: Colors.white,

                        // ,
                      ),
                      child: Text(
                        'Politique'.tr(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                ]))),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(5),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 2, bottom: 3),
                                height: 3,
                                width: getWith(context) * .5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30)),
                                child: Container())
                          ])
                    ])),
                padding: EdgeInsets.only(top: 5, bottom: 10),
                width: double.maxFinite,
              ),
            ),
            expandedHeight: 120,
            pinned: true,
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) => Container(
                margin: EdgeInsets.symmetric(vertical: kMarginY * .2),
                padding: EdgeInsets.only(
                  top: 20,
                ),
                child: Column(children: [
                  SingleChildScrollView(
                      child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lire notre politique !",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        // Center(
                        //   child: TextButton(
                        //     style: ButtonStyle(alignment: Alignment.center),
                        //     child: Text('recuperer boutique ?'),
                        //     onPressed: () {
                        //       Get.toNamed(AppLinks.FORGOT);
                        //     },
                        //   ),
                        // )
                      ],
                    ),
                  ))
                ])),
            childCount: 1,
          ))
        ]));
  }
}
