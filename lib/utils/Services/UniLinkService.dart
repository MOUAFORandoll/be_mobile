import 'dart:async';

import 'package:BananaExpress/Views/User/RegisterScreen.dart';
import 'package:BananaExpress/controller/managerController.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:uni_links/uni_links.dart';
import 'package:flutter/foundation.dart';

bool _initialURILinkHandled = false;

class UniLinkService extends GetxService {
  

  StreamSubscription? _streamSubscription;

  Future<void> initURIHandler() async {
    if (!_initialURILinkHandled) {
      _initialURILinkHandled = true;

      try {
        final initialURI = await getInitialUri();
        // Use the initialURI and warn the user if it is not correct,
        // but keep in mind it could be `null`.
        if (initialURI != null) {
          debugPrint("Initial URI received $initialURI");

        } else {
          debugPrint("Null Initial URI received");
        }
      } on PlatformException {
        // Platform messages may fail, so we use a try/catch PlatformException.
        // Handle exception by warning the user their action did not succeed
        debugPrint("Failed to receive initial uri");
      } on FormatException catch (err) {
        debugPrint('Malformed Initial URI received  ${err}');
      }
    }
  }

  /// Handle incoming links - the ones that the app will receive from the OS
  /// while already started.
  void incomingLinkHandler() {
    if (!kIsWeb) {
      // It will handle app links while the app is already started - be it in
      // the foreground or in the background.
      _streamSubscription = uriLinkStream.listen((Uri? uri) {
        debugPrint('Received URI: $uri');
      }, onError: (Object err) {
        debugPrint('Error occurred: $err');
      });
    }
  }

  uniLink() async {
    /**
     * 
     le lien de parainage est sous cette forme :
     * https://BananaExpress-shop.000webhostapp.com/{type}/trgg
     *
     * type : 
     *    - produits => pour afficher un produit precis 
     *    - subscribes => pour inscrire avec un parain
     * 

     */
    try {
      final uri = await getInitialUri();
      if (uri == null) {
        print('no initial uri');
      } else {
        var direction = uri.path.split('/');
        var type = direction[1];
        print('--${uri}---00-lien----------ici----------------------');
        if (type == 'produits') {
          var codeProduit = direction[2];
        }
        if (type == 'shorts') {
          var codeShort = direction[2];

          print('----------codeShort--------${codeShort}------');
        }
        if (type == 'boutiques') {
          var codeBoutique = direction[2];
        }

        if (type == 'subscribes') {
          var codeParrain = direction[2];
          print('----------codeParrain--------${codeParrain}------');
          Get.find<ManagerController>().setCodeParrain(codeParrain);
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
                padding: EdgeInsets.symmetric(horizontal: kMarginX),
                child: Column(children: [
                  Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        }
        print('got initial uri: $uri');
      }
      // var direction = uri!.path!
    } on PlatformException {
      // Platform messages may fail but we ignore the exception
      print('falied to get initial uri');
    } on FormatException catch (err) {
      print('malformed initial uri  ${err}');
    }
  }
}
