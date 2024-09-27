import 'package:BabanaExpress/presentation/components/Widget/global_bottom_sheet.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import '../../presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import 'dart:async';

import 'package:BabanaExpress/entity.dart';
import 'package:BabanaExpress/presentation/components/Button/themeButton.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_current_livraison_item.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_pub_item.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_service_item.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_text_title.dart';
import 'package:BabanaExpress/presentation/home/FirstView.dart';
import 'package:BabanaExpress/presentation/livraison/LivraisonView.dart';
import 'package:BabanaExpress/presentation/user/politique_page.dart';
import 'package:BabanaExpress/utils/Services/GeolocatorService.dart';
import 'package:BabanaExpress/utils/Services/validators.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';
import '../../presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

class FirstView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => SingleChildScrollView(
              child: Column(
                children: [
                  _buildBodyView(context),
                  _buildServiceView(context),
                  _buildCurrent()
                ],
              ),
            ));
  }

  Widget _buildBodyView(context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: kMarginY * .8),
            child: AppTextTitle(
              text: 'News',
              bolder: true,
              big: true,
              percent: 0.8,
            ),
          ),
          Container(
            height: getHeight(context) / 4,
            child: CarouselSlider(
              // carouselController: controller,
              items: [
                AppPubItem(
                  title: 'Livraison de vos colis'.tr(),
                  description: 'cdescription1'.tr(),
                  image: Assets.onb2,
                ),
                AppPubItem(
                    title: 'Livraison de vos medicaments'.tr(),
                    description: 'cdescription2'.tr(),
                    image: Assets.onb2,
                    index: 0),
                AppPubItem(
                    title: 'Market Place'.tr(),
                    description:
                        'Commandez vos produits sur notre market place et faites vous livrer rapidement peux importe ou vous vous trouvez dans le cameroun'
                            .tr(),
                    image: Assets.onb3,
                    index: 0)
              ],
              options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  reverse: false,
                  onPageChanged: (index, reason) {
                    print(0);
                    print(0);
                  },
                  disableCenter: true,
                  height: getHeight(context) / 2,
                  enlargeCenterPage: true,
                  autoPlay: true,

                  // autoPlayCurve: Curves.fastOutSlowIn,
                  // enableInfiniteScroll: true,
                  viewportFraction: 1,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildServiceView(context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: kMarginY * .8),
            child: AppTextTitle(
              text: 'Services',
              bolder: true,
              big: true,
              percent: 0.8,
            ),
          ),
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: AppServiceItem(
                            title: 'Livraison de colis'.tr(),
                            image: Assets.activity,
                            onTap: () => GlobalBottomSheet.show(
                                maxHeight: getHeight(context) * .5,
                                context: context,
                                title: 'Livraison de colis'.tr(),
                                subtitle:
                                    'Veuillez choisir votre service de livraison'
                                        .tr(),
                                widget: BlocBuilder<LivraisonBloc,
                                        LivraisonState>(
                                    builder: (context, state) => Container(
                                            child: SingleChildScrollView(
                                                child: Container(
                                          padding: EdgeInsets.only(
                                              top: kMarginY * 5),
                                          child: Column(children: [
                                            AppServiceItem(
                                              title: 'Me faire livrer mon colis'
                                                  .tr(),
                                              image: Assets.activity,
                                              onTap: () =>
                                                  AutoRouter.of(context).push(
                                                      NewLivraisonType1Route()),
                                            ),
                                            SizedBox(
                                                height:
                                                    30), // Add some spacing between items
                                            AppServiceItem(
                                              title:
                                                  'Je veux qu\'on recuperer mon colis'
                                                      .tr(),
                                              image: Assets.activity,
                                              index: 0,
                                              onTap: () {
                                                AutoRouter.of(context).push(
                                                    NewLivraisonType2Route());
                                              },
                                            ),
                                          ]),
                                        ))))))),

                    SizedBox(width: 16), // Add some spacing between items
                    Expanded(
                      child: AppServiceItem(
                        title: 'Livraison de medicament'.tr(),
                        image: Assets.activity,
                        index: 0,
                        onTap: () {
                          AutoRouter.of(context).push(NewLivraisonType2Route());
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16), // Add some vertical spacing between rows
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AppServiceItem(
                        title: 'Blanchisserie'.tr(),
                        image: Assets.activity,
                        index: 0,
                        onTap: () {
                          AutoRouter.of(context).push(NewLivraisonType2Route());
                        },
                      ),
                    ),
                    SizedBox(width: 16), // Add some spacing between items
                    Expanded(
                      child: AppServiceItem(
                        title: 'Market Place'.tr(),
                        image: Assets.activity,
                        index: 0,
                        onTap: () {
                          AutoRouter.of(context).push(NewLivraisonType1Route());
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [AppCurrentLivraisonItem()],
      ),
    );
  }
}
