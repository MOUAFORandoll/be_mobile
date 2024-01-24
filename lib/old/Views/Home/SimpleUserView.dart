import 'package:BananaExpress/components/Form/search_field.dart';
import 'package:BananaExpress/components/Widget/HomeModuleComponent.dart';
import 'package:BananaExpress/components/Widget/ShimmerBox.dart';
import 'package:BananaExpress/components/Widget/ShimmerProduit.dart';
import 'package:BananaExpress/components/Widget/icon_svg.dart';
import 'package:BananaExpress/old/controller/GeneralController.dart';
import 'package:BananaExpress/old/controller/LivraisonController.dart';
import 'package:BananaExpress/utils/constants/assets.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:BananaExpress/utils/functions/viewFunctions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/Services/routing.dart';

class SimpleUserView extends StatelessWidget {
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
                  SliverToBoxAdapter(
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: kMarginX),
                          padding: EdgeInsets.symmetric(vertical: kMarginY * 2),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                KSearchField(),
                                HomeModuleComponent(
                                  title:
                                      'Livraison Express, securite et fiabilite',
                                  titleBtn: 'Livraisons'.tr,
                                  image: Assets.shop2,
                                  onTap: () async {
                                    _livraisonController.selectCategory(null);
                                    var isConnected =
                                        await ViewFunctions().isConnected();
                                    if (isConnected) {
                                      _livraisonController.openModalLivraison();
                                    }
                                  },
                                ),
                                HomeModuleComponent(
                                  title:
                                      'Medicament Express,assurance, securite et fiabilite',
                                  titleBtn: 'Ordonnance'.tr,
                                  image: Assets.medical,
                                  onTap: () async {
                                    _livraisonController.selectCategory(null);
                                    var isConnected =
                                        await ViewFunctions().isConnected();
                                    if (isConnected) {
                                      _livraisonController.openModalLivraison();
                                    }
                                  },
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: kMarginY * 2),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  'Top Produits Livre',
                                                  maxLines: 3,
                                                  style: TextStyle(
                                                      fontFamily: 'Lato',
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              // Container(
                                              //   child: Text(
                                              //     'See All',
                                              //     style: TextStyle(
                                              //         fontFamily: 'Lato',
                                              //         fontSize: 12,
                                              //         fontWeight: FontWeight.w500),
                                              //   ),
                                              // ),
                                            ]),
                                      ),
                                      generalController.isLoadedCat == 0
                                          ? ShimmerProduit()
                                          : generalController.isLoadedCat == 2
                                              ? Text('Error')
                                              : Container(
                                                  child: SingleChildScrollView(
                                                      child: Wrap(
                                                          spacing: 8,
                                                          runSpacing: 2,
                                                          children: List.generate(
                                                              generalController
                                                                  .categoryList
                                                                  .length,
                                                              (index) {
                                                            return InkWell(
                                                                child:
                                                                    Container(
                                                                        constraints:
                                                                            BoxConstraints(
                                                                          maxWidth:
                                                                              kHeight / 8,
                                                                        ),
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        child: Column(
                                                                            children: [
                                                                              Container(
                                                                                height: kHeight / 8,
                                                                                padding: EdgeInsets.all(2),
                                                                                decoration: BoxDecoration(
                                                                                  color: ColorsApp.white,
                                                                                  borderRadius: BorderRadius.circular(5),
                                                                                ),
                                                                                child: CachedNetworkImage(
                                                                                  fit: BoxFit.cover,
                                                                                  imageUrl: generalController.categoryList[index].logo! /* 'https://placehold.co/600x400@2x.png' */,
                                                                                  imageBuilder: (context, imageProvider) {
                                                                                    return Container(
                                                                                        height: kHeight / 8,
                                                                                        width: kHeight / 8,
                                                                                        // margin: EdgeInsets.only(bottom: 10),
                                                                                        // padding: EdgeInsets.symmetric(vertical: 4, horizontal: 1),
                                                                                        decoration: BoxDecoration(
                                                                                          color: ColorsApp.grey,
                                                                                          borderRadius: BorderRadius.circular(8),
                                                                                          image: DecorationImage(image: imageProvider, fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.transparent, BlendMode.colorBurn)),
                                                                                        ));
                                                                                  },
                                                                                  placeholder: (context, url) {
                                                                                    return ShimmerBox();
                                                                                  },
                                                                                  errorWidget: (context, url, error) {
                                                                                    return Container(
                                                                                        height: kHeight / 8,
                                                                                        width: kHeight / 8,
                                                                                        decoration: BoxDecoration(
                                                                                            image: DecorationImage(
                                                                                          image: AssetImage('assets/logo/logo.png'),
                                                                                        )));
                                                                                  },
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                  child: Text(
                                                                                generalController.categoryList[index].libelle!,
                                                                                maxLines: 2,
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(fontFamily: 'Montserrat', overflow: TextOverflow.ellipsis, fontWeight: FontWeight.w500),
                                                                              ))
                                                                            ])),
                                                                onTap:
                                                                    () async {
                                                                  var isConnected =
                                                                      await ViewFunctions()
                                                                          .isConnected();
                                                                  if (isConnected) {
                                                                    _livraisonController
                                                                        .selectCategory(
                                                                            generalController.categoryList[index]);
                                                                    _livraisonController
                                                                        .openModalLivraison();
                                                                  }
                                                                });
                                                          })))),
                                    ],
                                  ),
                                )
                              ])))
                ]))));
  }
}
