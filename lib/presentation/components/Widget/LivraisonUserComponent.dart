import 'package:BabanaExpress/application/model/exportmodel.dart';
import 'package:BabanaExpress/presentation/components/Widget/colisComponentUser.dart';
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
            : Stack(
                children: [
                  InkWell(
                      child: Container(
                          height: getHeight(context) * .15,
                          margin: EdgeInsets.symmetric(
                              horizontal: kMarginX, vertical: kMarginY),
                          decoration: BoxDecoration(
                              color: ColorsApp.grey,
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    child: CachedNetworkImage(
                                  height: getHeight(context) * .15,
                                  width: getWith(context) * .35,
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
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            bottomLeft: Radius.circular(8)),
                                        image: DecorationImage(
                                          image: AssetImage(Assets.bg_white),
                                          fit: BoxFit.contain,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: getWith(context) * .45,
                                          child: Text(
                                              livraison.libelle.toString(),
                                              maxLines: 2,
                                              // overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: ColorsApp.primary,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                        Container(
                                          child: Text('yPrix'.tr(),
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: ColorsApp.primary,
                                                  fontSize: 9)),
                                        ),
                                        Container(
                                          child: Text(
                                              livraison.montant.toString() +
                                                  ' XAF',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: ColorsApp.primary,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                        // Container(
                                        //     child: Text('yDate'.tr(),
                                        //         overflow: TextOverflow.ellipsis,
                                        //         style: TextStyle(
                                        //             color: ColorsApp.primary,
                                        //             fontSize: 9))),
                                        // Container(
                                        //     child: Text(livraison.date,
                                        //         overflow: TextOverflow.ellipsis,
                                        //         style: TextStyle(
                                        //             color: ColorsApp.primary,
                                        //             fontWeight:
                                        //                 FontWeight.w600))),
                                        Container(
                                          child: Text(
                                              livraison.status == 0
                                                  ? 'En attente de validation'
                                                  : livraison.status == 1
                                                      ? 'En cours de livraison'
                                                      : 'Colis livres',
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
                              title: Text('yColis'.tr()),
                              actions: [
                                InkWell(
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                                color: ColorsApp.white,
                                                weight: 50)
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
                                      itemBuilder: (_ctx, index) =>
                                          ColisComponentUser(
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
