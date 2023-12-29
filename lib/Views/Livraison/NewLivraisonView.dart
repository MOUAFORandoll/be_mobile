import 'package:BananaExpress/Views/Livraison/InfoColis.dart';
import 'package:BananaExpress/Views/Livraison/InfoLIvraison.dart';
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
              height: kHeight,
              margin: EdgeInsets.symmetric(
                  horizontal: kMarginX, vertical: kMarginY),
              child: Column(
                children: [
                  Expanded(
                    child:
                        _controller.state == 0 ? InfoLIvraison() : InfoColis(),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(
                        vertical: kMarginY * 1.5,
                        horizontal: kMarginX / 2,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppButton(
                                size: MainAxisSize.max,
                                bgColor: _controller.state == 0
                                    ? ColorsApp.grey
                                    : ColorsApp.primary,
                                text: 'Back'.tr,
                                onTap: () async {
                                  await _controller.changeState(0);
                                }),
                            AppButton(
                              size: MainAxisSize.max,
                              bgColor: ColorsApp.primary,
                              text: _controller.state == 0
                                  ? 'Next'.tr
                                  : "Evaluer".tr,
                              onTap: () async {
                                _controller.state == 0
                                    ? await _controller.changeState(1)
                                    : await _controller
                                        .newLivraison(); //   .calculFraisDeLivraison();
                              },
                            ),
                          ])),
                ],
              )));
    });
  }
}
