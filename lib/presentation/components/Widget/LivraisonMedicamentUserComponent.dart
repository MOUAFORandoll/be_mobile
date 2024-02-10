import 'package:BabanaExpress/application/model/data/LivraisonMedicamentModel.dart';

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

// ignore: must_be_immutable
class LivraisonMedicamentUserComponent extends StatelessWidget {
  LivraisonMedicamentModel livraison;

  LivraisonMedicamentUserComponent({required this.livraison});
  GlobalKey globalKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return livraison.medicaments.length == 0
        ? Container()
        : Stack(
            children: [
              InkWell(
                  child: Container(
                      // height: getHeight(context) * .20,
                      margin: EdgeInsets.symmetric(
                          horizontal: kMarginX, vertical: kMarginY),
                      decoration: BoxDecoration(
                          color: ColorsApp.grey,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Container(
                            //     child: CachedNetworkImage(
                            //   height: getHeight(context) * .20,
                            //   width: getWith(context) * .3,
                            //   fit: BoxFit.cover,
                            //   imageUrl: livraison.colis[0].images[0].src,
                            //   imageBuilder: (context, imageProvider) {
                            //     return Container(
                            //       decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.only(
                            //             topLeft: Radius.circular(8),
                            //             bottomLeft: Radius.circular(8)),
                            //         image: DecorationImage(
                            //             image: imageProvider,
                            //             fit: BoxFit.cover,
                            //             colorFilter: ColorFilter.mode(
                            //                 Colors.transparent,
                            //                 BlendMode.colorBurn)),
                            //       ),
                            //     );
                            //   },
                            //   placeholder: (context, url) {
                            //     return Container(
                            //       child: Center(
                            //           child: CircularProgressIndicator(
                            //         color: ColorsApp.second,
                            //       )),
                            //     );
                            //   },
                            //   errorWidget: (context, url, error) {
                            //     return CircleAvatar(
                            //         backgroundColor: ColorsApp.second,
                            //         radius: 50,
                            //         backgroundImage:
                            //             AssetImage('assets/logo/logo.png'));
                            //   },
                            // )),
                            Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: kMarginX, vertical: kMarginY),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Container(
                                    //   child: Text('yLibelle'.tr(),
                                    //       overflow: TextOverflow.ellipsis,
                                    //       style: TextStyle(
                                    //           color: ColorsApp.primary,
                                    //           fontSize: 9)),
                                    // ) ,
                                    Container(
                                      child: Text('Une commande de medicaments',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: ColorsApp.primary,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    Container(
                                        child: Text('yDate'.tr(),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: ColorsApp.primary,
                                                fontSize: 9))),
                                    Container(
                                        child: Text(livraison.date,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: ColorsApp.primary,
                                                fontWeight: FontWeight.w600))),
                                    Container(
                                      child: Text('yPrix'.tr(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: ColorsApp.primary,
                                              fontSize: 9)),
                                    ),
                                    Container(
                                      child: Text(
                                          livraison.montant.toString() + ' XAF',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: ColorsApp.primary,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    Container(
                                      child: Text('status'.tr(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: ColorsApp.primary,
                                              fontSize: 9)),
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
                                              color: ColorsApp.primary,
                                              fontWeight: FontWeight.w600)),
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
                          title: Text('Medicaments'.tr()),
                          actions: [
                            InkWell(
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: ColorsApp.orange),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'close'.tr(),
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
                                  itemCount: livraison.medicaments.length,
                                  itemBuilder: (_ctx, index) =>
                                      Text(livraison.medicaments[index].libelle)
                                  /*  ColisComponentUser(
                                              colis: livraison.medicaments[index]) */
                                  ),
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
