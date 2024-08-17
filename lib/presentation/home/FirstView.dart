import 'package:BabanaExpress/presentation/components/Widget/LivraisonUserHomeComponent.dart';
import 'package:BabanaExpress/presentation/components/Widget/ShimmerHome.dart';
import 'package:BabanaExpress/presentation/components/Widget/home_option_widget.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import '../../presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/application/export_bloc.dart';  

class FirstView extends StatefulWidget {
  @override
  State<FirstView> createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView>
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
                                  crossAxisSpacing:
                                      28.0, // Spacing between columns
                                  childAspectRatio: 1,
                                  children: [
                                    HomeOptionWidget(
                                      title:
                                          'Je veux faire livrer mon colis'.tr(),
                                      icon: Assets.colis,
                                      onTap: () {
                                        AutoRouter.of(context)
                                            .push(NewLivraisonType1Route());
                                      },
                                    ),
                                    HomeOptionWidget(
                                      title:
                                          'Je veux qu\'on recuperer mon colis'
                                              .tr(),
                                      onTap: () {
                                          
                                          AutoRouter.of(context)
                                            .push(NewLivraisonType2Route());

                                      },
                                      icon: Assets.colis,
                                    ),
                                    HomeOptionWidget(
                                      title: 'Finances'.tr(),
                                      icon: Assets.wallet,
                                      arg: '',
                                      onTap: () {
                                        AutoRouter.of(context)
                                            .push(WalletRoute());
                                      },
                                    ),
                                 
                                  ])),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
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
                              ? /* Shimmer.fromColors(
                            baseColor: ColorsApp.greyNew,
                            highlightColor: ColorsApp.primary.withOpacity(.1),
                            child: */
                              Skeletonizer(
                                  enabled: true,
                                  child: Container(
                                      height: getHeight(context) * .08,
                                      width: getWidth(context) * .9,
                                      padding: EdgeInsets.symmetric(
                                          vertical: kMarginY),
                                      margin: EdgeInsets.symmetric(
                                        vertical: kMarginY,
                                      ).add(EdgeInsets.only(right: kMarginX)),
                                      decoration: BoxDecoration(
                                          color:
                                              ColorsApp.white.withOpacity(0.9),
                                          boxShadow: [
                                            BoxShadow(
                                              color: ColorsApp.primary
                                                  .withOpacity(0.1),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8)),
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
                                                width: getWidth(context) * .15,
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
                                                    fontWeight:
                                                        FontWeight.w800),
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
                                      )))
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
                                      height: getHeight(context) * .12,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: state
                                              .userHomeLivraisonList!.length,
                                          itemBuilder: (context, index) =>
                                              LivraisonUserHomeComponent(
                                                livraison: state
                                                        .userHomeLivraisonList![
                                                    index],
                                              )))
                        ],
                      ),
                    ),
            ));
  }
}
