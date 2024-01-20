import 'package:BananaExpress/controller/GeneralController.dart';
import 'package:BananaExpress/model/data/ModePaiementModel.dart';
import 'package:BananaExpress/styles/textStyle.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SelectComponent extends StatelessWidget {
  SelectComponent({required this.select, required this.mode});
  bool select = false;
  ModePaiementModel mode;
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(
        builder: (_Acontroller) => InkWell(
              child: Container(
                  decoration: BoxDecoration(
                      color: select
                          ? ColorsApp.orange.withOpacity(0.3)
                          : ColorsApp.grey,
                      borderRadius: BorderRadius.circular(8)),
                  margin: EdgeInsets.symmetric(vertical: kMarginY),
                  padding: EdgeInsets.symmetric(
                      horizontal: kMarginX, vertical: kMarginY),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    color:
                                        select ? ColorsApp.tird : Colors.white,
                                    border: Border.all(color: ColorsApp.tird),
                                    borderRadius: BorderRadius.circular(8))),
                            Container(
                                margin: EdgeInsets.only(left: kMarginX),
                                child: Text(mode.libelle))
                          ]),
                      Container(
                          height: 30,
                          margin: EdgeInsets.only(left: kMarginX),
                          child: CachedNetworkImage(
                            width: kWidth / 2,
                            height: 30,
                            // fit: BoxFit.cover,
                            imageUrl: mode.img,
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                  ),
                                ),
                              );
                            },
                            placeholder: (context, url) {
                              return Container(
                                child: Center(
                                    child: CircularProgressIndicator(
                                  color: ColorsApp.tird,
                                )),
                              );
                            },
                            errorWidget: (context, url, error) {
                              return Text(mode.libelle);
                            },
                          )),
                    ],
                  )),
              onTap: () {
                _Acontroller.selectMode(mode);
              },
            ));
  }
}
