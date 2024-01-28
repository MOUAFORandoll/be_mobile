import 'package:BananaExpress/old/Views/Livraison/InfoColis.dart';
import 'package:BananaExpress/old/Views/Livraison/InfoLIvraison.dart';
import 'package:BananaExpress/old/components/Button/app_button.dart';
import 'package:BananaExpress/old/components/Widget/app_back_button.dart';
import 'package:BananaExpress/old/controller/LivraisonController.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              height: getHeight(context),
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
                                        .calculFraisDeLivraison();
                              },
                            ),
                          ])),
                ],
              )));
    });
  }
}
