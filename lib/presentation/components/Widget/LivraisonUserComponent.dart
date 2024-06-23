import 'package:BabanaExpress/application/model/exportmodel.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:BabanaExpress/utils/functions/datetime_format_utils.dart';

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
                            color: ColorsApp.primary.withOpacity(0.1),
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
                              Text(FormatDateTime()
                                  .dateToStringNew(livraison.date)),
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
                                  margin: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: CachedNetworkImage(
                                    height: getHeight(context) * .09,
                                    width: getWidth(context) * .25,
                                    fit: BoxFit.cover,
                                    imageUrl: livraison.colis[0].images[0].src,
                                    imageBuilder: (context, imageProvider) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                        child: Shimmer.fromColors(
                                            baseColor: ColorsApp.greyNew,
                                            highlightColor: ColorsApp.primary
                                                .withOpacity(.1),
                                            child: Container(
                                              /*   height: getHeight(context) * .09,
                                              width: getWidth(context) * .25,
                                             */
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: ColorsApp.greyNew,
                                              ),
                                            )),
                                      );
                                    },
                                    errorWidget: (context, url, error) {
                                      return Container(
                                        // height: getHeight(context) / 10,
                                        // width: getHeight(context) / 10,
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
                                        width: getWidth(context) * .34,
                                        child: Text(
                                            livraison.libelle.toString(),
                                            maxLines: 2,
                                            // overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: ColorsApp.primary,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700)),
                                      ),
                                      Container(
                                        child: Text(
                                            livraison.colis.length.toString() +
                                                ' ' +
                                                'colis'.tr(),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: ColorsApp.greyNew,
                                                fontWeight: FontWeight.w600)),
                                      ),
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
                              (livraison.livreur != null)
                                  ? Row(
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
                                              Text(' ' +
                                                  livraison.livreur!.prenom),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: kMarginX * 1.5, vertical: 1),
                                decoration: BoxDecoration(
                                    color: ColorsApp.primary,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  livraison.ville,
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
