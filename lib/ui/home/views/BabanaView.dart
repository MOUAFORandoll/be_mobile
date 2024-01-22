import 'package:BananaExpress/components/Widget/EmptyLivraisonsComponent.dart';
import 'package:BananaExpress/components/Widget/LivraisonBabanaComponent.dart';
import 'package:BananaExpress/components/Widget/ShimmerLivraison.dart';
import 'package:BananaExpress/components/Widget/icon_svg.dart';
import 'package:BananaExpress/controller/GeneralController.dart';
import 'package:BananaExpress/utils/constants/assets.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:BananaExpress/utils/Services/routing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:BananaExpress/controller/LivraisonController.dart';
import 'package:flutter_svg/flutter_svg.dart';
 
class BabanaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LivraisonController>(
        builder: (_livraisonController) => GetBuilder<GeneralController>(
            builder: (generalController) => Container(
                margin: EdgeInsets.symmetric(horizontal: kMarginX),
                child: CustomScrollView(slivers: [
                  SliverAppBar(
                    backgroundColor: ColorsApp.bg,
                    automaticallyImplyLeading: false,
                    leading: Builder(builder: (context) {
                      return InkWell(
                          child: Container(
                            width: 10,
                            height: 10,
                            child:
                                SvgPicture.asset(Assets.menu, fit: BoxFit.none),
                          ),
                          onTap: () => Scaffold.of(context).openDrawer());
                    }),
                    title: Text(
                      'Babana Express',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Lato', fontWeight: FontWeight.w600),
                    ),
                    centerTitle: true,
                    actions: [
                      InkWell(
                          child: Container(
                              margin: EdgeInsets.only(right: kMarginX),
                              child: SvgIcon(icon: Assets.bell)),
                          onTap: () {
                            Get.toNamed(AppLinks.NOTIFICATION);
                          }),
                    ],
                    pinned: true,
                  ),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                    (context, index) => _livraisonController
                                .isLoadedPLivraison ==
                            0
                        ? ShimmerLivraison()
                        : _livraisonController.isLoadedPLivraison == 2
                            ? Text('Error')
                            : _livraisonController.babanaLivraisonList.length ==
                                    0
                                ? EmptyLivraisonsComponent()
                                : Container(
                                    decoration: BoxDecoration(
                                        // color: ColorsApp.white,

                                        // color: Colors.white,
                                        ),
                                    child: SingleChildScrollView(
                                        child: ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: _livraisonController
                                                .babanaLivraisonList.length,
                                            // controller: _livraisonController,
                                            itemBuilder: (_, index) =>
                                                LivraisonBabanaComponent(
                                                  livraison: _livraisonController
                                                          .babanaLivraisonList[
                                                      index],
                                                ))),
                                  ),
                    childCount: 1,
                  ))
                ]))));
  }
}
