import 'package:BananaExpress/presentation/components/Widget/EmptyLivraisonsComponent.dart';
import 'package:BananaExpress/presentation/components/Widget/LivraisonUserComponent.dart';
import 'package:BananaExpress/presentation/components/Widget/ShimmerLivraison.dart';
import 'package:BananaExpress/presentation/components/Widget/icon_svg.dart';

import 'package:BananaExpress/utils/constants/assets.dart';
import 'package:BananaExpress/presentation/components/exportcomponent.dart';

import 'package:flutter_svg/svg.dart';
import 'package:BananaExpress/application/export_bloc.dart';

// ignore: must_be_immutable
class LivraisonView extends StatelessWidget {
  LivraisonView({super.key});
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LivraisonBloc, LivraisonState>(
        builder: (context, state) {
      return RefreshIndicator(
          color: ColorsApp.second,
          onRefresh: () => Future.delayed(
              Duration(seconds: 5),
              () =>
                  BlocProvider.of<LivraisonBloc>(context).add(ListLivraison())),
          child: SafeArea(
              child: CustomScrollView(controller: _scrollController, slivers: [
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
                'yList'.tr(),
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.w600),
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
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) => state.isLoadedPLivraison == 0
                  ? ShimmerLivraison()
                  : state.isLoadedPLivraison == 2
                      ? Text('Error')
                      : state.userLivraisonList!.length == 0
                          ? EmptyLivraisonsComponent()
                          : Container(
                              child: SingleChildScrollView(
                                  child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount:
                                          state.userLivraisonList!.length,
                                      // controller: state,
                                      itemBuilder: (_, index) =>
                                          LivraisonUserComponent(
                                            livraison:
                                                state.userLivraisonList![index],
                                          ))),
                            ),
              childCount: 1,
            ))
          ])));
    });
  }
}
