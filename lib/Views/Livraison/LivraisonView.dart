import 'package:BananaExpress/components/Widget/app_empty.dart';
import 'package:BananaExpress/components/Widget/app_loading.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:BananaExpress/utils/functions/viewFunctions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../components/Text/TextBackSpace.dart';
import '../../components/Widget/EmptyLivraisonsComponent.dart';

class LivraisonView extends StatelessWidget {
  LivraisonView({Key? key}) : super(key: key);
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(controller: _scrollController, slivers: [
      SliverAppBar(
        automaticallyImplyLeading: false,
        backgroundColor:  ColorsApp.bg,

       
        elevation: 0,
        // Provide a standard title.
        // title: Text('title'),
        // Allows the user to reveal the app bar if they begin scrolling
        // back up the list of items.
        floating: true,
        // Display a placeholder widget to visualize the shrinking size.
        flexibleSpace: InkWell(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                  margin: EdgeInsets.only(top: Get.height * .010),
                  padding: EdgeInsets.only(
                      left: Get.width * .030, right: Get.width * .030),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [])),
            ]),
          ),
          /*   onTap: () => filterDest() */
        ),
        // Make the initial height of the SliverAppBar larger than normal.
        expandedHeight: 60,

        // expandedHeight: 300,
        // pinned: true,
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate(
        (context,
                index) => /* _controller.getItems.length == 0
                  ?  */
            EmptyLivraisonsComponent()
        /* : Container(
                      decoration: BoxDecoration(
                        // color: ColorsApp.white,

                        color: Colors.white,
                      ),
                      child: SingleChildScrollView(
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: _controller.getItems.length,
                              // controller: _controller,
                              itemBuilder: (_, index) =>
                                  ShoppingproduitComponent(
                                    cartM: _controller.getItems[index],
                                  ))),
                    ) */
        ,
        childCount: 1,
      ))
    ]));
  }
}
