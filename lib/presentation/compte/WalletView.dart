import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/presentation/components/Button/customBtn.dart';
import 'package:BabanaExpress/presentation/components/Widget/TransactionComponent.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get_storage/get_storage.dart';
import 'package:shimmer/shimmer.dart';
import 'package:BabanaExpress/presentation/compte/PaiementDepotPage.dart';

@RoutePage()
class WalletPage extends StatefulWidget {
  WalletPage({
    Key? key,
  }) : super(key: key);
  static const routeName = '/wallet/new';

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (contextHome, stateHome) => BlocConsumer<CompteBloc,
                CompteState>(
            listener: (context, state) {
              if (state.isLoadingDepot == 0) {
                EasyLoading.show(
                    dismissOnTap: true,
                    status: 'En cours',
                    maskType: EasyLoadingMaskType.black);
              } else if (state.isLoadingDepot == 1) {
                EasyLoading.dismiss();
                if (state.paiement_url != null) {
                  AutoRouter.of(context).pushNamed(PaimentDepotPage.routeName);
                }
              } else if (state.isLoadingDepot == 2) {
                EasyLoading.dismiss();

                showError('Une erreur est survenue', context);
                print('-----44--------*********');
              }
            },
            builder: (context, state) => Scaffold(
                  backgroundColor: ColorsApp.bg,
                  body: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      SliverAppBar(
                        backgroundColor: ColorsApp.bg,
                        automaticallyImplyLeading: false,
                        centerTitle: true,
                        title: Text(
                          'Mon Portefeuills',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        actions: [
                          InkWell(
                            child: Container(
                              margin: EdgeInsets.zero,
                              // padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(

                                  // borderRadius: BorderRadius.circular(20),
                                  ),
                              child: Icon(Icons.replay,
                                  color: ColorsApp.black, size: 25.0),
                            ),
                            onTap: () async {
                              // await transControll.actualise();
                            },
                          ),
                        ],
                        leading: Container(
                            child: InkWell(
                          child: Container(
                            margin: EdgeInsets.zero,
                            // padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(

                                // borderRadius: BorderRadius.circular(20),
                                ),
                            child: Icon(Icons.arrow_back_ios_new,
                                color: ColorsApp.black, size: 25.0),
                          ),
                          onTap: () {
                            AutoRouter.of(context).pop();
                          },
                        )),
                        flexibleSpace: FlexibleSpaceBar(
                            background: Container(
                                decoration: BoxDecoration(
                                  color: ColorsApp.bg,
                                ),
                                margin: EdgeInsets.symmetric(
                                  horizontal: kMarginX,
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          child: Text(
                                        'Available balance',
                                        style: TextStyle(
                                            // fontSize: kDescription,

                                            ),
                                      )),
                                      Container(
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  child: Text(
                                                'XAF ',
                                                style: TextStyle(),
                                              )),
                                              Container(
                                                  child: Text(
                                                '${stateHome.user!.solde}',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    // fontSize: kTitle * 2.5,

                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                            ],
                                          )),
                                    ]))),
                        bottom: PreferredSize(
                            preferredSize: Size.fromHeight(180),
                            child: Container(
                              // decoration: BoxDecoration(
                              //   color: ColorsApp.grey,
                              // ),
                              margin: EdgeInsets.symmetric(
                                horizontal: kMarginX * 2,
                              ).add(
                                EdgeInsets.only(
                                    bottom: kMarginY * 2, top: kMarginY * 5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ButtonIcon(
                                      title: 'Depot',
                                      textColor: ColorsApp.black,
                                      bgColor: Colors.white,
                                      icon: Icons.keyboard_arrow_down_outlined,
                                      onTap: () => makeDepot()),
                                  ButtonIcon(
                                      title: 'Retirer',
                                      textColor: Colors.white,
                                      icon: Icons.keyboard_arrow_up_outlined,
                                      bgColor: Colors.black,
                                      onTap: () => makeRetrait()),
                                ],
                              ),
                            )),
                        expandedHeight: 200,
                        pinned: true,
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => state.isLoadedTrans == 0
                              ? SpinKitCircle(
                                  color: Colors.blue,
                                  size: 40,
                                )
                              : Container(
                                  height: double.maxFinite,
                                  margin: EdgeInsets.symmetric(
                                    vertical: kMarginY * .2,
                                    horizontal: kMarginX,
                                  ),
                                  child: ListView.builder(
                                    itemCount: state.transactionList!.length,
                                    // controller: _controller,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (_, index) =>
                                        TransactionComponent(
                                      transaction:
                                          state.transactionList![index],
                                    ),
                                  ),
                                ),
                          childCount: 1,
                        ),
                      ),
                    ],
                  ),
                )));
  }

  makeDepot() => showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => BlocBuilder<CompteBloc, CompteState>(
            builder: (context, state) => Container(
              height: getHeight(context) * .9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: ColorsApp.white,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: kMarginX,
              ).add(EdgeInsets.only(top: kMarginY)),
              child: SingleChildScrollView(
                  child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppInput(
                    icon: Icon(Icons.phone),
                    controller: state.phone,
                    textInputType: TextInputType.number,
                    placeholder: 'phone',
                  ),
                  AppInput(
                    controller: state.montantTransaction,
                    textInputType: TextInputType.number,
                    placeholder: 'Montant',
                  ),
                  AppButton(
                      size: MainAxisSize.max,
                      bgColor: ColorsApp.primary,
                      text: 'Valider',
                      onTap: () async {
                        context.read<CompteBloc>().add(CreditCompte());
                      })
                ],
              )),
            ),
          ));

  makeRetrait() => showModalBottomSheet(
        context: context,
        builder: (BuildContext context) => BlocBuilder<CompteBloc, CompteState>(
          builder: (context, state) => Container(
            height: getHeight(context) * .9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: ColorsApp.white,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: kMarginX,
            ).add(EdgeInsets.only(top: kMarginY)),
            child: SingleChildScrollView(
                child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: kMarginX / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: kMarginX / 2),
                        child: Row(
                          children: [
                            Text(
                              'Effectuer votre recharge'.tr() + ' ',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.symmetric(vertical: kMarginX / 2),

                          // padding:
                          //     EdgeInsets.symmetric(horizontal: kMarginX / 2),
                          child: InkWell(
                            onTap: () => AutoRouter.of(context).pop(),
                            child: Icon(
                              Icons.close,
                              // color: ColorsApp.white,
                            ),
                          )),
                    ],
                  ),
                ),
                AppInput(
                  icon: Icon(Icons.phone),
                  controller: state.phone,
                  textInputType: TextInputType.number,
                  placeholder: 'phone',
                ),
                AppInput(
                  controller: state.montantTransaction,
                  textInputType: TextInputType.number,
                  placeholder: 'Montant',
                ),
                AppInput(
                  icon: Icon(Icons.lock),
                  controller: state.password,
                  placeholder: 'password',
                ),
                AppButton(
                    size: MainAxisSize.max,
                    bgColor: ColorsApp.red,
                    text: 'Retirer',
                    onTap: () async {
                      context.read<CompteBloc>().add(RetraitCompte());
                    })
              ],
            )),
          ),
        ),
      );
}
