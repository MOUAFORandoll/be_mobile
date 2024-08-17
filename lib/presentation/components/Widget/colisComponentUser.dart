import 'dart:io';

import 'package:BabanaExpress/application/model/exportmodel.dart';
import 'package:BabanaExpress/presentation/components/Widget/global_bottom_sheet.dart';
import 'package:BabanaExpress/presentation/livraison/ColisConversationPage.dart'; 
import 'package:cached_network_image/cached_network_image.dart';

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'dart:typed_data';
import 'dart:async';
import 'dart:ui';
import 'package:flutter/rendering.dart';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path/path.dart' as path;
import 'package:BabanaExpress/application/export_bloc.dart';

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
        onTap: () {
          context
              .read<LivraisonBloc>()
              .add(GetConversationColis(idColis: colis.id));
          onOpenColis(context);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: ColorsApp.primary.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(-1, 0),
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
                            child: /*  Shimmer.fromColors(
                                baseColor: ColorsApp.greyNew,
                                highlightColor:
                                    ColorsApp.primary.withOpacity(.1),
                                child: */
                                Skeletonizer(
                                    enabled: true,
                                    child: Container(
                                      // height: getHeight(context) / 10,
                                      // width: getHeight(context) / 10,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: ColorsApp.greyNew,
                                      ),
                                    )),
                          );
                        },
                        errorWidget: (context, url, error) {
                          return Container(
                              // height: getHeight(context) / 10,
                              // width: getHeight(context) / 10,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/login.png'))));
                        },
                      )),
                      Container(
                        padding: EdgeInsets.only(top: 3),
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: ColorsApp.greyNew, width: .5))),
                        alignment: Alignment.center,
                        width: getWidth(context) / 2,
                        child: Text(
                          colis.nom,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w700),
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

  onOpenColis(context) => GlobalBottomSheet.show(
      maxHeight: getHeight(context) * .9,
      context: context,
      title: 'Colis'.tr(),
      subtitle: 'Suivez les informations de votre colis'.tr(),
      widget: Column(
        children: [ColisConversationPage(colis: colis)],
      ));

  Future<void> requestPermission() async {
    PermissionStatus status = await Permission.storage.request();
    if (status == PermissionStatus.granted) {
      print('accepte');
    } else {
      print('refuse');
    }
  }

  // Future<void> _shareCode() async {
  //   await Share.share('yCodeThis'.tr() + ' ${colis.code_livraison_colis}',
  //       subject: 'yCodeThis'.tr() + ' ${colis.code_livraison_colis}');
  //   print('save');
  // }

  bool dirExists = false;
  // ignore: unused_element
  Future<void> _captureAndSavePng() async {
    try {
      await requestPermission();

      final directory = await getTemporaryDirectory();
      print('----------path-----${directory.path}-');
      final externalDir = path.join(directory.path, 'Download', 'Qr_code');

      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 3.0);

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
          text: 'yCodeThis'.tr() + ' ${colis.code_livraison_colis}');
      print('save');
    } catch (e) {
      print('error--------${e}');
    }
  }
}
