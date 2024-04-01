import 'package:BabanaExpress/application/model/exportmodel.dart';
import 'package:BabanaExpress/presentation/components/Widget/colisComponentUser.dart';
import 'package:BabanaExpress/presentation/livraison/LivraisonDataPage.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

// ignore: must_be_immutable
class LivraisonUserComponent extends StatelessWidget {
  LivraisonModel livraison;

  LivraisonUserComponent({required this.livraison});
  GlobalKey globalKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    // titre.text = livraison.titre;
    // quantite.text = livraison.quantite.toString();
    // prix.text = livraison.prix.toString();
    // description.text = livraison.description;
    return livraison.colis.length == 0
        ? Container()
        : livraison.colis[0].images.length == 0
            ? Container()
            : InkWell(
                child: Container(
                    height: getHeight(context) * .20,
                    padding: EdgeInsets.symmetric(vertical: kMarginY),
                    margin: EdgeInsets.symmetric(
                        /*   horizontal: kMarginX, */ vertical: kMarginY),
                    decoration: BoxDecoration(
                        color: ColorsApp.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: kMarginX,
                          ).add(EdgeInsets.only(bottom: kMarginY / 2)),
                          margin: EdgeInsets.only(bottom: kMarginY * 1.3),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: ColorsApp.greyNew, width: .5))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(livraison.date),
                              Row(
                                children: [
                                  Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          color: ColorsApp.primary,
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                  Container(
                                    margin: EdgeInsets.only(left: kMarginY),
                                    child: Text(
                                        livraison.status == 0
                                            ? 'En attente de validation'
                                            : livraison.status == 1
                                                ? 'En cours de livraison'
                                                : 'Colis livres',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: ColorsApp.black,
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: CachedNetworkImage(
                                    height: getHeight(context) * .09,
                                    width: getWith(context) * .35,
                                    fit: BoxFit.cover,
                                    imageUrl: livraison.colis[0].images[0].src,
                                    imageBuilder: (context, imageProvider) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                              colorFilter: ColorFilter.mode(
                                                  Colors.transparent,
                                                  BlendMode.colorBurn)),
                                        ),
                                      );
                                    },
                                    placeholder: (context, url) {
                                      return Container(
                                        child: Center(
                                            child: CircularProgressIndicator(
                                          color: ColorsApp.second,
                                        )),
                                      );
                                    },
                                    errorWidget: (context, url, error) {
                                      return CircleAvatar(
                                        radius: 30,
                                        child: Image.asset(
                                          Assets.login,
                                          fit: BoxFit.fill,
                                        ),
                                      );
                                    },
                                  )),
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: kMarginX,
                                      vertical: kMarginY / 2),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: getWith(context) * .34,
                                        child: Text(
                                            livraison.libelle.toString(),
                                            maxLines: 2,
                                            // overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: ColorsApp.primary,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700)),
                                      ),
                                      // Container(
                                      //   child: Text('yPrix'.tr(),
                                      //       overflow: TextOverflow.ellipsis,
                                      //       style: TextStyle(
                                      //           color: ColorsApp.black,
                                      //           fontSize: 9)),
                                      // ),
                                      Container(
                                        child: Text(
                                            livraison.montant.toString() +
                                                ' XAF',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: ColorsApp.black,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                      // Container(
                                      //     child: Text('yDate'.tr(),
                                      //         overflow: TextOverflow.ellipsis,
                                      //         style: TextStyle(
                                      //             color: ColorsApp.black,
                                      //             fontSize: 9))),
                                      // Container(
                                      //     child: Text(livraison.date,
                                      //         overflow: TextOverflow.ellipsis,
                                      //         style: TextStyle(
                                      //             color: ColorsApp.black,
                                      //             fontWeight:
                                      //                 FontWeight.w600))),
                                      // Container(
                                      //   child: Text(
                                      //       livraison.status == 0
                                      //           ? 'En attente de validation'
                                      //           : livraison.status == 1
                                      //               ? 'En cours de livraison'
                                      //               : 'Colis livres',
                                      //       overflow:
                                      //           TextOverflow.ellipsis,
                                      //       style: TextStyle(
                                      //         fontSize: 14,
                                      //         color: ColorsApp.black,
                                      //       )),
                                      // ),
                                    ],
                                  )),
                            ]),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: kMarginX,
                          ).add(EdgeInsets.only(top: kMarginY / 2)),
                          margin: EdgeInsets.only(top: kMarginY * 1.3),
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: ColorsApp.greyNew, width: .5))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (livraison.livreur != null)
                                Row(
                                  children: [
                                    Container(
                                        child: Icon(
                                      Icons.account_circle_sharp,
                                      color: ColorsApp.primary,
                                    )),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: kMarginX / 2,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(livraison.livreur!.nom),
                                          Text(' ' + livraison.livreur!.prenom),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: kMarginX * 1.5, vertical: 1),
                                decoration: BoxDecoration(
                                    color: ColorsApp.primary,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  'Douala',
                                  style: TextStyle(color: ColorsApp.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ) /* ) */),
                onTap: () => AutoRouter.of(context)
                    .push(LivraisonDataRoute(livraison: livraison)));
  }
}
