import 'package:BananaExpress/components/Widget/EmptyLivraisonsComponent.dart';
import 'package:BananaExpress/components/Widget/LivraisonBabanaComponent.dart';
import 'package:BananaExpress/components/Widget/LivraisonUserComponent.dart';
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
import 'package:BananaExpress/utils/Services/routing.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:BananaExpress/components/Button/app_button.dart';
import 'package:BananaExpress/components/Form/search_field.dart';
import 'package:BananaExpress/components/Widget/ShimmerBox.dart';
import 'package:BananaExpress/components/Widget/ShimmerHome.dart';
import 'package:BananaExpress/components/Widget/ShimmerProduit.dart';
import 'package:BananaExpress/components/Widget/app_title_right.dart';
import 'package:BananaExpress/components/Widget/icon_svg.dart';
import 'package:BananaExpress/controller/GeneralController.dart';
import 'package:BananaExpress/controller/LivraisonController.dart';
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
                    (context, index) =>
                        _livraisonController.babanaLivraisonList.length == 0
                            ? EmptyLivraisonsComponent()
                            : Container(
                                decoration: BoxDecoration(
                                  // color: ColorsApp.white,

                                  color: Colors.white,
                                ),
                                child: SingleChildScrollView(
                                    child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: _livraisonController
                                            .babanaLivraisonList.length,
                                        // controller: _livraisonController,
                                        itemBuilder: (_, index) =>
                                            LivraisonBabanaComponent(
                                              livraison: _livraisonController
                                                  .babanaLivraisonList[index],
                                            ))),
                              ),
                    childCount: 1,
                  ))
                ]))));
  }
}
