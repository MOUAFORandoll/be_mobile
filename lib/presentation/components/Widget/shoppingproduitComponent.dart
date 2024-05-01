import 'package:BabanaExpress/application/export_bloc.dart';
import 'package:BabanaExpress/application/model/data/PanierModel.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';  
import 'package:cached_network_image/cached_network_image.dart'; 
// ignore: must_be_immutable
class ShoppingproduitComponent extends StatelessWidget {
  PanierModel cartM;

  ShoppingproduitComponent({required PanierModel this.cartM});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          height: getHeight(context) * .115,
          width: getWith(context),
          padding: EdgeInsets.only(bottom: kMarginY * 2),
          margin:
              EdgeInsets.symmetric(horizontal: kMarginX, vertical: kMarginY),
          decoration: BoxDecoration(
              /*  color: ColorsApp.grey, */ border:
                  Border(bottom: BorderSide(color: ColorsApp.greyNew))),
          child: BlocBuilder<MarketBloc, MarketState>(
              builder: (contextM, state) => Dismissible(
                    direction: DismissDirection.endToStart,

                    onDismissed: (DismissDirection direction) {
                      if (direction == DismissDirection.startToEnd) {
                        // Left to right

                        //print("Edit");
                      } else if (direction == DismissDirection.endToStart) {
                        // Right to left
                        print('Delete');
                        BlocProvider.of<MarketBloc>(context)
                            .add(RemoveProduitToPanier(
                          produit: cartM.produit,
                        ));
                      }
                    },
                    key: ObjectKey(cartM),
                    // left side

                    // right side
                    background: Container(
                      color: Colors.red[200],
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.centerRight,
                      child: const Icon(
                        Icons.delete,
                        color: ColorsApp.grey,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                            child: CachedNetworkImage(
                                          height: getHeight(context) * .15,
                                          width: getWith(context) * .25,
                                          fit: BoxFit.cover,
                                          imageUrl: cartM.produit.images[0].src,
                                          imageBuilder:
                                              (context, imageProvider) {
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.cover,
                                                        colorFilter:
                                                            ColorFilter.mode(
                                                                Colors
                                                                    .transparent,
                                                                BlendMode
                                                                    .colorBurn))),
                                              ),
                                            );
                                          },
                                          placeholder: (context, url) {
                                            return Container(
                                              child: Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                color: ColorsApp.primary,
                                              )),
                                            );
                                          },
                                          errorWidget: (context, url, error) {
                                            return CircleAvatar(
                                                backgroundColor:
                                                    ColorsApp.primary,
                                                radius: 50,
                                                backgroundImage: AssetImage(
                                                    'assets/logo/logoNew.png'));
                                          },
                                        )),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: getWith(context) * .5,
                                            margin: EdgeInsets.only(
                                                top: getHeight(context) * .005,
                                                left: getWith(context) * .05),
                                            child: smallText(
                                                text: cartM.produit.titre,
                                                bolder: true,
                                                al: true,
                                                size: kBasics)),
                                        Container(
                                            width: getWith(context) * .4,
                                            margin: EdgeInsets.only(
                                                top: getHeight(context) * .005,
                                                left: getWith(context) * .05),
                                            child: smallText(
                                                text: 'XAF ' +
                                                    cartM.produit.prix
                                                        .toString(),
                                                al: true,
                                                size: kBasics)),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: getHeight(context) * .012,
                                              left: getWith(context) * .025),
                                          child: Row(
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
                                                              cartM.produit,
                                                          state: false));
                                                },
                                              ),
                                              Container(
                                                  width: getWith(context) * .2,
                                                  // margin:
                                                  //     EdgeInsets.only(top: getHeight(context) * .005),
                                                  child: smallText(
                                                      text: contextM
                                                          .read<MarketBloc>()
                                                          .isInPanierQuantity(
                                                              cartM.produit)
                                                          .toString(),
                                                      bolder: true,
                                                      size: 15)),
                                              IconButtonF1(
                                                icon: Icons.add,
                                                inconSize: 15.0,
                                                onTap: () {
                                                  BlocProvider.of<MarketBloc>(
                                                          context)
                                                      .add(ManageQteProduit(
                                                          produit:
                                                              cartM.produit,
                                                          state: true));
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                              Container(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () =>
                                        BlocProvider.of<MarketBloc>(context)
                                            .add(RemoveProduitToPanier(
                                      produit: cartM.produit,
                                    )),
                                    child: Container(
                                      margin: EdgeInsets.zero,
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ColorsApp
                                                .primary /*  ColorsApp.orange */),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Icon(
                                        Icons.close,
                                        color: ColorsApp
                                            .primary /*  ColorsApp.orange */,
                                        size: 12,
                                        semanticLabel: 'Close',
                                      ),
                                    ),
                                  ),
                                ],
                              ))
                            ]),
                      ],
                    ),
                  ))),
      onTap: () {
        // Get.toNamed(
        //     AppLinks.PRODUCT + '?index=${cartM.index}&type=${cartM.type}');
      },
    );
  }
}
