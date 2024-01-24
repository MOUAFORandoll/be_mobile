// ignore: must_be_immutable
import 'package:BananaExpress/old/model/data/CommandeModel.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommandeComponent extends StatelessWidget {
  CommandeModel commande;

  CommandeComponent({required this.commande});

  @override
  Widget build(BuildContext context) {
    // titre.text = commande.titre;
    // quantite.text = commande.quantite.toString();
    // prix.text = commande.prix.toString();
    // description.text = commande.description;
    return Container(
        child: Stack(
      children: [
        InkWell(
          child: Container(
              height: kHeight / 8,
              // width: kWidth,
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
                        margin: EdgeInsets.symmetric(
                            horizontal: kMarginX, vertical: kMarginY),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // width: kWidth * .6,

                              child: Text(
                                  'Code Commande : ' + commande.codeCommande,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: ColorsApp.second, fontSize: 12)),
                            ),
                            Container(
                              // width: kWidth * .6,

                              child: Text(
                                  'Code Client : ' + commande.codeClient,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: ColorsApp.second, fontSize: 12)),
                            ),
                            // Container(
                            //   // width: kWidth * .6,

                            //   child: Text('Etape : ' + commande.etape,
                            //       overflow: TextOverflow.ellipsis,
                            //       style: TextStyle(
                            //           color: ColorsApp.second,
                            //           fontSize: 12)),
                            // ),

                            Container(
                              child: Text('Date : ' + commande.date,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600)),
                            ),
                            // Container(
                            //   child: Text(
                            //       'Prix : ' +
                            //           commande.prix.toString() +
                            //           ' XAF',
                            //       overflow: TextOverflow.ellipsis,
                            //       style: TextStyle(
                            //           color: Colors.red,
                            //           fontWeight: FontWeight.w600)),
                            // ),
                            // Container(
                            //   child: Text(
                            //       'Quantite : ' +
                            //           commande.quantite.toString(),
                            //       overflow: TextOverflow.ellipsis,
                            //       style: TextStyle(
                            //           color: Colors.red,
                            //           fontWeight: FontWeight.w600)),
                            // ),
                            // Container(
                            //   child: Text('Code : ' + commande.codeCommande,
                            //       overflow: TextOverflow.ellipsis,
                            //       style: TextStyle(
                            //           color: Colors.red,
                            //           fontWeight: FontWeight.w600)),
                            // ),
                            // Container(
                            //   child: Text('Date : ' + commande.date,
                            //       overflow: TextOverflow.ellipsis,
                            //       style: TextStyle(
                            //           color: Colors.red,
                            //           fontWeight: FontWeight.w600)),
                            // ),
                            // // Container(
                            //   // width: kWidth * .6,
                            //   child: Text('XAF ' + commande.prix.toString(),
                            //       overflow: TextOverflow.ellipsis,
                            //       style: TextStyle(
                            //           decoration: TextDecoration.lineThrough,
                            //           decorationColor:  ColorsApp.primary,
                            //           decorationThickness: 2.85,
                            //           color:  ColorsApp.primary,
                            //           fontSize: 12,
                            //           fontWeight: FontWeight.w600)),
                            // )
                          ],
                        )),
                  ]) /* ) */),
          onTap: () {},
        ),
      ],
    ));
  }
}
