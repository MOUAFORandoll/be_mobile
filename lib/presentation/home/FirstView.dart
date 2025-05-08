import 'package:BabanaExpress/common/bloc/user_cubit.dart';
import 'package:BabanaExpress/presentation/components/Button/buttons.dart';
import 'package:BabanaExpress/presentation/components/Widget/global_bottom_sheet.dart';
import 'package:BabanaExpress/presentation/components/Widget/profile_picture.dart';
import 'package:BabanaExpress/utils/assets.dart';
import '../../presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import 'dart:async';

import 'package:BabanaExpress/presentation/components/Button/themeButton.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_current_livraison_item.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_pub_item.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_service_item.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_text_title.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:new_version_plus/new_version_plus.dart';

import '../../presentation/components/exportcomponent.dart';

class FirstView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: 40.0,
      ),
      child: Column(
        children: [
          _buildHeader(context),
          SizedBox(height: 16),
          _buildInfoView(context),
          SizedBox(height: 16),
          _buildServiceView(context),
          // _buildCurrent(),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final user = context.read<UserCubit>().user!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              UserProfilePicture(),
              Text(
                'Babana Express',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              IconButton(
                onPressed: () {},
                icon: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ThemeApp.second,
                  ),
                  child: Icon(
                    Icons.notifications_outlined,
                    color: ThemeApp.white,
                    size: 20,
                  ),
                  constraints: BoxConstraints(),
                ),
              )
            ])),
        SizedBox(height: 16),
        Text('Bonjour,', style: Theme.of(context).textTheme.bodySmall),
        Text(user.nom, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }

  Widget _buildInfoView(context) {
    return Container(
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
            viewportFraction: .79,
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal),
      ),
    );
  }

  Widget _buildServiceView(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: kMarginY * .8),
          child: AppTextTitle(
            text: 'Nos Services',
            bolder: true,
            big: true,
            percent: 0.8,
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ServiceCard(
                    title: 'Livraison de colis',
                    icon: Icons.local_shipping,
                    onTap: () => livraisonColis(context: context)),
                ServiceCard(
                  title: 'Livraison de medicament'.tr(),
                  icon: Icons.local_shipping,
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ServiceCard(
                  title: 'Blanchisserie'.tr(),
                  icon: Icons.local_shipping,
                  onTap: () {},
                ),
                ServiceCard(
                  title: 'Import de colis'.tr(),
                  icon: Icons.local_shipping,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  livraisonColis({required BuildContext context}) {
    print('dsds');
    String? selectedReason;
    return GlobalBottomSheet.show(
      maxHeight: 334,
      context: context,
      title: 'Livraison de colis'.tr(),
      subtitle: 'Veuillez choisir votre service de livraison'.tr(),
      widget: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) => Container(
          child: Container(
            child: Column(
              children: [
                const SizedBox(
                  height: 24.0,
                ),
                RadioListTile<String>(
                  title: Text(
                    'Récupérer et faire livrer mon colis',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  value: '1',
                  groupValue: selectedReason,
                  onChanged: (value) {
                    setState(() {
                      selectedReason = value;
                    });
                  },
                  // controlAffinity: ListTileControlAffinity.trailing,
                ),
                RadioListTile<String>(
                  title: Text(
                    'Récupérer et me livrer mon colis',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  value: '2',
                  groupValue: selectedReason,
                  onChanged: (value) {
                    setState(() {
                      selectedReason = value;
                    });
                  },
                  // controlAffinity: ListTileControlAffinity.trailing,
                ),
                const SizedBox(
                  height: 56.0,
                ),
                BEButton(
                  style: BEButtonStyle.secondary,
                  onPressed: selectedReason == null ? null : () {},
                  text: 'Continuer',
                ),
              ],
            ),
          ),
        ),
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
