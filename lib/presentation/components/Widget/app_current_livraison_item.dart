// ignore_for_file: must_be_immutable

import 'package:BabanaExpress/application/model/exportmodel.dart';
import 'package:BabanaExpress/presentation/components/Widget/CircleImage.dart';
import 'package:BabanaExpress/presentation/components/Widget/app_text_title.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:BabanaExpress/presentation/components/Widget/LivraisonUserHomeComponent.dart';
import 'package:BabanaExpress/presentation/components/Widget/ShimmerHome.dart';
import 'package:BabanaExpress/presentation/components/Widget/home_option_widget.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:BabanaExpress/application/export_bloc.dart';

class AppCurrentLivraisonItem extends StatefulWidget {
  @override
  State<AppCurrentLivraisonItem> createState() =>
      _AppCurrentLivraisonItemState();
}

class _AppCurrentLivraisonItemState extends State<AppCurrentLivraisonItem>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  void _startAnimation() {
    if (_animationController!.isCompleted) {
      _animationController!.reverse();
    } else {
      _animationController!.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => SingleChildScrollView(
              child: state.isLoadService == 0
                  ? ShimmerHome()
                  : Container(
                      margin: EdgeInsets.only(
                        top: kMarginY,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: kMarginY * .8),
                                  child: AppTextTitle(
                                    text: 'Vos livraisons en cours '.tr(),
                                    bolder: true,
                                    big: true,
                                    percent: 0.8,
                                  ),
                                ),
                                RotationTransition(
                                  turns: _animationController!,
                                  child: Container(
                                    child: InkWell(
                                      child: Icon(Icons.refresh,
                                          color: ColorsApp.primary),
                                      onTap: () {
                                        _startAnimation();
                                        context
                                            .read<HomeBloc>()
                                            .add(HomeStateLivraison());
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          state.isLoadHomeStateLivraison == 0
                              ? Skeletonizer(
                                  enabled: true,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: kMarginX,
                                        vertical: kMarginY),
                                    margin: EdgeInsets.symmetric(
                                      horizontal: kMarginX,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorsApp.white.withOpacity(0.9),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorsApp.primary
                                              .withOpacity(0.1),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    alignment: Alignment.center,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        // Header Row with Image and Title
                                        _buildHeaderRow(
                                            context,
                                            'Livraison de medicaments',
                                            'douala',
                                            'douala'),
                                        // First Row with Circle and Text
                                        _buildDetailRow(
                                          leading: _buildCircleIndicator(
                                              ColorsApp.white),
                                          content: _buildDetailColumn(
                                              'From'.tr(), 'Paracetamol'),
                                          marginLeft: kMarginX * 3.8,
                                        ),
                                        // Second Row with Only Text
                                        _buildDetailRow(
                                          content: _buildDetailColumn(
                                              'To'.tr(), 'Paracetamol'),
                                          marginLeft: kMarginX * 4.7,
                                        ),
                                        // Status Row
                                        _buildDetailRow(
                                          leading: _buildCircleIndicator(
                                              ColorsApp.white),
                                          content: Text(
                                            'Status : Livraison encours',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800),
                                          ),
                                          marginLeft: kMarginX,
                                          marginTop: kMarginY * 1.5,
                                        ),
                                      ],
                                    ),
                                  ))
                              : state.userHomeLivraisonList!.length == 0
                                  ? Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.symmetric(
                                              horizontal: kMarginX,
                                              vertical: kMarginY)
                                          .add(EdgeInsets.only(
                                              top: kMarginY * 2)),
                                      child: Text(
                                        'Vous n\'avez aucune livraison en cours !',
                                        style: TextStyle(
                                            fontSize: kBasics,
                                            fontWeight: FontWeight.w700),
                                      ))
                                  : Container(
                                      width: getWidth(context),
                                      height: getHeight(context) * .24,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: state
                                              .userHomeLivraisonList!.length,
                                          itemBuilder: (context, index) =>
                                              _buildData(
                                                  context: context,
                                                  livraison: state
                                                          .userHomeLivraisonList![
                                                      index])))
                        ],
                      ),
                    ),
            ));
  }

  Widget _buildData(
      {required BuildContext context,
      required LivraisonUserHomeModel livraison}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kMarginX, vertical: kMarginY),
      width: getWidth(context) * .7,
      margin: EdgeInsets.only(
        right: kMarginX * 1.5,
      ),
      decoration: BoxDecoration(
        color: ColorsApp.greyNew,
        // boxShadow: [
        //   BoxShadow(
        //     color: ColorsApp.primary.withOpacity(0.1),
        //     spreadRadius: 2,
        //     blurRadius: 5,
        //     offset: Offset(0, 2),
        //   ),
        // ],
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildHeaderRow(context, livraison.libelle, livraison.ville,
              livraison.pointLivraisonColis.first.img.first.src),
          _buildDetailRow(
            marginTop: kMarginY * 2,
            leading: _buildCircleIndicator(ColorsApp.second),
            content: _buildDetailColumn(
                'From'.tr(), livraison.pointRecuperationColis.libellePoint),
            // marginLeft: kMarginX * 3.8,
          ),
          _buildDetailRow(
            marginTop: kMarginY,
            content: _buildDetailColumn(
                'To'.tr(), livraison.pointLivraisonColis.first.libellePoint),
            marginLeft: kMarginX * 1.1,
          ),
          _buildDetailRow(
            // leading: _buildCircleIndicator(ColorsApp.primary),
            content: Text(
              'Status :  ${livraison.status}',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            marginLeft: kMarginX,
            marginTop: kMarginY,
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderRow(
      BuildContext context, String libelle, String ville, String imageUrl) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleImage(imageUrl: imageUrl),
            SizedBox(width: kMarginX),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    libelle,
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  Text(
                    ville,
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
            ),
          ],
        ),
        Icon(Icons.menu, color: ColorsApp.second),
      ],
    );
  }

  Widget _buildDetailRow({
    Widget? leading,
    required Widget content,
    double marginLeft = 0.0,
    double marginTop = 0.0,
  }) {
    return Container(
      margin: EdgeInsets.only(left: marginLeft, top: marginTop),
      child: Row(
        children: [
          if (leading != null) leading,
          SizedBox(width: 8.0),
          Container(child: content),
        ],
      ),
    );
  }

  Widget _buildDetailColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 11)),
        Container(
          width: getWidth(context) * .55,
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
      ],
    );
  }

  Widget _buildCircleIndicator(color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(90),
      ),
      height: 10,
      width: 10,
    );
  }
}
