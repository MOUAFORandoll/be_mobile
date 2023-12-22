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

class NewLivraisonView extends StatefulWidget {
  NewLivraisonView({Key? key}) : super(key: key);

  @override
  State<NewLivraisonView> createState() => _NewLivraisonViewState();
}

class _NewLivraisonViewState extends State<NewLivraisonView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LivraisonController>(builder: (_controller) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: AppBackButton(),
            title: Text('Bon de livraison'),
            centerTitle: true,
          ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: kMarginX),
            child: Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                        child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: kMarginY * 1.5,
                      ),
                      child: AppInputNew(
                        controller: _controller.libelle,
                        icon: Icon(Icons.label),
                        label: 'Libelle'.tr,
                        validator: (value) {
                          return Validators.isValidUsername(value!);
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorsApp.grey, width: 1),
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
                          style:
                              TextStyle(color: ColorsApp.primary, fontSize: 12),
                          onChanged: (newValue) {
                            _controller.selectCategory(newValue);
                          },
                          items: actionControl.categoryList.map((value) {
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                    child: Icon(Icons.remove),
                                    onTap: () {
                                      _controller.mamageQte(false);
                                    }),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
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
                                      return Validators.usNumeriqValid(value!);
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
                        builder: (_Ncontroller) => _Ncontroller
                                    .listImgColis.length !=
                                0
                            ? Container(
                                height: kSmHeight * 2,
                                margin: EdgeInsets.only(
                                  top: kMarginY,
                                ),
                                child: ListView.builder(
                                  itemCount: _Ncontroller.listImgColis.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (_ctx, index) =>
                                      // ignore: unnecessary_null_comparison
                                      _Ncontroller.listImgColis[index] != null
                                          ? ImageComp(
                                              file: _Ncontroller
                                                  .listImgColis[index],
                                              index: index)
                                          : Container(),
                                ),
                              )
                            : Container()),
                    Container(
                        margin: EdgeInsets.only(
                          top: kMarginY,
                        ),
                        // decoration: BoxDecoration(color: ColorsApp.grey),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            UploadImage(
                              color: ColorsApp.tird,
                              title: 'Appareil photo',
                              icon: Icons.camera_alt,
                              onTap: () {
                                _controller.getImageAppareil();
                              },
                            ),
                            UploadImage(
                              color: ColorsApp.tird,
                              icon: Icons.photo,
                              title: 'Galerie',
                              onTap: () {
                                _controller.getImageGalerie();
                              },
                            )
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.only(
                        top: kMarginY * 1.5,
                      ),
                      child: AppInputNew(
                        controller: _controller.contactEmetteur,
                        icon: Icon(Icons.phone),
                        label: 'Contact de l\'expediteur'.tr,
                        validator: (value) {
                          return Validators.usPhoneValid(value!);
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
                      margin: EdgeInsets.only(
                        top: kMarginY * 1.5,
                      ),
                      child: TextFormField(
                        controller: _controller.description,
                        onChanged: (String value) {},
                        validator: (value) {
                          return Validators.isValidUsername(value!);
                        },
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          fontFamily: 'Lato',
                        ),
                        maxLines: 10,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorsApp.tird, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorsApp.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorStyle: TextStyle(
                            fontSize: 8,
                            fontFamily: 'Lato',
                          ),
                          labelStyle: TextStyle(
                            color: ColorsApp.primary,
                            fontFamily: 'Lato',
                            // fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                          labelText: 'Une description'.tr,
                          fillColor: ColorsApp.tird,
                          counter: Offstage(),
                          hintText: 'lbdescprod'.tr,
                          alignLabelWithHint: true,
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(
                          vertical: kMarginY * 1.5,
                        ),
                        decoration: BoxDecoration(color: ColorsApp.grey),
                        child: AppButton(
                          size: MainAxisSize.max,
                          bgColor: ColorsApp.second,
                          text: 'Livraisons'.tr,
                          onTap: () async {
                            await _controller.newLivraison();
                          },
                        )),
                  ],
                )))
              ],
            ),
          ));
    });
  }
}
