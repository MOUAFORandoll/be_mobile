// ignore_for_file: must_be_immutable

import 'package:BabanaExpress/presentation/livraison/HistoriqueLivraisonView.dart';
import 'package:BabanaExpress/presentation/pharmacy/HistoriqueLivraisonMedicamentView.dart';
import '../../presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/components/Widget/icon_svg.dart';

import 'package:BabanaExpress/utils/constants/assets.dart';

import 'package:flutter_svg/svg.dart';

var loader = AppLoader.bounceLargeColorLoaderController();

class SecondView extends StatelessWidget {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => SafeArea(
            child: RefreshIndicator(
                color: ColorsApp.second,
                onRefresh: () => Future.delayed(Duration(seconds: 5), () {
                      BlocProvider.of<LivraisonBloc>(context)
                          .add(HistoriqueUserLivraison());
                      BlocProvider.of<PharmacyBloc>(context)
                          .add(HistoriqueLivraisonMedicament());
                    }),
                child:
                    CustomScrollView(controller: _scrollController, slivers: [
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
                      'yList'.tr(),
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
                    height: getHeight(context),
                    padding: EdgeInsets.symmetric(
                        vertical: kMarginY, horizontal: kMarginX),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppButton(
                                      bgColor: state.indexHistory == 0
                                          ? ColorsApp.primary
                                          : ColorsApp.grey,
                                      text: 'Colis',
                                      onTap: () => BlocProvider.of<HomeBloc>(
                                              context)
                                          .add(SetIndexHistoryEvent(index: 0))),
                                  AppButton(
                                      text: 'Medicaments',
                                      bgColor: state.indexHistory == 1
                                          ? ColorsApp.primary
                                          : ColorsApp.grey,
                                      onTap: () => BlocProvider.of<HomeBloc>(
                                              context)
                                          .add(SetIndexHistoryEvent(index: 1)))
                                ],
                              )),
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.only(top: kMarginY),
                                decoration: BoxDecoration(),
                                child: SingleChildScrollView(
                                    child: state.indexHistory == 0
                                        ? HistoriqueLivraisonView()
                                        : HistoriqueLivraisonMedicamentView())),
                          ),
                        ]),
                  ))
                ]))));
  }
}
