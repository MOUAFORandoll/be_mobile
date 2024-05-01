import 'package:BabanaExpress/application/export_bloc.dart'; 
import 'package:BabanaExpress/presentation/components/Widget/TransactionComponent.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart'; 
import 'package:flutter_spinkit/flutter_spinkit.dart'; 
import 'package:floating_action_bubble/floating_action_bubble.dart';
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

class _WalletPageState extends State<WalletPage>
    with SingleTickerProviderStateMixin {
  Animation<double>? _animation;
  AnimationController? _animationController;
  
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

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
                        'Mon Portefeuille',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
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

                      bottom: PreferredSize(
                          preferredSize: Size.fromHeight(215),
                          child: Container(
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
                                        decoration: BoxDecoration(
                                            color: ColorsApp.white,
                                            border: Border.all(
                                                color: ColorsApp.grey,
                                                width: .5),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        margin: EdgeInsets.symmetric(
                                          horizontal: kMarginX,
                                        ),
                                        padding: EdgeInsets.all(30),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  child: Text(
                                                'Available balance',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              Container(
                                                  alignment: Alignment.center,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                          child: Text(
                                                        'XAF ',
                                                        style: TextStyle(),
                                                      )),
                                                      Container(
                                                          child: Text(
                                                        '${stateHome.user!.solde}',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize:
                                                                kTitle * 1.5,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                    ],
                                                  )),
                                              InkWell(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color:
                                                            ColorsApp.primary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50)),
                                                    margin: EdgeInsets.only(
                                                      top: kMarginY,
                                                    ),
                                                    padding: EdgeInsets.all(6)
                                                        .add(EdgeInsets
                                                            .symmetric(
                                                                horizontal: 5)),
                                                    child: Text(
                                                      'Actualiser',
                                                      style: TextStyle(
                                                          color:
                                                              ColorsApp.white),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    BlocProvider.of<UserBloc>(
                                                            context)
                                                        .add(GetUserEvent());
                                                    BlocProvider.of<CompteBloc>(
                                                            context)
                                                        .add(
                                                            HistoriqueTransaction());
                                                    BlocProvider.of<HomeBloc>(
                                                            context)
                                                        .add(UserDataEvent());
                                                  })
                                            ])),
                                    InkWell(
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: ColorsApp.white,
                                                border: Border.all(
                                                    color: ColorsApp.grey,
                                                    width: .5),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: kMarginX,
                                                vertical: kMarginY),
                                            padding: EdgeInsets.all(15),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                      child: Text(
                                                    '${stateHome.user!.soldeBonus}',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: kTitle * 1.5,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                  Container(
                                                      child: Text(
                                                    'Promos Bonus',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                  Container(
                                                      child: Icon(
                                                    Icons.keyboard_arrow_right,
                                                    color: ColorsApp.grey,
                                                  ))
                                                ])),
                                        onTap: () {
                                          BlocProvider.of<UserBloc>(context)
                                              .add(GetUserEvent());
                                          BlocProvider.of<CompteBloc>(context)
                                              .add(HistoriqueTransaction());
                                          BlocProvider.of<HomeBloc>(context)
                                              .add(UserDataEvent());
                                        })
                                  ]))),

                      // pinned: true,
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => state.isLoadedTrans == 0
                            ? SpinKitCircle(
                                color: Colors.blue,
                                size: 40,
                              )
                            : ListView.builder(
                                itemCount: state.transactionList!.length,
                                // controller: _controller,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (_, index) => TransactionComponent(
                                  transaction: state.transactionList![index],
                                ),
                              ),
                        childCount: 1,
                      ),
                    ),
                  ],
                ),
                // floatingActionButtonLocation:
                //     FloatingActionButtonLocation.miniCenterDocked,
                floatingActionButton: FloatingActionBubble(
                  items: <Bubble>[
                    // Floating action menu item
                    Bubble(
                      title: 'Crediter Compte',
                      iconColor: Colors.white,
                      bubbleColor: ColorsApp.primary,
                      icon: Icons.settings,
                      titleStyle: TextStyle(fontSize: 16, color: Colors.white),
                      onPress: () {
                        _animationController!.reverse();
                        makeDepot();
                      },
                    ),
                    // Bubble(
                    //   title: 'Retrait Compte',
                    //   iconColor: Colors.white,
                    //   bubbleColor: Colors.red,
                    //   icon: Icons.people,
                    //   titleStyle: TextStyle(fontSize: 16, color: Colors.white),
                    //   onPress: () {
                    //     _animationController!.reverse();
                    //     makeRetrait();
                    //   },
                    // ),
                    // Bubble(
                    //   title: 'Close',
                    //   iconColor: Colors.white,
                    //   bubbleColor: Colors.red,
                    //   icon: Icons.home,
                    //   titleStyle: TextStyle(fontSize: 16, color: Colors.white),
                    //   onPress: () {
                    //     _animationController!.reverse();
                    //   },
                    // ),
                  ],
                  animation: _animation!,
                  onPress: () => _animationController!.isCompleted
                      ? _animationController!.reverse()
                      : _animationController!.forward(),
                  iconColor: ColorsApp.primary,
                  iconData: Icons.attach_money,
                  backGroundColor: Colors.white,
                ))));
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
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: kMarginX, vertical: kMarginY),
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Add money'.tr(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              InkWell(
                                  child: Icon(Icons.close),
                                  onTap: () => AutoRouter.of(context).pop()),
                            ],
                          ),
                        ),
                        Container(
                          child: Text(
                            'Rechargez votre compte et acceder a plein de bonus y compris de multiples reductions sur vos livraisons'
                                .tr(),
                            style: TextStyle(
                                color: ColorsApp.primary,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppInput(
                        icon: Icon(Icons.phone),
                        controller: state.phone,
                        textInputType: TextInputType.number,
                        placeholder: 'labelphone'.tr(),
                      ),
                      AppInput(
                        controller: state.montantTransaction,
                        textInputType: TextInputType.number,
                        placeholder: 'Montant De la recharge (XAF)'.tr(),
                      ),
                      AppButton(
                          size: MainAxisSize.max,
                          bgColor: state.montantTransaction.text.isNotEmpty &&
                                  state.phone.text.isNotEmpty
                              ? ColorsApp.primary
                              : ColorsApp.greyNew,
                          text: 'Valider',
                          onTap: () async {
                            context.read<CompteBloc>().add(CreditCompte());
                          })
                    ],
                  ))),
                ],
              ),
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
            child: Column(children: [
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: kMarginX, vertical: kMarginY),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Retirer votre argent'.tr(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          InkWell(
                              child: Icon(Icons.close),
                              onTap: () => AutoRouter.of(context).pop()),
                        ],
                      ),
                    ),
                    Container(
                      child: Text(
                        'Rechargez votre compte et acceder a plein de bonus y compris de multiples reductions sur vos livraisons'
                            .tr(),
                        style: TextStyle(
                            color: ColorsApp.primary,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    AppInput(
                      icon: Icon(Icons.phone),
                      controller: state.phone,
                      textInputType: TextInputType.number,
                      placeholder: 'labelphone'.tr(),
                    ),
                    AppInput(
                      controller: state.montantTransaction,
                      textInputType: TextInputType.number,
                      placeholder: 'Montant Du retrait (XAF)',
                    ),
                    AppInput(
                      icon: Icon(Icons.lock),
                      controller: state.password,
                      placeholder: 'labelpassword'.tr(),
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
            ]),
          ),
        ),
      );
}
