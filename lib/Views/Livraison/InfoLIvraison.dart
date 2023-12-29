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
