import 'package:BabanaExpress/application/model/data/LivraisonMedicamentModel.dart';
import 'package:BabanaExpress/presentation/components/Widget/medicamentComponentUser.dart';

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:BabanaExpress/utils/functions/datetime_format_utils.dart';

// ignore: must_be_immutable
class LivraisonMedicamentUserComponent extends StatelessWidget {
  LivraisonMedicamentModel livraison;

  LivraisonMedicamentUserComponent({required this.livraison});
  GlobalKey globalKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return livraison.medicaments.length == 0
        ? Container()
        : InkWell(
            child: Container(
                height: getHeight(context) * .24,
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
                child: Column(children: [
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
                        Text(FormatDateTime().dateToStringNew(livraison.date)),
                        Row(
                          children: [
                            Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    color: ColorsApp.primary,
                                    borderRadius: BorderRadius.circular(30))),
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
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Container(
                            height: getHeight(context) * .09,
                            width: getWith(context) * .25,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: AssetImage(
                                  Assets.medical,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: kMarginX, vertical: kMarginY / 2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Container(
                                //   child: Text('yLibelle'.tr(),
                                //       overflow: TextOverflow.ellipsis,
                                //       style: TextStyle(
                                //           color: ColorsApp.black,
                                //           fontSize: 9)),
                                // ) ,
                                Container(
                                  child: Text('Une commande de medicaments',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: ColorsApp.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600)),
                                ),
                                Container(
                                    child: Text('yDate'.tr(),
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: ColorsApp.black,
                                            fontSize: 9))),
                                Container(
                                    child: Text(livraison.date,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: ColorsApp.black,
                                            fontWeight: FontWeight.w600))),
                                Container(
                                  child: Text('yPrix'.tr(),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: ColorsApp.black, fontSize: 9)),
                                ),
                                Container(
                                  child: Text(
                                      livraison.montant.toString() + ' XAF',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: ColorsApp.black,
                                          fontWeight: FontWeight.w600)),
                                ),
                                Container(
                                  child: Text('status'.tr(),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: ColorsApp.black, fontSize: 9)),
                                ),
                                Container(
                                  child: Text(
                                      livraison.status == 0
                                          ? 'En attente'
                                          : livraison.status == 1
                                              ? 'En cours'
                                              : 'effectuee',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: ColorsApp.black,
                                          fontWeight: FontWeight.w600)),
                                ),
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
                                        Text(' ' + livraison.livreur!.prenom),
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
                ])),
            onTap: () => showModalBottomSheet(
                context: context,
                builder: (BuildContext context) => Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Medicaments'.tr(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  InkWell(
                                      child: Icon(Icons.close),
                                      onTap: () =>
                                          AutoRouter.of(context).pop()),
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
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: kMarginX,
                            ),
                            child: GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 20.0,
                                        childAspectRatio: 15,
                                        mainAxisExtent: 180,
                                        mainAxisSpacing: 25.0),
                                itemCount: livraison.medicaments.length,
                                itemBuilder: (_ctx, index) =>
                                    MedicamentComponentUser(
                                        medicament:
                                            livraison.medicaments[index])),
                          ),
                        ),
                      ),
                    ]))));
  }
}
