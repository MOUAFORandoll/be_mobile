import 'package:BananaExpress/components/Button/addColis.dart';
import 'package:BananaExpress/components/Button/app_button.dart';
import 'package:BananaExpress/components/Button/customBtn.dart';
import 'package:BananaExpress/components/Button/uploadImage.dart';
import 'package:BananaExpress/components/Widget/app_back_button.dart';
import 'package:BananaExpress/components/Widget/app_input_new.dart';
import 'package:BananaExpress/components/Widget/imageComp.dart';
import 'package:BananaExpress/controller/GeneralController.dart';
import 'package:BananaExpress/controller/LivraisonController.dart';
import 'package:BananaExpress/model/data/CategoryModel.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:BananaExpress/utils/Services/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/Widget/app_title_right.dart';

class InfoColis extends StatefulWidget {
  InfoColis({Key? key}) : super(key: key);

  @override
  State<InfoColis> createState() => _InfoColisState();
}

class _InfoColisState extends State<InfoColis> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LivraisonController>(builder: (_controller) {
      return SingleChildScrollView(
          child: Column(children: [
        Container(
          height: kSmHeight * 2,
          margin: EdgeInsets.only(
            top: kMarginY,
          ),
          child: ListView.builder(
              itemCount: _controller.listColis.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_ctx, index) => ImageComp(
                  file: _controller.listColis[index].listImgColis[0],
                  index: index)),
        ),
        AddColis(
          color: ColorsApp.tird,
          title: 'Colis',
          icon: Icons.collections,
          onTap: () {
            _controller.cleanImage();
            openModalAddColis();
          },
        ),
      ]));
    });
  }
}

openModalAddColis() {
  Get.bottomSheet(
    GetBuilder<LivraisonController>(
        builder: (_controller) => SafeArea(
            minimum: EdgeInsets.only(top: 50),
            child: Container(
                height: kHeight * .9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: ColorsApp.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: kMarginX),
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: kMarginX / 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: kMarginX / 2),
                          child: Row(
                            children: [
                              Text(
                                'alcr'.tr + ' ',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            alignment: Alignment.topRight,
                            margin:
                                EdgeInsets.symmetric(vertical: kMarginX / 2),

                            // padding:
                            //     EdgeInsets.symmetric(horizontal: kMarginX / 2),
                            child: InkWell(
                              onTap: () => Get.back(),
                              child: Icon(
                                Icons.close,
                                // color: ColorsApp.white,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(top: kMarginY),
                          padding:
                              EdgeInsets.symmetric(horizontal: kMarginX / 2),
                          decoration: BoxDecoration(),
                          child: SingleChildScrollView(
                              child: Column(children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: kMarginY * 1.5,
                              ),
                              child: AppInputNew(
                                controller: _controller.nomProduit,
                                icon: Icon(Icons.label),
                                label: 'Nom du colis'.tr,
                                validator: (value) {
                                  return Validators.isValidUsername(value!);
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: kMarginY * 1.5,
                              ),
                              child: AppInputNew(
                                controller: _controller.contactRecepteur,
                                icon: Icon(Icons.phone),
                                label: 'Contact du recepteur'.tr,
                                validator: (value) {
                                  return Validators.usPhoneValid(value!);
                                },
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                  top: kMarginY,
                                ),
                                alignment: Alignment.centerLeft,
                                child: Text('Category de colis')),
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: ColorsApp.grey, width: 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              height: kHeight * .08,
                              width: kWidth,
                              margin: EdgeInsets.only(
                                top: kMarginY * 1.5,
                              ),
                              alignment: Alignment.center,
                              child: GetBuilder<GeneralController>(
                                builder: (actionControl) => DropdownButton(
                                  value: _controller.categorySelect,
                                  icon: Container(
                                    // padding: EdgeInsets.only(top: 4),
                                    child: Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                    ),
                                  ),
                                  iconSize: 25,
                                  underline: SizedBox(),
                                  style: TextStyle(
                                      color: ColorsApp.primary, fontSize: 12),
                                  onChanged: (newValue) {
                                    _controller.selectCategory(newValue);
                                  },
                                  items:
                                      actionControl.categoryList.map((value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Center(
                                        child: Text(
                                          value.libelle,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: kMarginY * 1.5,
                              ),
                              child: AppInputNew(
                                textInputType: TextInputType.number,
                                controller: _controller.valeurColis,
                                icon: Icon(Icons.monetization_on),
                                label: 'Valeur du Colis'.tr,
                                validator: (value) {
                                  return Validators.usNumeriqValid(value!);
                                },
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                  top: kMarginY,
                                ),
                                alignment: Alignment.centerLeft,
                                child: Text('Quantite')),
                            Container(
                                margin: EdgeInsets.only(
                                  top: kMarginY,
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: kMarginY, horizontal: kMarginX),
                                height: kHeight * .06,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: ColorsApp.grey),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                            child: Icon(Icons.remove),
                                            onTap: () {
                                              _controller.mamageQte(false);
                                            }),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: ColorsApp.grey),
                                          width: kMdWidth / 2,
                                          // height: 35,
                                          // alignment: Alignment.center,
                                          child: AppInputNew(
                                            controller: _controller.quantite,
                                            label: '',
                                            // border: true,
                                            alignStart: false,
                                            textInputType: TextInputType.number,
                                            validator: (value) {
                                              return Validators.usNumeriqValid(
                                                  value!);
                                            },
                                          ),
                                        ),
                                        InkWell(
                                            child: Icon(Icons.add),
                                            onTap: () {
                                              _controller.mamageQte(true);
                                            })
                                      ],
                                    )
                                  ],
                                )),
                            GetBuilder<LivraisonController>(
                                builder: (_Ncontroller) => Container(
                                      height:
                                          _Ncontroller.imageColis.length == 0
                                              ? 0
                                              : kSmHeight * 2,
                                      margin: EdgeInsets.only(
                                        top: kMarginY,
                                      ),
                                      child: ListView.builder(
                                        itemCount:
                                            _Ncontroller.imageColis.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (_ctx, index) =>
                                            // ignore: unnecessary_null_comparison
                                            _Ncontroller.imageColis[index] !=
                                                    null
                                                ? ImageComp(
                                                    file: _Ncontroller
                                                        .imageColis[index],
                                                    index: index)
                                                : Container(),
                                      ),
                                    )),
                            Container(

                                // decoration: BoxDecoration(color: ColorsApp.grey),
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                UploadImage(
                                  color: ColorsApp.tird,
                                  title: 'Appareil photo',
                                  icon: Icons.camera_alt,
                                  onTap: () {
                                    _controller.getImageColisAppareil();
                                  },
                                ),
                                UploadImage(
                                  color: ColorsApp.tird,
                                  icon: Icons.photo,
                                  title: 'Galerie',
                                  onTap: () {
                                    _controller.getImageColisGalerie();
                                  },
                                )
                              ],
                            )),
                          ])))),
                  AppButton(
                      size: MainAxisSize.max,
                      bgColor: ColorsApp.primary,
                      text: 'Ajouter'.tr,
                      onTap: () async {
                        _controller.addColis();
                      }),
                ])))),
    isScrollControlled:
        true, // Set to true if you want the bottom sheet to be scrollable
    barrierColor: ColorsApp.primary.withOpacity(.5), // Change the overlay color
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
    ), // Customize the shape of the bottom sheet
    backgroundColor: Colors.transparent,
  );
}
