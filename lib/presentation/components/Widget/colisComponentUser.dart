import 'dart:io';

import 'package:BananaExpress/application/model/exportmodel.dart';
import 'package:BananaExpress/presentation/components/Button/app_button_icon.dart';

import 'package:BananaExpress/styles/textStyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'dart:typed_data';
import 'dart:async';
import 'dart:ui';
import 'package:flutter/rendering.dart';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path/path.dart' as path;
import 'package:BananaExpress/application/export_bloc.dart';

// ignore: must_be_immutable
class ColisComponentUser extends StatelessWidget {
  ColisUser colis;

  ColisComponentUser({
    required this.colis,
  });
  GlobalKey globalKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LivraisonBloc, LivraisonState>(
      builder: (context, state) => InkWell(
        onTap: () => onOpenColis(context),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Stack(
            children: [
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          child: CachedNetworkImage(
                        height: getHeight(context) * .15,
                        fit: BoxFit.cover,
                        imageUrl: colis.images[0].src,
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
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
                                  AssetImage("assets/logo/logo.png"));
                        },
                      )),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        alignment: Alignment.centerLeft,
                        width: getWith(context) / 2,
                        child: Text(
                          colis.nom,
                          textAlign: TextAlign.start,
                          style: TextStyle(overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onOpenColis(context) => showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => Container(
          decoration: BoxDecoration(
              color: ColorsApp.grey,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          padding: EdgeInsets.symmetric(horizontal: getWith(context) * .07),
          height: 800,
          child: SingleChildScrollView(
              child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                Container(
                  height: getHeight(context) * .20,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: colis.images.length,
                    itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: CachedNetworkImage(
                          height: getHeight(context) * .15,
                          width: getWith(context) * .3,
                          fit: BoxFit.cover,
                          imageUrl: colis.images[index].src,
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
                                backgroundImage:
                                    AssetImage("assets/logo/logo.png"));
                          },
                        )),
                  ),
                ),
                if (colis.statusLivraisonColis == 0)
                  Text('Livraison en attente de validation'),
                if (colis.statusLivraisonColis == 1)
                  Column(
                    children: [
                      Text('Presentez ce code a scanner au livreur'),
                      QrImageView(
                        data: colis.code_recuperation_colis,
                        version: QrVersions.auto,
                        gapless: true,
                        embeddedImage: AssetImage("assets/logo/logo.png"),
                        // embeddedImageStyle:
                        //     QrEmbeddedImageStyle(size: Size(20, 20)),
                        size: 200.0,
                      ),
                    ],
                  ),
                Container(
                  height: 0,
                  child: RepaintBoundary(
                    key: globalKey,
                    child: QrImageView(
                      data: colis.code_livraison_colis,
                      version: QrVersions.auto,
                      embeddedImage: AssetImage("assets/logo/logo.png"),
                      // embeddedImageStyle:
                      //     QrEmbeddedImageStyle(size: Size(20, 20)),
                      size: 200.0,
                    ),
                  ),
                ),
                if (colis.statusLivraisonColis == 2)
                  Text('Livraison de ce colis en cours'),
                if (colis.statusLivraisonColis == 3)
                  Text('Livraison de ce colis terminee'),
                if (colis.statusLivraisonColis == 1)
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
              ]))));

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

      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 3.0);

      //Drawing White Background because Qr Code is Black
      final whitePaint = Paint()..color = Colors.white;
      final recorder = PictureRecorder();
      final canvas = Canvas(
          recorder,
          Rect.fromLTWH(0, 0, image.width.toDouble() * 1.5,
              image.height.toDouble() * 1.5));
      canvas.drawRect(
          Rect.fromLTWH(0, 0, image.width.toDouble() * 1.5,
              image.height.toDouble() * 1.5),
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
              'Voir votre code de receptin colis : ${colis.code_livraison_colis}');
      print('save');
    } catch (e) {
      print('error--------${e}');
    }
  }
}
