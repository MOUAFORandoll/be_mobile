import 'package:BananaExpress/application/model/exportmodel.dart';
import 'package:BananaExpress/presentation/components/Widget/colisComponentUser.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

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
    return Stack(
      children: [
        InkWell(
            child: Container(
                height: getHeight(context) * .17,
                // width: getWith(context),
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
                              backgroundImage:
                                  AssetImage("assets/logo/logo.png"));
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
                                    'Libelle : ' + livraison.libelle.toString(),
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
                                    'Status : ' + livraison.status.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: ColorsApp.primary,
                                    )),
                              ),
                            ],
                          )),
                    ]) /* ) */),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
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
                            child:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              Text(
                                'Fermer',
                                style: TextStyle(
                                    color: ColorsApp.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13),
                              ),
                              Icon(Icons.close,
                                  color: ColorsApp.white, weight: 50)
                            ]),
                          ),
                          onTap: () => AutoRouter.of(context).pop())
                    ],
                    content: Container(
                      child: SingleChildScrollView(
                          child: Column(children: [
                        GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 15.0,
                                    childAspectRatio: 5,
                                    mainAxisExtent: 150,
                                    mainAxisSpacing: 15.0),
                            itemCount: livraison.colis.length,
                            itemBuilder: (_ctx, index) => ColisComponentUser(
                                colis: livraison.colis[index])),
                      ])),
                    ),
                  );
                },
              );
            })
      ],
    );
  }
}
