import 'package:BananaExpress/components/Button/app_button.dart';
import 'package:BananaExpress/components/Button/customBtn.dart';
import 'package:BananaExpress/components/Button/uploadImage.dart';
import 'package:BananaExpress/components/Widget/app_back_button.dart';
import 'package:BananaExpress/components/Widget/app_input_new.dart';
import 'package:BananaExpress/components/Widget/colisComponent.dart';
import 'package:BananaExpress/controller/GeneralController.dart';
import 'package:BananaExpress/controller/LivraisonController.dart';
import 'package:BananaExpress/model/data/CategoryModel.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:BananaExpress/utils/Services/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:BananaExpress/Views/Livraison/MapPagePointRecuperation.dart';

import '../../components/Widget/app_title_right.dart';

class InfoLIvraison extends StatefulWidget {
  InfoLIvraison({Key? key}) : super(key: key);

  @override
  State<InfoLIvraison> createState() => _InfoLIvraisonState();
}

class _InfoLIvraisonState extends State<InfoLIvraison> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LivraisonController>(builder: (_controller) {
      return Container(
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
                      padding: EdgeInsets.only(
                        top: kMarginY,
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text('Ville')),
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
                        value: _controller.villeSelect,
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
                          _controller.selectVille(newValue);
                        },
                        items: actionControl.villeList.map((value) {
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
                      padding: EdgeInsets.only(
                        top: kMarginY,
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text('Point de livraison')),
                  Container(
                      margin: EdgeInsets.only(
                        top: kMarginY,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          (_controller.longitudeRecuperation == 0.0 &&
                                  _controller.latitudeRecuperation == 0.0)
                              ? Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ColorsApp.grey, width: 1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  height: kHeight * .08,
                                  width: kWidth * .7,
                                  margin: EdgeInsets.only(
                                    top: kMarginY * 1.5,
                                  ),
                                  alignment: Alignment.center,
                                  child: DropdownButton(
                                    value:
                                        _controller.selected_recuperation_point,
                                    hint: Container(
                                      width: kWidth * .6,
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Selectionner un point de recuperation',
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
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
                                      _controller
                                          .selectRecuperationPoint(newValue);
                                    },
                                    items: _controller.list_recuperation_point
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: kMarginY, horizontal: kMarginX),
                                  height: kHeight * .06,
                                  alignment: Alignment.center,
                                  width: kWidth * .7,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: ColorsApp.grey),
                                  child: Text(_controller
                                          .libelleLocalisation.text.isEmpty
                                      ? 'Selectionner'
                                      : _controller.libelleLocalisation.text)),
                          InkWell(
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(90),
                                      color: ColorsApp.grey),
                                  child: Icon(Icons.location_on)),
                              onTap: () {
                                Get.to(MapPagePointRecuperation());
                              }),
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
                        labelText: 'Une description de votre position'.tr,
                        fillColor: ColorsApp.tird,
                        counter: Offstage(),
                        // hintText: 'lbdescprod'.tr,
                        alignLabelWithHint: true,
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              )))
            ],
          ));
    });
  }
}
