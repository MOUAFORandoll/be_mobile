import 'package:BananaExpress/components/Form/search_field.dart';
import 'package:BananaExpress/components/Widget/HomeModuleComponent.dart';
import 'package:BananaExpress/components/Widget/icon_svg.dart';
import 'package:BananaExpress/utils/Services/routing.dart';
import 'package:BananaExpress/utils/constants/assets.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/Button/app_button.dart';
import 'package:BananaExpress/application/export_bloc.dart';

import 'package:easy_localization/easy_localization.dart';
class SimpleUserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
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
                          // Get.toNamed(AppLinks.NOTIFICATION);
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
                                titleBtn: 'Livraisons'.tr(),
                                image: Assets.shop2,
                                onTap: () => openModalLivraison(context),
                              ),
                              HomeModuleComponent(
                                title:
                                    'Medicament Express,assurance, securite et fiabilite',
                                titleBtn: 'Ordonnance'.tr(),
                                image: Assets.medical,
                                onTap: () => openModalLivraison(context),
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
                                          ]),
                                    ),
                                  ],
                                ),
                              )
                            ])))
              ]));
        });
  }

  openModalLivraison(context) => showModalBottomSheet(
        context: context,
        builder: (BuildContext context) => Container(
            height: kHeight * .4,
            padding: EdgeInsets.symmetric(horizontal: kMarginX),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: ColorsApp.white,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(top: kMarginY * 2),
                  // padding: EdgeInsets.symmetric(
                  //     horizontal: kMarginX / 2),
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop,
                    child: Icon(Icons.close),
                  )),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
                  child: Text(
                    'Quel service vous interesse'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )),
              Container(
                  margin: EdgeInsets.only(top: kMarginY * 2),
                  child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: AppButton(
                            text: 'Livrer mon colis'.tr(),
                            // width: kWidth / 2.5,
                            size: MainAxisSize.max,
                            bgColor: ColorsApp.second,
                            onTap: () {
                              Navigator.of(context)
                                  .popAndPushNamed(AppLinks.NEWLIVRAISON);

                              // setService(1);
                            }),
                      ),
                      AppButton(
                          text: 'Me faire livrer'.tr(),
                          // width: kWidth / 2.5,
                          size: MainAxisSize.max,
                          // bgColor: AppColors.secondarytext,
                          onTap: () {
                            // Get.toNamed(AppLinks.NEWLIVRAISON);
                            // setService(2);
                          }),
                    ],
                  ))
            ])),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        backgroundColor: Colors.transparent,
      );
}
