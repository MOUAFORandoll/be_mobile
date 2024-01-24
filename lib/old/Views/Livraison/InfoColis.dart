import 'package:BananaExpress/old/Views/Livraison/MapPagePointLivraisonColis.dart';
import 'package:BananaExpress/components/Button/addColis.dart';
import 'package:BananaExpress/components/Button/app_button.dart';
import 'package:BananaExpress/components/Button/uploadImage.dart';
import 'package:BananaExpress/components/Widget/app_input_new.dart';
import 'package:BananaExpress/components/Widget/colisComponent.dart';
import 'package:BananaExpress/components/Widget/imageComp.dart';
import 'package:BananaExpress/old/controller/GeneralController.dart';
import 'package:BananaExpress/old/controller/LivraisonController.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:BananaExpress/utils/Services/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        SizedBox(
            height: _controller.listColis.length == 0 ? 0 : kHeight * .65,
            child: Stack(children: [
              GridView.builder(
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 20,
                      mainAxisExtent: 150,
                      mainAxisSpacing: 20.0),
                  itemCount: _controller.listColis.length,
                  itemBuilder: (_ctx, index) =>
                      ColisComponent(colis: _controller.listColis[index])),
            ])),
        AddColis(
          color: ColorsApp.tird,
          title: 'Colis',
          icon: Icons.collections,
          onTap: () {
            _controller.cleanImage();
            _controller.resetPointLivraison();
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
        builder: (_controller) => Form(
            key: _controller.formKeyColis,
            child: SafeArea(
                minimum: EdgeInsets.only(top: 50),
                child: Container(
                    height: kHeight * .9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
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
                              margin:
                                  EdgeInsets.symmetric(vertical: kMarginX / 2),
                              child: Row(
                                children: [
                                  Text(
                                    'Informations de votre colis'.tr + ' ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                alignment: Alignment.topRight,
                                margin: EdgeInsets.symmetric(
                                    vertical: kMarginX / 2),

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
                              padding: EdgeInsets.symmetric(
                                  horizontal: kMarginX / 2),
                              decoration: BoxDecoration(),
                              child: SingleChildScrollView(
                                  child: Column(children: [
                                Container(
                                    padding: EdgeInsets.only(
                                      top: kMarginY,
                                    ),
                                    alignment: Alignment.centerLeft,
                                    child: Text('Category de colis')),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: (!_controller.isCategory)
                                            ? ColorsApp.second
                                            : ColorsApp.grey,
                                        width: 1),
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
                                          color: ColorsApp.primary,
                                          fontSize: 12),
                                      onChanged: (newValue) {
                                        _controller.selectCategory(newValue);
                                        _controller.verifyFormColis();
                                      },
                                      items: actionControl.categoryList
                                          .map((value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Center(
                                            child: Text(
                                              value.libelle!,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                if (!_controller.isCategory)
                                  Container(
                                      padding: EdgeInsets.only(
                                        top: kMarginY,
                                      ),
                                      margin: EdgeInsets.only(
                                        left: 10,
                                      ),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Veuillez selectionner une Categorie',
                                        style: TextStyle(
                                            fontSize: 8,
                                            fontFamily: 'Lato',
                                            color: ColorsApp.second),
                                      )),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: kMarginY * 1.5,
                                  ),
                                  child: AppInputNew(
                                    controller: _controller.nomProduit,
                                    icon: Icon(Icons.label),
                                    onChanged: (newValue) {
                                      _controller.verifyFormColis();
                                    },
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
                                    child: Text('Point de livraison')),
                                GetBuilder<LivraisonController>(
                                    builder: (_controllerE) => Container(
                                        margin: EdgeInsets.only(
                                          top: kMarginY,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            (_controllerE.longitudeColis ==
                                                        0.0 &&
                                                    _controllerE
                                                            .latitudeColis ==
                                                        0.0)
                                                ? Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: (!_controller
                                                                  .isPointLivraison)
                                                              ? ColorsApp.second
                                                              : ColorsApp.grey,
                                                          width: 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    height: kHeight * .08,
                                                    width: kWidth * .7,
                                                    margin: EdgeInsets.only(
                                                      top: kMarginY * 1.5,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: DropdownButton(
                                                      value: _controllerE
                                                          .selected_livraison_point,
                                                      hint: Container(
                                                        width: kWidth * .6,
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          'Selectionner un point de livraison',
                                                          style: TextStyle(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis),
                                                        ),
                                                      ),
                                                      icon: Container(
                                                        // padding: EdgeInsets.only(top: 4),
                                                        child: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_outlined,
                                                        ),
                                                      ),
                                                      iconSize: 25,
                                                      underline: SizedBox(),
                                                      style: TextStyle(
                                                          color:
                                                              ColorsApp.primary,
                                                          fontSize: 12),
                                                      onChanged: (newValue) {
                                                        _controllerE
                                                            .selectPoint(
                                                                newValue);
                                                        _controller
                                                            .verifyFormColis();
                                                      },
                                                      items: _controllerE
                                                          .livraison_point
                                                          .map((value) {
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
                                                  )
                                                : Container(
                                                    padding: EdgeInsets
                                                        .symmetric(
                                                            vertical: kMarginY,
                                                            horizontal:
                                                                kMarginX),
                                                    height: kHeight * .06,
                                                    alignment: Alignment.center,
                                                    width: kWidth * .7,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: ColorsApp.grey),
                                                    child: Text(_controllerE
                                                            .libelleLocalisationColis
                                                            .text
                                                            .isEmpty
                                                        ? 'Selectionner'
                                                        : _controllerE
                                                            .libelleLocalisationColis
                                                            .text)),
                                            InkWell(
                                                child: Container(
                                                    padding: EdgeInsets.all(10),
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(90),
                                                        color: ColorsApp.grey),
                                                    child: Icon(
                                                        Icons.location_on)),
                                                onTap: () {
                                                  Get.to(
                                                      MapPagePointLivraisonColis());
                                                }),
                                          ],
                                        ))),
                                if (!_controller.isCategory)
                                  Container(
                                      padding: EdgeInsets.only(
                                        top: kMarginY,
                                      ),
                                      margin: EdgeInsets.only(
                                        left: 10,
                                      ),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Veuillez selectionner un point de livraison',
                                        style: TextStyle(
                                            fontSize: 8,
                                            fontFamily: 'Lato',
                                            color: ColorsApp.second),
                                      )),
                                Container(

                                    // decoration: BoxDecoration(color: ColorsApp.grey),
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                top: kMarginY * 1.5,
                                              ),
                                              // height: 150,
                                              width: kWidth / 2.5,
                                              child: AppInputNew(
                                                textInputType:
                                                    TextInputType.number,
                                                controller:
                                                    _controller.valeurColis,
                                                icon:
                                                    Icon(Icons.monetization_on),
                                                onChanged: (newValue) {
                                                  _controller.verifyFormColis();
                                                },
                                                label: 'Valeur du Colis'.tr,
                                                validator: (value) {
                                                  return Validators
                                                      .usNumeriqValid(value!);
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
                                                    vertical: kMarginY,
                                                    horizontal: kMarginX),
                                                height: kHeight * .06,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: (!_controller
                                                                .isQte)
                                                            ? ColorsApp.second
                                                            : ColorsApp.grey,
                                                        width: 1),
                                                    color: ColorsApp.grey),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        InkWell(
                                                            child: Icon(
                                                                Icons.remove),
                                                            onTap: () {
                                                              _controller
                                                                  .mamageQte(
                                                                      false);
                                                            }),
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                              color: ColorsApp
                                                                  .grey),
                                                          width: kWidth / 2,
                                                          // height: 35,
                                                          // alignment: Alignment.center,
                                                          margin:
                                                              EdgeInsets.only(
                                                            bottom: kMarginY,
                                                          ),
                                                          child: AppInputNew(
                                                            controller:
                                                                _controller
                                                                    .quantite,
                                                            label: '',
                                                            // border: true,
                                                            alignStart: false,
                                                            textInputType:
                                                                TextInputType
                                                                    .number,
                                                            validator: (value) {
                                                              return Validators
                                                                  .usNumeriqValid(
                                                                      value!);
                                                            },
                                                          ),
                                                        ),
                                                        InkWell(
                                                            child:
                                                                Icon(Icons.add),
                                                            onTap: () {
                                                              _controller
                                                                  .mamageQte(
                                                                      true);
                                                            })
                                                      ],
                                                    )
                                                  ],
                                                )),
                                            if (!_controller.isQte)
                                              Container(
                                                  padding: EdgeInsets.only(
                                                    top: kMarginY,
                                                  ),
                                                  margin: EdgeInsets.only(
                                                    left: 10,
                                                  ),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    'Veuillez entrer une quantite',
                                                    style: TextStyle(
                                                        fontSize: 8,
                                                        fontFamily: 'Lato',
                                                        color:
                                                            ColorsApp.second),
                                                  )),
                                          ]),
                                    ),
                                    Container(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                          GetBuilder<LivraisonController>(
                                              builder: (_Ncontroller) =>
                                                  InkWell(
                                                    child: _Ncontroller
                                                                .imageColis
                                                                .length !=
                                                            0
                                                        ? Container(
                                                            height: kHeight * 2,
                                                            margin:
                                                                EdgeInsets.only(
                                                              top: kMarginY,
                                                            ),
                                                            child: ImageComp(
                                                                file: _Ncontroller
                                                                        .imageColis[
                                                                    0],
                                                                index: 0))
                                                        : UploadImage(
                                                            color:
                                                                ColorsApp.tird,
                                                            title:
                                                                'Appareil photo',
                                                            icon: Icons
                                                                .camera_alt),
                                                    onTap: () =>
                                                        Get.bottomSheet(
                                                      Container(
                                                          height: kHeight * .4,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      kMarginX),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(10),
                                                            ),
                                                            color:
                                                                ColorsApp.white,
                                                          ),
                                                          child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .topRight,
                                                                    margin: EdgeInsets.symmetric(
                                                                        vertical:
                                                                            kMarginY *
                                                                                2),
                                                                    // padding: EdgeInsets.symmetric(
                                                                    //     horizontal: kMarginX / 2),
                                                                    child:
                                                                        InkWell(
                                                                      onTap: () =>
                                                                          Get.back(),
                                                                      child: Icon(
                                                                          Icons
                                                                              .close),
                                                                    )),
                                                                Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    margin: EdgeInsets.symmetric(
                                                                        vertical:
                                                                            kMarginY),
                                                                    child: Text(
                                                                      'selectsize'
                                                                          .tr,
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.w500
                                                                          // color: AppColors.secondarytext,
                                                                          ),
                                                                    )),
                                                                Container(
                                                                    child:
                                                                        Column(
                                                                  // mainAxisSize: MainAxisSize.max,
                                                                  children: [
                                                                    Container(
                                                                      margin: EdgeInsets.only(
                                                                          bottom:
                                                                              8),
                                                                      child:
                                                                          AppButton(
                                                                        text: 'Camera'
                                                                            .tr,
                                                                        // width: kWidth / 2.5,
                                                                        size: MainAxisSize
                                                                            .max,
                                                                        // bgColor: AppColors.primaryGreen,
                                                                        onTap: () =>
                                                                            _controller.getImageColisAppareil(),
                                                                      ),
                                                                    ),
                                                                    AppButton(
                                                                        text: 'Galerie'
                                                                            .tr,
                                                                        // width: kWidth / 2.5,
                                                                        size: MainAxisSize
                                                                            .max,
                                                                        // bgColor: AppColors.secondarytext,
                                                                        onTap: () =>
                                                                            _controller.getImageColisGalerie()),
                                                                  ],
                                                                ))
                                                              ])),
                                                      isScrollControlled: true,
                                                      barrierColor:
                                                          ColorsApp.primary,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.vertical(
                                                                top: Radius
                                                                    .circular(
                                                                        16)),
                                                      ),
                                                      backgroundColor:
                                                          Colors.transparent,
                                                    ),
                                                    /*  Get.dialog(ModalDialogImage()), */
                                                  )),
                                          if (!_controller.isImage)
                                            Container(
                                                padding: EdgeInsets.only(
                                                  top: kMarginY,
                                                ),
                                                margin: EdgeInsets.only(
                                                  left: 10,
                                                ),
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Veuillez selectionner une image',
                                                  style: TextStyle(
                                                      fontSize: 8,
                                                      fontFamily: 'Lato',
                                                      color: ColorsApp.second),
                                                ))
                                        ])), // UploadImage(
                                    //   color: ColorsApp.tird,
                                    //   title: 'Appareil photo',
                                    //   icon: Icons.camera_alt,
                                    //   onTap: () {
                                    //     _controller.getImageColisAppareil();
                                    //   },
                                    // ),
                                    // UploadImage(
                                    //   color: ColorsApp.tird,
                                    //   icon: Icons.photo,
                                    //   title: 'Galerie',
                                    //   onTap: () {
                                    //     _controller.getImageColisGalerie();
                                    //   },
                                    // )
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
                    ]))))),
    isScrollControlled:
        true, // Set to true if you want the bottom sheet to be scrollable
    barrierColor: ColorsApp.primary.withOpacity(.5), // Change the overlay color
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
    ), // Customize the shape of the bottom sheet
    backgroundColor: Colors.transparent,
  );
}
