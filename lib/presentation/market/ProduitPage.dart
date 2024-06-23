import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/application/model/exportmodel.dart';
import 'package:BabanaExpress/presentation/components/Button/ShareButton.dart';
import 'package:BabanaExpress/presentation/components/Text/bigtitleText.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

@RoutePage()
class ProduitPage extends StatefulWidget {
  static const routeName = '/produit/view';
  final ProduitModel produit;
  ProduitPage({required this.produit});

  @override
  State<ProduitPage> createState() => _ProduitPageState();
}

class _ProduitPageState extends State<ProduitPage>
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

  final CarouselController _controller = CarouselController();

  // @override
  // void initState() {
  //   // Get.find<ManagerController>().initCurrent();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // Object produ = Get.parameters['type'] == 'home'
    //     ? Get.find<ProduitController>().produitList[index]
    //     : Get.parameters['type'] == 'supplementaire'
    //         ? Get.find<ProduitController>().produitSupplementaire[index]
    //         : Get.parameters['type'] == 'search'
    //             ? Get.find<MySearchController>().listProduit[index]
    //             /*  : Get.parameters['type'] == '1'
    //             ? Get.find<ProduitController>().produitListAll[index]
    //             */
    //             : Get.parameters['type'] == 'favorite'
    //                 ? Get.find<ProduitController>().preferenceList[index]
    //                 : Get.find<CategoryBoutiqueController>()
    //                     .produitBoutiqueList[index];

    // ProduitModel produit =
    //     Get.find<GeneralController>().getProduit(Get.parameters['codeProduit']);
    // var produit = produ as ProduitModel;

    return BlocBuilder<MarketBloc, MarketState>(
        builder: (contextM, state) => Scaffold(
              body: SafeArea(
                  child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: ColorsApp.primary,
                    title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButtonF(
                            icon: Icons.arrow_back_ios_new,
                            color: ColorsApp.black,
                            onTap: () => AutoRouter.of(context).pop(),
                          ),
                        ]),
                    flexibleSpace: FlexibleSpaceBar(
                        background: Column(children: [
                      Expanded(
                          child: CarouselSlider.builder(
                              carouselController: _controller,
                              options: CarouselOptions(
                                  aspectRatio: 4 / 4,
                                  enlargeStrategy:
                                      CenterPageEnlargeStrategy.scale,
                                  initialPage: 0,
                                  enableInfiniteScroll: false,
                                  reverse: false,
                                  disableCenter: true,
                                  height: getHeight(context),
                                  // enlargeCenterPage: true,
                                  // autoPlay: true,

                                  // autoPlayCurve: Curves.fastOutSlowIn,
                                  // enableInfiniteScroll: true,
                                  viewportFraction: 1.0,
                                  onPageChanged: (index, reason) {
                                    BlocProvider.of<MarketBloc>(context).add(
                                        MarketEvent.setCarouselCurrent(
                                            indexCarossel: index));
                                  },
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  scrollDirection: Axis.horizontal),
                              // options: CarouselOptions(
                              //   height: 380.0,
                              //   enlargeCenterPage: true,
                              //   autoPlay: true,
                              //   aspectRatio: 16 / 9,
                              //   autoPlayCurve: Curves.fastOutSlowIn,
                              //   enableInfiniteScroll: true,
                              //   autoPlayAnimationDuration: Duration(milliseconds: 800),
                              //   viewportFraction: 0.8,
                              // ),
                              itemCount: widget.produit.images.length,
                              itemBuilder: (_ctx, i, j) => InkWell(
                                  child: CachedNetworkImage(
                                    height: getHeight(context) * .25,
                                    width: getWidth(context) * .5,
                                    fit: BoxFit.cover,
                                    imageUrl: widget.produit.images[i].src,
                                    imageBuilder: (context, imageProvider) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    },
                                    placeholder: (context, url) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: ColorsApp.grey,
                                        ),
                                        child: Center(
                                            child: CircularProgressIndicator(
                                          color: ColorsApp.primary,
                                        )),
                                      );
                                    },
                                    errorWidget: (context, url, error) {
                                      return CircleAvatar(
                                          backgroundColor: ColorsApp.primary,
                                          radius: 50,
                                          backgroundImage:
                                              AssetImage('Assets.logo'));
                                    },
                                  ),
                                  onTap: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ImageScreen(
                                            imagePath:
                                                widget.produit.images[i].src),
                                      ),
                                    );
                                  })))
                    ])),
                    expandedHeight: 250,
                    pinned: true,
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: kMarginX),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: widget.produit.images
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  // //print(entry.key);
                                  return GestureDetector(
                                    onTap: () =>
                                        _controller.animateToPage(entry.key),
                                    child: Container(
                                      width: 8.0,
                                      height: 8.0,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 4.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              (Theme.of(context).brightness ==
                                                          Brightness.dark
                                                      ? Colors.white
                                                      : ColorsApp.black)
                                                  .withOpacity(
                                                      state.indexCarossel ==
                                                              entry.key
                                                          ? 0.9
                                                          : 0.2)),
                                    ),
                                  );
                                }).toList(),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        BigtitleText(
                                            size: 16,
                                            text: widget.produit.titre,
                                            bolder: true),
                                      ])),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 2),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BigtitleText(
                                          text: 'XAF ' +
                                              widget.produit.prix.toString(),
                                          bolder: true),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                IconButtonF1(
                                                  icon: Icons.remove,
                                                  inconSize: 15.0,
                                                  onTap: () {
                                                    BlocProvider.of<MarketBloc>(
                                                            context)
                                                        .add(ManageQteProduit(
                                                            produit:
                                                                widget.produit,
                                                            state: false));
                                                  },
                                                ),
                                                Text(
                                                  contextM
                                                      .read<MarketBloc>()
                                                      .isInPanierQuantity(
                                                          widget.produit)
                                                      .toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: kTitle,
                                                      fontFamily: 'Lato',
                                                      color: ColorsApp.primary,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                IconButtonF1(
                                                  icon: Icons.add,
                                                  inconSize: 15.0,
                                                  onTap: () {
                                                    BlocProvider.of<MarketBloc>(
                                                            context)
                                                        .add(ManageQteProduit(
                                                            produit:
                                                                widget.produit,
                                                            state: true));
                                                  },
                                                ),
                                              ],
                                            ),
                                            // SimpleText(
                                            //     text:
                                            //         (prod.inCartItems).toString(),
                                            //     bolder: true),
                                          ],
                                        ),
                                      )
                                    ]),
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      color: ColorsApp.greyNew,
                                      border:
                                          Border.all(color: ColorsApp.greyNew),
                                      borderRadius: BorderRadius.circular(8)),
                                  margin: EdgeInsets.only(top: 10),
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: ColorsApp.orange,
                                              ),
                                              BigtitleText(
                                                  size: kBasics,
                                                  color: ColorsApp.black,
                                                  text: /* widget.produit.quantite
                                                          .toString() + */
                                                      '50 Pieces disponible ')
                                            ],
                                          ),
                                        ],
                                      ),
                                      ShareButton(
                                        libelle:
                                            'Suivez ce lien pour consulter ce produit  : ' /* + widget.produit.lienProduit */,
                                      )
                                      /*  InkWell(
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: ColorsApp.orange,
                                              ),
                                              BigtitleText(
                                                  size: 12,
                                                  color: ColorsApp.black,
                                                  text: widget.produit.note.toString())
                                            ],
                                          ),
                                          onTap: () {
                                            Get.bottomSheet(Container(
                                                decoration: BoxDecoration(
                                                    color: ColorsApp.grey,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(15),
                                                            topRight:
                                                                Radius.circular(
                                                                    15))),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: kSmWidth * .07),
                                                height: 800,
                                                child: SingleChildScrollView(
                                                    child: Column(
                                                        // mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                      // RatingBar(
                                                      //   initialRating:
                                                      //       widget.produit.note,
                                                      //   filledIcon: Icons.star,
                                                      //   emptyIcon:
                                                      //       Icons.star_border,
                                                      //   halfFilledIcon:
                                                      //       Icons.star_half,
                                                      //   isHalfAllowed: true,
                                                      //   filledColor:
                                                      //       Colors.yellow,
                                                      //   emptyColor:
                                                      //       Colors.yellow,
                                                      //   halfFilledColor:
                                                      //       Colors.yellow,
                                                      //   size: 30,
                                                      //   onRatingChanged:
                                                      //       (double rating) {
                                                      //     //print(rating);
                                                      //     Get.find<
                                                      //             GeneralController>()
                                                      //         .likeProduit(
                                                                
                                                      //             produit
                                                      //                 .codeProduit);
                                                      //   },
                                                      // ),
                                                    ]))));
                                          }) */
                                    ],
                                  )),
                              Container(
                                child: Row(
                                  // mainAxisAlignment:
                                  //   MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      // onTap: () =>
                                      //     prodController.setChoix(0),
                                      child: Container(
                                          /*  decoration: BoxDecoration(
                                              // color:
                                              //     prodController.choix == 0
                                              //         ? ColorsApp.greyNew
                                              //         : null,
                                              border: Border.all(
                                                  color: ColorsApp.greyNew),
                                              borderRadius:
                                                  BorderRadius.circular(8)), */
                                          margin: EdgeInsets.only(top: 10),
                                          child: BigtitleText(
                                            size: 15,
                                            text: 'Description',
                                            bolder: true,
                                            // color: prodController.choix == 0
                                            //     ? ColorsApp.secondBlue
                                            //     : ColorsApp.grey,
                                          )),
                                    ),

                                    // Container(
                                    //     decoration: BoxDecoration(
                                    //         color: ColorsApp.greyNew,
                                    //         border: Border.all(
                                    //             color: ColorsApp.greyNew),
                                    //         borderRadius:
                                    //             BorderRadius.circular(8)),
                                    //     margin: EdgeInsets.only(
                                    //         top: 10, left: 2),
                                    //     padding: EdgeInsets.all(8),
                                    //     child: BigtitleText(
                                    //       size: 14,
                                    //       text: 'Appreciations',
                                    //     )),
                                  ],
                                ),
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin:
                                            EdgeInsets.only(top: 20, bottom: 5),
                                        child: Text(
                                            'Ce produit appartient a la boutique ' +
                                                widget.produit.market,
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              color: ColorsApp.black,
                                            ))),
                                    Container(
                                        margin: EdgeInsets.only(bottom: 5),
                                        child: Text(widget.produit.description,
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              color: ColorsApp.black,
                                            ))),
                                  ]),
                              // Container(
                              //   margin: EdgeInsets.symmetric(
                              //       vertical: kMarginY),
                              //   child: Text("Produits Similaires",
                              //       // overflow: TextOverflow.ellipsis,
                              //       style: TexteStyle().blargeTextStyle),
                              //  ),
                              /*     prodController.isLoadedSupp == 0
                                      ? ShimmerProduit()
                                      : GridView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const BouncingScrollPhysics(),

                                          // Ratio largeur/hauteur pour chaque élément
                                          // controller: prods.controllerT,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10.0,
                                            childAspectRatio: kMarginX / 15,
                                            mainAxisSpacing: 8.0,
                                          ),
                                          itemCount: prodController
                                              .produitSupplementaire.length,
                                          itemBuilder: (_ctx, index) =>
                                              ProduitComponentAll(
                                                  produit: prodController
                                                          .produitSupplementaire[
                                                      index],
                                                  index: index,
                                                  type: 'supplementaire')),
                                  prodController.loaddata == true
                                      ? Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.all(10),
                                          child: CircularProgressIndicator())
                                      : Container(), */
                            ])),
                  ),
                ],
              )),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.white,
                foregroundColor: ColorsApp.primary,
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: ColorsApp.primary,
                ),
                onPressed: () => AutoRouter.of(context).push(ShoppingRoute()),
              ),
            )
        /*    bottomNavigationBar: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: kMarginY * 2,
                    ).add(EdgeInsets.only(bottom: 5)),
                    padding: EdgeInsets.all(kMarginX / 3.2),
                    // decoration: BoxDecoration(color: ColorsApp.grey),
                    child: false == false
                        ? Row(mainAxisSize: MainAxisSize.max, children: [
                            IconButtonF1(
                              icon: Icons.favorite,
                              inconSize: 15.0,
                              color: /* widget.produit.islike ? */
                                  ColorsApp.red /* : null */,
                              // backgroundColor:
                              //     widget.produit.islike ? ColorsApp.white : null,
                              padding: 9.0,
                              onTap: () {
                                BlocProvider.of<MarketBloc>(context)
                                    .add(AddProduitToPanier(
                                  produit: produit,
                                ));
                              },
                            ),
                            Container(
                                width: getWidth(context) * .80,
                                child: AppButton(
                                  size: MainAxisSize.max,
                                  text: /*  prodController.exitP(produit)
                                          ? "Augmenter"
                                          :  */
                                      'Ajouter',
                                  onTap: () {
                                    // prodController.setConf();
                                  },
                                ))
                          ])
                        :
                        Container(
                            decoration: BoxDecoration(
                                color: ColorsApp.grey,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15))),
                            padding: EdgeInsets.symmetric(
                              horizontal: getWidth(context) * .07,
                            ).add(EdgeInsets.only(bottom: 5)),
                            child: SingleChildScrollView(
                                child: Column(
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        BigtitleText(
                                            size: 12,
                                            text: 'Quantite',
                                            bolder: true),
                                        InkWell(
                                            child: Container(
                                              child: Icon(Icons.close,
                                                  color: ColorsApp.black),
                                            ),
                                            onTap: () {
                                              // prodController.unSetConf();
                                            }),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            IconButtonF0(
                                              icon: Icons.remove,
                                              inconSize: 15.0,
                                              onTap: () {
                                                // prodController
                                                //     .setQuantity(false);
                                                // prodController.addItem(
                                                //   produit,
                                                // );
                                              },
                                            ),
                                            SimpleText(
                                                text:
                                                    '10' /*  (prodController
                                                            .inCartItems)
                                                        .toString() */
                                                ,
                                                bolder: true),
                                            IconButtonF0(
                                              icon: Icons.add,
                                              inconSize: 15.0,
                                              onTap: () {
                                                // prodController
                                                //     .setQuantity(true);
                                                // prodController.addItem(
                                                //   produit,
                                                // );
                                                //print(
                                                // "****************${prod.inCartItems}");
                                              },
                                            ),
                                          ],
                                        ),
                                        // SimpleText(
                                        //     text:
                                        //         (prod.inCartItems).toString(),
                                        //     bolder: true),
                                      ],
                                    ),
                                  )
                                ]))),
                  )
                ],
              ), */
        );
  }
}

class ImageScreen extends StatelessWidget {
  final String imagePath;

  ImageScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          ColorsApp.grey, // Fond noir pour l'effet d'agrandissement
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context); // Ferme l'écran d'image agrandie lors du clic
        },
        child: Center(
          child: Hero(
            tag: 'imageTag',
            child: CachedNetworkImage(
              height: getHeight(context),
              width: getWidth(context),
              fit: BoxFit.contain,
              imageUrl: imagePath,
              imageBuilder: (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
              placeholder: (context, url) {
                return Container(
                  decoration: BoxDecoration(
                    color: ColorsApp.grey,
                  ),
                  child: Center(
                      child: CircularProgressIndicator(
                    color: ColorsApp.primary,
                  )),
                );
              },
              errorWidget: (context, url, error) {
                return CircleAvatar(
                    backgroundColor: ColorsApp.primary,
                    radius: 50,
                    backgroundImage: AssetImage('Assets.logo'));
              },
            ),
          ),
        ),
      ),
    );
  }
}
