// ignore: must_be_immutable
import 'package:BananaExpress/old/components/Widget/colisComponentBabana.dart';
import 'package:BananaExpress/old/model/data/LivraisonModel.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LivraisonBabanaComponent extends StatelessWidget {
  LivraisonModel livraison;

  LivraisonBabanaComponent({required this.livraison});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          child: Container(
              height: getHeight(context) * .20,
              // width: getWith(context),
              margin: EdgeInsets.symmetric(
                  horizontal: kMarginX, vertical: kMarginY),
              decoration: BoxDecoration(
                  color: ColorsApp.grey,
                  borderRadius: BorderRadius.circular(8)),
              child: /* SingleChildScrollView(
              child: */
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                    child: CachedNetworkImage(
                  height: getHeight(context) * .17,
                  width: getWith(context) * .3,
                  fit: BoxFit.cover,
                  imageUrl: livraison.colis[0].images[0].src,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8)),
                        image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.transparent, BlendMode.colorBurn)),
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
                        backgroundColor: ColorsApp.second,
                        radius: 50,
                        backgroundImage: AssetImage("assets/logo/logo.png"));
                  },
                )),
                Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: kMarginX, vertical: kMarginY),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child:
                              Text('Libelle : ' + livraison.libelle.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: ColorsApp.primary,
                                  )),
                        ),
                        Container(
                          child: Text(
                              'Prix Livraison: ' +
                                  livraison.montant.toString() +
                                  ' XAF',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: ColorsApp.primary,
                              )),
                        ),
                        Container(
                            child: Text('Date : ' + livraison.date,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: ColorsApp.primary,
                                ))),
                        Container(
                            child: Text(
                                'Status : ' +
                                    (livraison.status == 0
                                        ? "En attente"
                                        : (livraison.status == 1
                                            ? "En cours"
                                            : livraison.status == 2
                                                ? "Termine"
                                                : "En attente")),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: ColorsApp.primary,
                                ))),
                        Container(
                          child: Text('Payer a la recuperation',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: ColorsApp.primary,
                                  fontWeight: FontWeight.w600)),
                        ),
                        Container(
                          child: Text('Deja Paye',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: ColorsApp.primary,
                                  fontWeight: FontWeight.w600)),
                        ),
                        Container(
                          child: Text('Payer a la livraison',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: ColorsApp.primary,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    )),
              ]) /* ) */),
          onTap: () {
            Get.dialog(AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              title: Text('Vos produits'),
              actions: [
                InkWell(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ColorsApp.orange),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        Text(
                          'Fermer',
                          style: TextStyle(
                              color: ColorsApp.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        ),
                        Icon(Icons.close, color: ColorsApp.white, weight: 50)
                      ]),
                    ),
                    onTap: () => Get.back())
              ],
              content: Container(
                child: SingleChildScrollView(
                    child: Column(children: [
                  GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15.0,
                          childAspectRatio: 5,
                          mainAxisExtent: 150,
                          mainAxisSpacing: 15.0),
                      itemCount: livraison.colis.length,
                      itemBuilder: (_ctx, index) => ColisComponentBabana(
                            colis: livraison.colis[index],
                            idLivraison: livraison.id,
                          )),
                ])),
              ),
            ));
          },
        ),
        // Positioned(
        //     left: Get.width 8,
        //     top: Get.height * .02,
        //     child: InkWell(
        //         child: Icon(Icons.close, color: Colors.white),
        //         onTap: () async {
        //           var data = {
        //             'idProduit': produit.id,
        //           };
        //           await _controller.deletteProduit(data);
        //         }))
      ],
    );
  }
}
