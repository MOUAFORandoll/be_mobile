// ignore: must_be_immutable
import 'dart:io';
import 'dart:typed_data';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:io';
import 'package:flutter/rendering.dart';

import 'package:BananaExpress/components/Button/app_button_icon.dart';
import 'package:BananaExpress/model/data/LivraisonModel.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path/path.dart' as path;
import 'package:image_gallery_saver/image_gallery_saver.dart';

// ignore: must_be_immutable
class LivraisonUserComponent extends StatelessWidget {
  LivraisonModel livraison;

  LivraisonUserComponent({required this.livraison});
  GlobalKey globalKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    // titre.text = livraison.titre;
    // quantite.text = livraison.quantite.toString();
    // prix.text = livraison.prix.toString();
    // description.text = livraison.description;
    return Stack(
      children: [
        InkWell(
          child: Container(
              height: kHeight * .17,
              // width: kMdWidth,
              margin: EdgeInsets.symmetric(
                  horizontal: kMarginX, vertical: kMarginY),
              decoration: BoxDecoration(
                  color: ColorsApp.grey,
                  borderRadius: BorderRadius.circular(8)),
              child: /* SingleChildScrollView(
              child: */
                  Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Container(
                        child: CachedNetworkImage(
                      height: kHeight * .17,
                      width: kWidth * .3,
                      fit: BoxFit.cover,
                      imageUrl: livraison.fichier[0].src,
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8)),
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.transparent, BlendMode.colorBurn)),
                          ),
                        );
                      },
                      placeholder: (context, url) {
                        return Container(
                          child: Center(
                              child: CircularProgressIndicator(
                            color: ColorsApp.second,
                          )),
                        );
                      },
                      errorWidget: (context, url, error) {
                        return CircleAvatar(
                            backgroundColor: ColorsApp.second,
                            radius: 50,
                            backgroundImage:
                                AssetImage("assets/logo/logoNew.png"));
                      },
                    )),
                    Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: kMarginX, vertical: kMarginY),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                  'Libelle : ' +
                                      livraison.libelle.toString() +
                                      ' XAF',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: ColorsApp.primary,
                                  )),
                            ),
                            Container(
                              child: Text(
                                  'Valeur : ' +
                                      livraison.valeur.toString() +
                                      ' XAF',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: ColorsApp.primary,
                                  )),
                            ),
                            Container(
                              child: Text(
                                  'Prix Final: ' +
                                      livraison.montant.toString() +
                                      ' XAF',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: ColorsApp.primary,
                                  )),
                            ),
                            Container(
                              child: Text(
                                  'Quantite : ' + livraison.quantite.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: ColorsApp.primary,
                                  )),
                            ),
                            // Container(
                            //   child: Text('Code : ' + livraison.codelivraison,
                            //       overflow: TextOverflow.ellipsis,
                            //       style: TextStyle(
                            //         color: ColorsApp.primary,
                            //       )),
                            // ),
                            Container(
                                child: Text('Date : ' + livraison.date,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: ColorsApp.primary,
                                    ))),
                            Container(
                              child: Text(
                                  'Status : ' + livraison.status.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: ColorsApp.primary,
                                  )),
                            ),
                            // Container(
                            //   // width: kSmWidth * .6,
                            //   child: Text('XAF ' + livraison.prix.toString(),
                            //       overflow: TextOverflow.ellipsis,
                            //       style: TextStyle(
                            //           decoration: TextDecoration.lineThrough,
                            //           decorationColor:  ColorsApp.black,
                            //           decorationThickness: 2.85,
                            //           color:  ColorsApp.black,
                            //            ,
                            //        )),
                            // )
                          ],
                        )),
                  ]) /* ) */),
          onTap: () {
            Get.bottomSheet(Container(
                decoration: BoxDecoration(
                    color: ColorsApp.grey,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                padding: EdgeInsets.symmetric(horizontal: kSmWidth * .07),
                height: 800,
                child: SingleChildScrollView(
                    child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                      Container(
                        height: kHeight * .20,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: livraison.fichier.length,
                          itemBuilder: (context, index) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              child: CachedNetworkImage(
                                height: kHeight * .15,
                                width: kWidth * .3,
                                fit: BoxFit.cover,
                                imageUrl: livraison.fichier[index].src,
                                imageBuilder: (context, imageProvider) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                          colorFilter: ColorFilter.mode(
                                              Colors.transparent,
                                              BlendMode.colorBurn)),
                                    ),
                                  );
                                },
                                placeholder: (context, url) {
                                  return Container(
                                    child: Center(
                                        child: CircularProgressIndicator(
                                      color: ColorsApp.second,
                                    )),
                                  );
                                },
                                errorWidget: (context, url, error) {
                                  return CircleAvatar(
                                      backgroundColor: ColorsApp.second,
                                      radius: 50,
                                      backgroundImage: AssetImage(
                                          "assets/logo/logoNew.png"));
                                },
                              )),
                        ),
                      ),
                      if (livraison.status == 0)
                        Text('Livraison en attente de validation'),
                      if (livraison.status == 1)
                        QrImageView(
                          data: livraison.code_recuperation,
                          version: QrVersions.auto,
                          gapless: true,
                          embeddedImage: AssetImage("assets/logo/logoNew.png"),
                          // embeddedImageStyle:
                          //     QrEmbeddedImageStyle(size: Size(20, 20)),
                          size: 200.0,
                        ),
                      Container(
                        height: 0,
                        child: RepaintBoundary(
                          key: globalKey,
                          child: QrImageView(
                            data: livraison.code_reception,
                            version: QrVersions.auto,
                            embeddedImage:
                                AssetImage("assets/logo/logoNew.png"),
                            // embeddedImageStyle:
                            //     QrEmbeddedImageStyle(size: Size(20, 20)),
                            size: 200.0,
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(
                            vertical: kMarginY * 1.5,
                          ),
                          decoration: BoxDecoration(color: ColorsApp.grey),
                          child: AppButtonIcon(
                              icon: Icons.switch_access_shortcut_add_outlined,
                              bgColor: ColorsApp.second,
                              text: 'Partager le code de recuperation '.tr,
                              onTap: () async => _captureAndSavePng())),
                      if (livraison.status == 3) Text('Livraison termine')
                    ]))));
          },
        ),
        // Positioned(
        //     left: Get.width 8,
        //     top: Get.height * .02,
        //     child: InkWell(
        //         child: Icon(Icons.close, color: Colors.white),
        //         onTap: () async {
        //           var data = {
        //             'idProduit': produit.id,
        //           };
        //           await _controller.deletteProduit(data);
        //         }))
      ],
    );
  }

// ...

  Future<void> requestPermission() async {
    PermissionStatus status = await Permission.storage.request();
    if (status == PermissionStatus.granted) {
      print('accepte');
    } else {
      print('refuse');
    }
  }

  bool dirExists = false;
  Future<void> _captureAndSavePng() async {
    try {
      await requestPermission();

      final directory = await getTemporaryDirectory();
      print('----------path-----${directory.path}-');
      final externalDir = path.join(directory.path, 'Download', 'Qr_code');
      final filePath = path.join(externalDir, 'image.png');

      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 3.0);

      //Drawing White Background because Qr Code is Black
      final whitePaint = Paint()..color = Colors.white;
      final recorder = PictureRecorder();
      final canvas = Canvas(recorder,
          Rect.fromLTWH(0, 0, image.width.toDouble()*1.5, image.height.toDouble() * 1.5));
      canvas.drawRect(
          Rect.fromLTWH(0, 0, image.width.toDouble() * 1.5, image.height.toDouble() * 1.5),
          whitePaint);
      canvas.drawImage(image, Offset.zero, Paint());
      final picture = recorder.endRecording();
      final img = await picture.toImage(image.width, image.height);
      ByteData? byteData = await img.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      //Check for duplicate file name to avoid Override
      String fileName = 'qr_code';
      int i = 1;
      while (await File('$externalDir/$fileName.png').exists()) {
        fileName = 'qr_code_$i';
        i++;
      }

      dirExists = await File(externalDir).exists();
      //if not then create the path
      if (!dirExists) {
        print('...........');

        await Directory(externalDir).create(recursive: true);
        dirExists = true;
      }

      final file = await File('$externalDir/$fileName.png').create();
      await file.writeAsBytes(pngBytes);
      final fileX = await XFile(file.path);
      await Share.shareXFiles([fileX],
          text:
              'Voir votre code de receptin colis : ${livraison.code_reception}');
      print('save');
    } catch (e) {
      print('error--------${e}');
    }
  }
}
