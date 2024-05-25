import 'package:BabanaExpress/presentation/components/Widget/home_option.dart';
import 'package:BabanaExpress/presentation/livraison/NewLivraisonPage.dart';
import 'package:BabanaExpress/presentation/pharmacy/NewLivraisonMedicamentPage.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import '../../presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/components/Widget/HomeModuleComponent.dart';

class FirstView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                  top: kMarginY,
                ).add(EdgeInsets.symmetric(horizontal: kMarginY)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'Services',
                        style: TextStyle(
                            color: ColorsApp.white,
                            fontFamily: 'Lato',
                            fontSize: kTitle * 1.5,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Container(
                        height: getHeight(context) * .5,
                        child: GridView.count(
                            crossAxisCount: 2, // Two items per row
                            mainAxisSpacing: 28.0, // Spacing between rows
                            crossAxisSpacing: 28.0, // Spacing between columns
                            childAspectRatio: 1,
                            children: [
                              HomeOptionWidget(
                                title: 'Livraison de colis'.tr(),
                                icon: Assets.colis,
                                onTap: () {
                                  // BlocProvider.of<PrestataireRdvBloc>(context)
                                  //     .add(FetchRdv());
                                  AutoRouter.of(context)
                                      .push(HistoriqueLivraisonRoute());
                                },
                              ),
                              HomeOptionWidget(
                                title: 'Livraison de medicaments'.tr(),
                                onTap: () {
                                  // BlocProvider.of<PrestataireRdvBloc>(context)
                                  //     .add(FetchRdv());
                                  AutoRouter.of(context).push(
                                      HistoriqueLivraisonMedicamentRoute());
                                },
                                icon: Assets.p3,
                              ),
                              HomeOptionWidget(
                                title: 'Finances'.tr(),
                                icon: Assets.wallet,
                                arg: '',
                                onTap: () {
                                  AutoRouter.of(context).push(WalletRoute());
                                },
                              ),
                              HomeOptionWidget(
                                icon: Assets.market_place,
                                title: 'Market Place',
                                onTap: () {
                                  AutoRouter.of(context).push(MarketRoute());
                                },
                              ),
                            ])),
                    Container(
                      child: Text(
                        'Vos livraisons en cours',
                        style: TextStyle(
                            // color: ColorsApp.white,
                            fontFamily: 'Lato',
                            fontSize: kTitle * 1.3,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                        width: getWith(context),
                        height: getHeight(context) * .1,
                        child: ListView.builder(
                            shrinkWrap: true,
                            // physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) => Container(
                                height: getHeight(context) * .08,
                                width: getWith(context) * .8,
                                padding:
                                    EdgeInsets.symmetric(vertical: kMarginY),
                                margin: EdgeInsets.symmetric(
                                  vertical: kMarginY,
                                ).add(EdgeInsets.only(right: kMarginX)),
                                decoration: BoxDecoration(
                                    color: ColorsApp.white.withOpacity(0.9),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            ColorsApp.primary.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(8)),
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Container(
                                          height: getHeight(context) * .2,
                                          width: getWith(context) * .15,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                Assets.login,
                                              ),
                                            ),
                                          ),
                                        )),
                                    Container(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Livraison de medicaments',
                                          style: TextStyle(
                                              // color: ColorsApp.white,
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Text(
                                          'Paracetamol',
                                          style: TextStyle(
                                            // color: ColorsApp.white,
                                            fontSize: 11,
                                            fontFamily: 'Lato',
                                          ),
                                        ),
                                      ],
                                    )),
                                  ],
                                ))))
                  ],
                ),
              ),
            ));
  }
}
