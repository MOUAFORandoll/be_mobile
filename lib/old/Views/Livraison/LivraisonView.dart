import 'package:BananaExpress/old/components/Widget/LivraisonUserComponent.dart';
import 'package:BananaExpress/old/components/Widget/ShimmerLivraison.dart';
import 'package:BananaExpress/old/components/Widget/icon_svg.dart';
import 'package:BananaExpress/old/controller/LivraisonController.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:BananaExpress/utils/Services/routing.dart';
import 'package:BananaExpress/utils/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../components/Widget/EmptyLivraisonsComponent.dart';

// ignore: must_be_immutable
class LivraisonView extends StatelessWidget {
  LivraisonView({Key? key}) : super(key: key);
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LivraisonController>(builder: (_controller) {
      return SafeArea(
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
            'Liste des livraisons',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.w600),
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
          (context, index) => _controller.isLoadedPLivraison == 0
              ? ShimmerLivraison()
              : _controller.isLoadedPLivraison == 2
                  ? Text('Error')
                  : _controller.userLivraisonList.length == 0
                      ? EmptyLivraisonsComponent()
                      : Container(
                          child: SingleChildScrollView(
                              child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      _controller.userLivraisonList.length,
                                  // controller: _controller,
                                  itemBuilder: (_, index) =>
                                      LivraisonUserComponent(
                                        livraison: _controller
                                            .userLivraisonList[index],
                                      ))),
                        ),
          childCount: 1,
        ))
      ]));
    });
  }
}
