import 'package:BananaExpress/components/Button/app_button.dart';
import 'package:BananaExpress/components/Form/search_field.dart';
import 'package:BananaExpress/components/Widget/ShimmerHome.dart';
import 'package:BananaExpress/components/Widget/ShimmerProduit.dart';
import 'package:BananaExpress/components/Widget/app_title_right.dart';
import 'package:BananaExpress/components/Widget/icon_svg.dart';
import 'package:BananaExpress/controller/GeneralController.dart';
import 'package:BananaExpress/controller/managerController.dart';
import 'package:BananaExpress/utils/constants/assets.dart';
import 'package:BananaExpress/components/Widget/categoryComponent.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/Services/routing.dart';

class SimpleUserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(
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
                        child: SvgPicture.asset(Assets.menu, fit: BoxFit.none),
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
                            Container(
                              margin:
                                  EdgeInsets.symmetric(vertical: kMarginY * 2),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 231, 229, 229),
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.symmetric(
                                horizontal: kMarginX,
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: kWidth * .4,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: kWidth * .4,
                                            child: Text(
                                              'Babana Express, securite et fiabilite',
                                              maxLines: 3,
                                              style: TextStyle(
                                                  fontFamily: 'Lato',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: kMarginY),
                                            width: kWidth * .3,
                                            child: AppButton(
                                              size: MainAxisSize.max,
                                              bgColor: ColorsApp.primary,
                                              text: 'Livraisons'.tr,
                                              onTap: () => Get.bottomSheet(
                                                Container(
                                                    height: kHeight * .4,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                kMarginX),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(10),
                                                      ),
                                                      color: ColorsApp.white,
                                                    ),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                              alignment:
                                                                  Alignment
                                                                      .topRight,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: kMarginY *
                                                                          2),
                                                              // padding: EdgeInsets.symmetric(
                                                              //     horizontal: kMarginX / 2),
                                                              child: InkWell(
                                                                onTap: () =>
                                                                    Get.back(),
                                                                child: Icon(
                                                                    Icons
                                                                        .close),
                                                              )),
                                                          Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          kMarginY *
                                                                              2),
                                                              child: Text(
                                                                'Quel service vous interesse'
                                                                    .tr,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              )),
                                                          Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: kMarginY *
                                                                          2),
                                                              child: Column(
                                                                // mainAxisSize: MainAxisSize.max,
                                                                children: [
                                                                  Container(
                                                                    margin: EdgeInsets.only(
                                                                        bottom:
                                                                            8),
                                                                    child:
                                                                        AppButton(
                                                                      text: 'Livrer mon colis'
                                                                          .tr,
                                                                      // width: kWidth / 2.5,
                                                                      size: MainAxisSize
                                                                          .max,
                                                                      bgColor:
                                                                          ColorsApp
                                                                              .second,
                                                                      onTap: () =>
                                                                          Get.toNamed(
                                                                              AppLinks.NEWLIVRAISON),
                                                                    ),
                                                                  ),
                                                                  AppButton(
                                                                    text:
                                                                        'Me faire livrer'
                                                                            .tr,
                                                                    // width: kWidth / 2.5,
                                                                    size:
                                                                        MainAxisSize
                                                                            .max,
                                                                    // bgColor: AppColors.secondarytext,
                                                                    onTap: () =>
                                                                        Get.toNamed(
                                                                            AppLinks.NEWLIVRAISON),
                                                                  ),
                                                                ],
                                                              ))
                                                        ])),
                                                isScrollControlled: true,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          top: Radius.circular(
                                                              16)),
                                                ),
                                                backgroundColor:
                                                    Colors.transparent,
                                              ),
                                            ),
                                          ),
                                          /*  Get.dialog(ModalDialogImage()), */
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: kWidth * .3,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(Assets.shop2),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: kMarginY * 2),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Text(
                                              'Top Produits Livre',
                                              maxLines: 3,
                                              style: TextStyle(
                                                  fontFamily: 'Lato',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              'See All',
                                              style: TextStyle(
                                                  fontFamily: 'Lato',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ]),
                                  ),
                                  Container(
                                      child: SingleChildScrollView(
                                          child: Wrap(
                                              spacing: 8,
                                              runSpacing: 2,
                                              children:
                                                  List.generate(10, (index) {
                                                return Container(
                                                    constraints: BoxConstraints(
                                                      maxWidth: kWidth * .20,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Column(children: [
                                                      Container(
                                                        width: 50,
                                                        height: 50,
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              ColorsApp.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                                Assets.shop2),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                          child: Text(
                                                        "Vetements",
                                                        maxLines: 2,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Montserrat',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ))
                                                    ]));
                                              })))),
                                ],
                              ),
                            )
                          ])))
            ])));
  }
}
