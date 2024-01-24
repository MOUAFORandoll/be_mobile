// ignore_for_file: must_be_immutable
import 'package:BananaExpress/utils/functions/viewFunctions.dart';
import 'package:BananaExpress/components/Widget/settingComponent.dart';
import 'package:BananaExpress/old/controller/GeneralController.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SettingView extends StatelessWidget {
  ScrollController _scrollController = new ScrollController();

  var controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.google.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://www.google.com/'));
  // final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsApp.bg,
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              backgroundColor: ColorsApp.bg,
              automaticallyImplyLeading: false,
              title: Text(
                'setting'.tr,
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.w600),
              ),
              leading: Container(
                  child: InkWell(
                child: Container(
                  margin: EdgeInsets.zero,
                  // padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(

                      // borderRadius: BorderRadius.circular(20),
                      ),
                  child: Icon(Icons.arrow_back_ios_new,
                      color: ColorsApp.primary, size: 25.0),
                ),
                onTap: () {
                  Get.back();
                },
              )),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                    margin: EdgeInsets.symmetric(vertical: kMarginY * .2),
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: Column(
                      children: [
                        SettingComponent(
                            title: 'Sombre',
                            action: GetBuilder<GeneralController>(
                                builder: (actionControl) => Switch(
                                    value: actionControl.dark,
                                    onChanged: (val) {
                                      actionControl.changeTheme();
                                    })),
                            onTap: () {}),
                        SettingComponent(
                            title: 'Langue de l\'application',
                            action: Container(
                              // width: kWidth * .6,
                              // margin: EdgeInsets.only(
                              //     top: Get.height * .005,
                              //     left: Get.width * .008),
                              height: 1500,
                              child: GetBuilder<GeneralController>(
                                builder: (actionControl) =>
                                    DropdownButton<String>(
                                        value: actionControl.lang.value,
                                        icon: Container(
                                          // padding: EdgeInsets.only(top: 4),
                                          child: Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            color: Color(0xff1A90FF),
                                          ),
                                        ),
                                        iconSize: 25,
                                        underline: SizedBox(),
                                        style: TextStyle(
                                            color: Color(
                                              0xff1A90FF,
                                            ),
                                            fontSize: 20),
                                        onChanged: (newValue) {
                                          actionControl
                                              .updateLanguage(newValue ?? '');
                                        },
                                        items: <String>[
                                          ...actionControl.locale
                                              .map((e) => e['name'])
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Center(
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                  color: Color(0xff1A90FF),
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList()),
                              ),
                            ),
                            onTap: () {}),
                        SettingComponent(
                            title: 'Payer loyer boutique',
                            action: InkWell(
                                child: Icon(Icons.arrow_forward_ios_outlined)),
                            onTap: () {
                              ViewFunctions().showIndisponible();
                              // Get.toNamed(AppLinks.BOUTIQUE_LOYER);
                            }),
                        SettingComponent(
                            title: 'Politique de confidentialite',
                            action: InkWell(
                              child: Icon(Icons.arrow_forward_ios_outlined),
                            ),
                            onTap: () {
                              Get.bottomSheet(
                                Container(
                                    margin: EdgeInsets.only(
                                      top: kMarginY * 6,
                                    ),
                                    decoration: BoxDecoration(
                                        color: ColorsApp.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15))),
                                    height: 800,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: kMarginX,
                                        vertical: kMarginY),
                                    child: Stack(children: [
                                      // WebView(
                                      //   initialUrl: 'www.google.cm',
                                      //   javascriptMode: JavascriptMode.unrestricted,
                                      //   onPageStarted: (String url) {},
                                      //   onPageFinished: (String url) {},
                                      // ),
                                      WebViewWidget(controller: controller),
                                    ])),
                                isScrollControlled: true,
                              );
                              // Get.toNamed(AppLinks.POLITIQUE);
                            }),
                        SettingComponent(
                            title: 'Aide et assistance',
                            action: InkWell(
                              child: Icon(Icons.arrow_forward_ios_outlined),
                            ),
                            onTap: () {
                              ViewFunctions().showIndisponible();
                              // Get.toNamed(AppLinks.HELP);
                            }),
                      ],
                    )),
                childCount: 1,
              ),
            ),
          ],
        ));
  }
}
