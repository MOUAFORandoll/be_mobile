import 'package:BananaExpress/old/components/Button/app_button.dart';
import 'package:BananaExpress/old/components/Widget/ScanReception.dart';
import 'package:BananaExpress/old/components/Widget/ScanRecuperation.dart';
import 'package:BananaExpress/old/model/data/LivraisonModel.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:BananaExpress/old/controller/LivraisonController.dart';
import 'package:BananaExpress/styles/colorApp.dart';

// ignore: must_be_immutable
class ColisComponentBabana extends StatelessWidget {
  ColisUser colis;
  int idLivraison;

  ColisComponentBabana({
    required this.colis,
    required this.idLivraison,
  });
  GlobalKey globalKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LivraisonController>(
      builder: (_controller) => InkWell(
        onTap: () => onOpenColis(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2), // changes position of shadow
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
                        imageUrl: colis.images[0].src,
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
                        margin: EdgeInsets.only(left: 5),
                        alignment: Alignment.centerLeft,
                        width: getWith(context) / 2,
                        child: Text(
                          colis.nom,
                          textAlign: TextAlign.start,
                          style: TextStyle(overflow: TextOverflow.ellipsis),
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

  onOpenColis() => Get.bottomSheet(Container(
      decoration: BoxDecoration(
          color: ColorsApp.grey,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      padding: EdgeInsets.symmetric(horizontal: getWith(Get.context) * .07),
      height: 800,
      child: SingleChildScrollView(
          child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
            Container(
              height: getHeight(Get.context) * .20,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: colis.images.length,
                itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: CachedNetworkImage(
                      height: getHeight(Get.context) * .15,
                      width: getWith(Get.context) * .3,
                      fit: BoxFit.cover,
                      imageUrl: colis.images[index].src,
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
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
              ),
            ),
            Column(
              children: [
                if (colis.statusLivraisonColis == 1)
                  Container(
                      margin: EdgeInsets.symmetric(
                        vertical: kMarginY * 1.5,
                      ),
                      decoration: BoxDecoration(color: ColorsApp.grey),
                      child: AppButton(
                        size: MainAxisSize.max,
                        bgColor: ColorsApp.second,
                        text: 'Scan de l\'expediteur'.tr,
                        onTap: () async {
                          Get.to(ScanRecuperation(
                            idLivraison: idLivraison,
                          ));
                        },
                      )),
                if (colis.statusLivraisonColis == 2)
                  Container(
                      margin: EdgeInsets.symmetric(
                        vertical: kMarginY * 1.5,
                      ),
                      decoration: BoxDecoration(color: ColorsApp.grey),
                      child: AppButton(
                        size: MainAxisSize.max,
                        bgColor: ColorsApp.primary,
                        text: 'Scan du recepteur'.tr,
                        onTap: () async {
                          Get.to(ScanReception(
                            idLivraison: idLivraison,
                          ));
                        },
                      )),
                if (colis.statusLivraisonColis == 3)
                  Container(
                      margin: EdgeInsets.symmetric(
                        vertical: kMarginY * 1.5,
                      ),
                      decoration: BoxDecoration(color: ColorsApp.grey),
                      child: Text('Livraison de ce colis effectue')),
              ],
            )
          ]))));
}
