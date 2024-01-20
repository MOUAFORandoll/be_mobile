import 'package:BananaExpress/Views/User/LoginScreen.dart';
import 'package:BananaExpress/Views/User/RegisterScreen.dart';
import 'package:BananaExpress/controller/GeneralController.dart';
import 'package:BananaExpress/controller/managerController.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:BananaExpress/utils/Services/UniLinkService.dart';
import 'package:cached_network_image/cached_network_image.dart';
//

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  // int _currentIndex = 0;
  // bool _isVisible = true;
  // late ScrollController controller;

  // @override
  void initState() {
    super.initState();
    Get.find<UniLinkService>().initURIHandler();
    Get.find<UniLinkService>().incomingLinkHandler();
    
  }

  // iniit() async {
  //   // await MyBinding().requestPermission();
  //   var status = await Permission.storage.status;
  //   //print("voici le statut************* ,  $status");
  //   if (!status.isGranted) {
  //     await Permission.storage.request();
  //     await getData();
  //   } else {
  //     await getData();
  //   }
  // }

  // getData() async {
  //   // await MyBinding().requestPermission();
  //   var status = await Permission.storage.status;
  //   //print("voici le statut ,  $status");

  //   if (status.isGranted) {
  //     var database = dababase;
  //     await database.init();
  //     await Get.find<GeneralController>().getLanguageInit();

  //     Get.find<ManagerController>().getKeyU();
  //     Get.find<ManagerController>().getUser();

  //     Get.find<ManagerController>().newLocalisation();

  //     Get.find<CommandeController>().getListCommandes();
  //   }
  // }

  // uniLink() async {
  //   /**
  //    *
  //    le lien de parainage est sous cette forme :
  //    * https://BananaExpress-shop.000webhostapp.com/{type}/trgg
  //    *
  //    * type :
  //    *    - produits => pour afficher un produit precis
  //    *    - subscribes => pour inscrire avec un parain
  //    *

  //    */
  //   try {
  //     final uri = await getInitialUri();
  //     if (uri == null) {
  //       print('no initial uri');
  //     } else {
  //       var direction = uri.path.split('/');
  //       var type = direction[1];
  //       print('--${uri}---00-lien----------ici----------------------');
  //       if (type == 'produits') {
  //         var codeProduit = direction[2];

  //         print('----------codeProduit--------${codeProduit}------');
  //         Get.find<LinkController>().getUniLinkProduit(codeProduit);
  //         Get.toNamed(AppLinks.PRODUCT_FOR_LINK);
  //       }
  //       if (type == 'boutiques') {
  //         var codeBoutique = direction[2];

  //         print('----------codeBoutique--------${codeBoutique}------');
  //         Get.find<LinkController>().getUniLinkBoutique(codeBoutique);
  //         Get.toNamed(AppLinks.BOUTIQUE_FOR_LINK);
  //       }

  //       if (type == 'subscribes') {
  //         var codeParrain = direction[2];
  //         print('----------codeParrain--------${codeParrain}------');
  //         Get.find<ManagerController>().setCodeParrain(codeParrain);
  //         Get.bottomSheet(
  //           Container(
  //               margin: EdgeInsets.only(
  //                 top: kMarginY * 8,
  //               ),
  //               decoration: BoxDecoration(
  //                   color: ColorsApp.white,
  //                   borderRadius: BorderRadius.only(
  //                       topLeft: Radius.circular(15),
  //                       topRight: Radius.circular(15))),
  //               height: 800,
  //               padding: EdgeInsets.symmetric(horizontal: kMarginX),
  //               child: Column(children: [
  //                 Container(
  //                   child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         TextButton(
  //                           child: Text('Annuler'),
  //                           onPressed: () {
  //                             Get.back();
  //                           },
  //                         ),
  //                         // TextButton(
  //                         //   child: Text('Ajouter'),
  //                         //   onPressed: () async {
  //                         //     // await _controller.addShort();
  //                         //     // _controller.chageState(!_controller.addProduit);
  //                         //   },
  //                         // )
  //                       ]),
  //                 ),
  //                 Expanded(
  //                     child: SingleChildScrollView(
  //                         child: Column(children: [
  //                   // _controller.listImgProduits.length != 0
  //                   //     ? smallText(
  //                   //         text: 'Listes images',
  //                   //       )
  //                   //     : Container(),

  //                   Container(
  //                       margin: EdgeInsets.only(
  //                         top: 50,
  //                       ),
  //                       child: RegisterScreen())
  //                 ])))
  //               ])),
  //           isScrollControlled: true,
  //         );
  //       }
  //       print('got initial uri: $uri');
  //     }
  //     // var direction = uri!.path!
  //   } on PlatformException {
  //     // Platform messages may fail but we ignore the exception
  //     print('falied to get initial uri');
  //   } on FormatException catch (err) {
  //     print('malformed initial uri');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // uniLink();
    return GetBuilder<GeneralController>(
        builder: (_controller) => Scaffold(
              backgroundColor: ColorsApp.bg,
              drawer: CustomDrawer(),
              body: SafeArea(child: _controller.buildContent()),
              bottomNavigationBar: _controller.buildBorderRadiusDesign(),
            ));
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagerController>(builder: (_controller) {
      return Drawer(
        width: kWidth / 1.35,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _controller.Userget != null
                ? UserAccountsDrawerHeader(
                    accountName: Text(_controller.Userget.nom),
                    accountEmail: Text(_controller.Userget.phone),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: InkWell(
                        onTap: () => _controller.updateImageUser(),
                        child: CachedNetworkImage(
                          height: kHeight / 10,
                          width: kHeight / 10,
                          fit: BoxFit.cover,
                          imageUrl: _controller.Userget.profile,
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                          placeholder: (context, url) {
                            return Container(
                              decoration: BoxDecoration(
                                color: ColorsApp.grey,
                              ),
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: ColorsApp.tird,
                              )),
                            );
                          },
                          errorWidget: (context, url, error) {
                            return CircleAvatar(
                                // backgroundColor: ColorsApp.tird,
                                radius: 50,
                                backgroundImage:
                                    AssetImage("assets/images/user.jpg"));
                          },
                        ),
                      ),
                    ),
                  )
                : Container(
                    margin: EdgeInsets.only(top: kMarginY),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.login),
                          title: Text('Se Connecter'),
                          onTap: () {
                            Get.bottomSheet(
                              Container(
                                  margin: EdgeInsets.only(
                                    top: kMarginY * 8,
                                  ),
                                  decoration: BoxDecoration(
                                      color: ColorsApp.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15))),
                                  height: 800,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: kMarginX),
                                  child: Column(children: [
                                    Container(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(
                                              child: Text('Annuler'),
                                              onPressed: () {
                                                Get.back();
                                              },
                                            ),
                                            // TextButton(
                                            //   child: Text('Ajouter'),
                                            //   onPressed: () async {
                                            //     // await _controller.addShort();
                                            //     // _controller.chageState(!_controller.addProduit);
                                            //   },
                                            // )
                                          ]),
                                    ),
                                    Expanded(
                                        child: SingleChildScrollView(
                                            child: Column(children: [
                                      // _controller.listImgProduits.length != 0
                                      //     ? smallText(
                                      //         text: 'Listes images',
                                      //       )
                                      //     : Container(),

                                      Container(
                                          margin: EdgeInsets.only(
                                            top: 50,
                                          ),
                                          child: LoginScreen())
                                    ])))
                                  ])),
                              isScrollControlled: true,
                            );
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.login),
                          title: Text('S\'inscrire'),
                          onTap: () {
                            Get.bottomSheet(
                              Container(
                                  margin: EdgeInsets.only(
                                    top: kMarginY * 8,
                                  ),
                                  decoration: BoxDecoration(
                                      color: ColorsApp.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15))),
                                  height: 800,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: kMarginX),
                                  child: Column(children: [
                                    Container(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(
                                              child: Text('Annuler'),
                                              onPressed: () {
                                                Get.back();
                                              },
                                            ),
                                            // TextButton(
                                            //   child: Text('Ajouter'),
                                            //   onPressed: () async {
                                            //     // await _controller.addShort();
                                            //     // _controller.chageState(!_controller.addProduit);
                                            //   },
                                            // )
                                          ]),
                                    ),
                                    Expanded(
                                        child: SingleChildScrollView(
                                            child: Column(children: [
                                      // _controller.listImgProduits.length != 0
                                      //     ? smallText(
                                      //         text: 'Listes images',
                                      //       )
                                      //     : Container(),

                                      Container(
                                          margin: EdgeInsets.only(
                                            top: 50,
                                          ),
                                          child: RegisterScreen())
                                    ])))
                                  ])),
                              isScrollControlled: true,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Navigate to the home page or perform an action
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Navigate to the settings page or perform an action
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                // Perform logout logic
                _controller.deconnectUser();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    });
  }
}
