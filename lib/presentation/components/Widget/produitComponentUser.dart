import 'package:BabanaExpress/application/model/exportmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'package:BabanaExpress/application/export_bloc.dart';

// ignore: must_be_immutable
class ProduitComponentUser extends StatelessWidget {
  ProduitModel produit;

  ProduitComponentUser({
    required this.produit,
  });
  GlobalKey globalKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LivraisonBloc, LivraisonState>(
      builder: (context, state) => InkWell(
        onTap: () => onOpenColis(context),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: ColorsApp.primary.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(-1, 0),
              ),
            ],
          ),
          child: Stack(
            children: [
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          child: CachedNetworkImage(
                        height: getHeight(context) * .15,
                        fit: BoxFit.cover,
                        imageUrl: produit.images[0].src,
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
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
                            child: Shimmer.fromColors(
                                baseColor: ColorsApp.greyNew,
                                highlightColor:
                                    ColorsApp.primary.withOpacity(.1),
                                child: Container(
                                  // height: getHeight(context) / 10,
                                  // width: getHeight(context) / 10,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
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
                                  image: DecorationImage(
                                      image: AssetImage('assets/login.png'))));
                        },
                      )),
                      Container(
                        padding: EdgeInsets.only(top: 3),
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: ColorsApp.greyNew, width: .5))),
                        alignment: Alignment.center,
                        width: getWith(context) / 2,
                        child: Text(
                          produit.titre,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onOpenColis(context) => showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => Container(
          decoration: BoxDecoration(
              color: ColorsApp.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          height: getHeight(context) * .4,
          child: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: ColorsApp.white,
                      border: Border(
                          bottom: BorderSide(
                        color: ColorsApp.greyNew,
                      ))),
                  margin: EdgeInsets.symmetric(vertical: kMarginY / 2),
                  padding: EdgeInsets.symmetric(
                      vertical: kMarginY / 2,
                      horizontal: getWith(context) * .07),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(child: Text('Colis'.tr())),
                        InkWell(
                            child: Container(child: Icon(Icons.close)),
                            onTap: () => AutoRouter.of(context).pop())
                      ])),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: getWith(context) * .07),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: CachedNetworkImage(
                          height: getHeight(context) * .20,
                          width: getWith(context) * .4,
                          fit: BoxFit.cover,
                          imageUrl: produit.images[0].src,
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: ColorsApp.primary.withOpacity(.1),
                                ),
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
                                  highlightColor:
                                      ColorsApp.primary.withOpacity(.1),
                                  child: Container(
                                    // height: getHeight(context) / 10,
                                    // width: getHeight(context) / 10,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
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
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                        image:
                                            AssetImage('assets/login.png'))));
                          },
                        ),
                      ),
                    ]),
              ),
            ],
          ))));

  Future<void> requestPermission() async {
    PermissionStatus status = await Permission.storage.request();
    if (status == PermissionStatus.granted) {
      print('accepte');
    } else {
      print('refuse');
    }
  }
}
