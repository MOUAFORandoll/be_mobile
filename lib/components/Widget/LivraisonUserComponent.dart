// ignore: must_be_immutable
import 'package:BananaExpress/model/data/LivraisonModel.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

// ignore: must_be_immutable
class LivraisonUserComponent extends StatelessWidget {
  LivraisonModel livraison;

  LivraisonUserComponent({required this.livraison});

  @override
  Widget build(BuildContext context) {
    // titre.text = livraison.titre;
    // quantite.text = livraison.quantite.toString();
    // prix.text = livraison.prix.toString();
    // description.text = livraison.description;
    return Stack(
      children: [
        InkWell(
          child: Container(
              height: kHeight * .17,
              // width: kMdWidth,
              margin: EdgeInsets.symmetric(
                  horizontal: kMarginX, vertical: kMarginY),
              decoration: BoxDecoration(
                  color: ColorsApp.grey,
                  borderRadius: BorderRadius.circular(8)),
              child: /* SingleChildScrollView(
              child: */
                  Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Container(
                        child: CachedNetworkImage(
                      height: kHeight * .17,
                      width: kWidth * .3,
                      fit: BoxFit.cover,
                      imageUrl: livraison.fichier[0].src,
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
                            backgroundImage:
                                AssetImage("assets/logo/logoNew.png"));
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
                              child: Text(
                                  'Libelle : ' +
                                      livraison.libelle.toString() +
                                      ' XAF',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: ColorsApp.primary,
                                  )),
                            ),
                            Container(
                              child: Text(
                                  'Valeur : ' +
                                      livraison.valeur.toString() +
                                      ' XAF',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: ColorsApp.primary,
                                  )),
                            ),
                            Container(
                              child: Text(
                                  'Prix Final: ' +
                                      livraison.montant.toString() +
                                      ' XAF',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: ColorsApp.primary,
                                  )),
                            ),
                            Container(
                              child: Text(
                                  'Quantite : ' + livraison.quantite.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: ColorsApp.primary,
                                  )),
                            ),
                            // Container(
                            //   child: Text('Code : ' + livraison.codelivraison,
                            //       overflow: TextOverflow.ellipsis,
                            //       style: TextStyle(
                            //         color: ColorsApp.primary,
                            //       )),
                            // ),
                            Container(
                                child: Text('Date : ' + livraison.date,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: ColorsApp.primary,
                                    ))),
                            Container(
                              child: Text(
                                  'Status : ' + livraison.status.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: ColorsApp.primary,
                                  )),
                            ),
                            // Container(
                            //   // width: kSmWidth * .6,
                            //   child: Text('XAF ' + livraison.prix.toString(),
                            //       overflow: TextOverflow.ellipsis,
                            //       style: TextStyle(
                            //           decoration: TextDecoration.lineThrough,
                            //           decorationColor:  ColorsApp.black,
                            //           decorationThickness: 2.85,
                            //           color:  ColorsApp.black,
                            //            ,
                            //        )),
                            // )
                          ],
                        )),
                  ]) /* ) */),
          onTap: () {
            Get.bottomSheet(Container(
                decoration: BoxDecoration(
                    color: ColorsApp.grey,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                padding: EdgeInsets.symmetric(horizontal: kSmWidth * .07),
                height: 800,
                child: SingleChildScrollView(
                    child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                      Container(
                        height: kHeight * .20,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: livraison.fichier.length,
                          itemBuilder: (context, index) => Container(
                              child: CachedNetworkImage(
                            height: kHeight * .15,
                            width: kWidth * .3,
                            fit: BoxFit.cover,
                            imageUrl: livraison.fichier[index].src,
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
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
                                  backgroundColor: ColorsApp.second,
                                  radius: 50,
                                  backgroundImage:
                                      AssetImage("assets/logo/logoNew.png"));
                            },
                          )),
                        ),
                      ),
                      QrImageView(
                        data: "livraison.codelivraison" +
                            '@' +
                            "_controller.Boutique.codeBoutique",
                        version: QrVersions.auto,
                        size: 200.0,
                      ),
                    ]))));
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
