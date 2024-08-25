// ignore_for_file: must_be_immutable

import 'package:BabanaExpress/application/model/exportmodel.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:BabanaExpress/utils/functions/datetime_format_utils.dart';
import 'package:cached_network_image/cached_network_image.dart'; 
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
 
import 'dart:async'; 
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:BabanaExpress/application/export_bloc.dart';

@RoutePage()
class ColisConversationPage extends StatefulWidget {
  ColisUser colis;

  ColisConversationPage({
    required this.colis,
  });
  static const routeName = '/Colis/colis';

  @override
  State<ColisConversationPage> createState() => _ColisConversationPageState();
}

class _ColisConversationPageState extends State<ColisConversationPage> {
  GlobalKey globalKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LivraisonBloc, LivraisonState>(
        builder: (context, state) => SingleChildScrollView(
              child: Container(
                  child: Column(children: [
                Container(
                  // padding: EdgeInsets.only(top: kMarginY * 2)
                  //     .add(EdgeInsets.symmetric(horizontal: kMarginX * 2)),
                  decoration: BoxDecoration(
                    color: ColorsApp.greyNew,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: CachedNetworkImage(
                            height: getHeight(context) * .20,
                            width: getWidth(context) * .4,
                            fit: BoxFit.cover,
                            imageUrl: widget.colis.images[0].src,
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: ColorsApp.primary.withOpacity(.1),
                                  ),
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
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image:
                                              AssetImage('assets/login.png'))));
                            },
                          ),
                        ),
                        if (widget.colis.statusLivraisonColis == 0)
                          Container(
                              alignment: Alignment.center,
                              margin:
                                  EdgeInsets.symmetric(vertical: kMarginY / 2),
                              width: getWidth(context) * .4,
                              child: Text(
                                'ylAwait'.tr(),
                                textAlign: TextAlign.center,
                              )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (widget.colis.statusLivraisonColis == 1)
                              Column(
                                children: [
                                  Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.symmetric(
                                          vertical: kMarginY / 2),
                                      width: getWidth(context) * .4,
                                      child: Text(
                                        'yPresent'.tr(),
                                        textAlign: TextAlign.center,
                                      )),
                                  // QrImageView(
                                  //   data: widget.colis.code_recuperation_colis,
                                  //   version: QrVersions.auto,
                                  //   gapless: true,
                                  //   embeddedImage: AssetImage('assets/logo/logo.png'),
                                  //   // embeddedImageStyle:
                                  //   //     QrEmbeddedImageStyle(size: Size(20, 20)),
                                  //   size: 200.0,
                                  // ),

                                  Container(
                                      width: getWidth(context) * .4,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                        vertical: kMarginY,
                                      ),
                                      margin: EdgeInsets.symmetric(
                                          vertical: kMarginY),
                                      decoration: BoxDecoration(
                                          color: ColorsApp.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: ColorsApp.grey
                                                  .withOpacity(0.8),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Text(
                                        widget.colis.code_recuperation_colis,
                                      ))
                                ],
                              ),
                            if (widget.colis.statusLivraisonColis == 1 ||
                                widget.colis.statusLivraisonColis == 2)
                              Column(children: [
                                Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(
                                        vertical: kMarginY / 2),
                                    width: getWidth(context) * .4,
                                    child: Text(
                                      'Partagez ce code au destinataire du colis'
                                          .tr(),
                                      textAlign: TextAlign.center,
                                    )),
                                InkWell(
                                    child: Container(
                                      width: getWidth(context) * .4,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          vertical: kMarginY,
                                          horizontal: kMarginX),
                                      margin: EdgeInsets.symmetric(
                                          vertical: kMarginY),
                                      decoration: BoxDecoration(
                                          color: ColorsApp.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: ColorsApp.grey
                                                  .withOpacity(0.8),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(),
                                          Container(
                                            child: Text(
                                              widget.colis.code_livraison_colis,
                                            ),
                                          ),
                                          Icon(FontAwesomeIcons.shareNodes),
                                        ],
                                      ),
                                    ),
                                    onTap: () async => _shareCode())
                              ]),
                          ],
                        ),
                        //  Container(
                        //   height: 150.0,
                        //   child: RepaintBoundary(
                        //     key: globalKey,
                        //     child: QrImageView(
                        //       data: widget.colis.code_livraison_colis,
                        //       version: QrVersions.auto,
                        //       embeddedImage: AssetImage('assets/logo/logo.png'),
                        //       // embeddedImageStyle:
                        //       //     QrEmbeddedImageStyle(size: Size(20, 20)),
                        //       size: 200.0,
                        //     ),
                        //   ),
                        // ),

                        if (widget.colis.statusLivraisonColis == 2)
                          Text('ylEncous'.tr()),
                        if (widget.colis.statusLivraisonColis == 3)
                          Text('ylFinish'.tr()),
                        // if (widget.colis.statusLivraisonColis == 1)
                        //   Container(
                        //       margin: EdgeInsets.symmetric(
                        //         vertical: kMarginY * 1.5,
                        //       ),
                        //       child: AppButtonIcon(
                        //           icon: Icons.switch_access_shortcut_add_outlined,
                        //           bgColor: ColorsApp.primary,
                        //           textColor: ColorsApp.white,
                        //           text: 'yShareCodeRecup'.tr(),
                        //           onTap: () async => _captureAndSavePng())),
                      ]),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(vertical: kMarginY),
                    child: Text('Resume de la livraison'.tr(),
                        style: TextStyle(
                            fontSize: kTitle, fontWeight: FontWeight.w600))),
                if (state.isLoadingConversationColis != 0 &&
                    state.conversationColis != null)
                  Column(children: [
                    if (state.conversationColis!.urlRecuperation.isNotEmpty)
                      ColisConversationWidget(
                          left: true,
                          title: 'Colis Recupere',
                          date: state.conversationColis!.dateRecuperation,
                          url: state.conversationColis!.urlRecuperation),
                    if (state.conversationColis!.urlLivraison.isNotEmpty)
                      ColisConversationWidget(
                          left: false,
                          title: 'Colis Livre',
                          date: state.conversationColis!.dateLivraison,
                          url: state.conversationColis!.urlLivraison)
                  ]),
                if (state.isLoadingConversationColis == 0)
                  Skeletonizer(
                      enabled: true,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ColisConversationWidget(
                                left: true, title: 'Colis Recupere', url: ''),
                            ColisConversationWidget(
                                left: false, title: 'Colis Livre', url: ''),
                          ],
                        ),
                      ))
              ])),
            ));
  }

  Future<void> requestPermission() async {
    PermissionStatus status = await Permission.storage.request();
    if (status == PermissionStatus.granted) {
      print('accepte');
    } else {
      print('refuse');
    }
  }

  Future<void> _shareCode() async {
    await Share.share(
        'yCodeThis'.tr() + ' ${widget.colis.code_livraison_colis}',
        subject: 'yCodeThis'.tr() + ' ${widget.colis.code_livraison_colis}');
    print('save');
  }

  bool dirExists = false;
  // ignore: unused_element
//   Future<void> _captureAndSavePng() async {
//     try {
//       await requestPermission();

//       final directory = await getTemporaryDirectory();
//       print('----------path-----${directory.path}-');
//       final externalDir = path.join(directory.path, 'Download', 'Qr_code');

//       RenderRepaintBoundary boundary =
//           globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
//       var image = await boundary.toImage(pixelRatio: 3.0);

//       final whitePaint = Paint()..color = Colors.white;
//       final recorder = PictureRecorder();
//       final canvas = Canvas(
//           recorder,
//           Rect.fromLTWH(0, 0, image.width.toDouble() * 1.5,
//               image.height.toDouble() * 1.5));
//       canvas.drawRect(
//           Rect.fromLTWH(0, 0, image.width.toDouble() * 1.5,
//               image.height.toDouble() * 1.5),
//           whitePaint);
//       canvas.drawImage(image, Offset.zero, Paint());
//       final picture = recorder.endRecording();
//       final img = await picture.toImage(image.width, image.height);
//       ByteData? byteData = await img.toByteData(format: ImageByteFormat.png);
//       Uint8List pngBytes = byteData!.buffer.asUint8List();

//       //Check for duplicate file name to avoid Override
//       String fileName = 'qr_code';
//       int i = 1;
//       while (await File('$externalDir/$fileName.png').exists()) {
//         fileName = 'qr_code_$i';
//         i++;
//       }

//       dirExists = await File(externalDir).exists();
//       //if not then create the path
//       if (!dirExists) {
//         print('...........');

//         await Directory(externalDir).create(recursive: true);
//         dirExists = true;
//       }

//       final file = await File('$externalDir/$fileName.png').create();
//       await file.writeAsBytes(pngBytes);
//       final fileX = await XFile(file.path);
//       await Share.shareXFiles([fileX],
//           text: 'yCodeThis'.tr() + ' ${widget.colis.code_livraison_colis}');
//       print('save');
//     } catch (e) {
//       print('error--------${e}');
//     }
//   }
}

class ColisConversationWidget extends StatelessWidget {
  ColisConversationWidget({
    required this.title,
    this.date,
    required this.url,
    required this.left,
  });

  var date;
  final String title;
  final String url;
  final bool left;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kMarginY, horizontal: kMarginX),
      decoration: BoxDecoration(
        color: ColorsApp.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (left) _buildImage(context),
          _buildText(context),
          if (!left) _buildImage(context),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Container(
      height: getHeight(context) * .2,
      width: getWidth(context) * .4,
      // padding: EdgeInsets.all(8),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: url,
        imageBuilder: (context, imageProvider) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        placeholder: (context, url) {
          return Skeletonizer(
            enabled: true,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorsApp.greyNew,
              ),
            ),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(Assets.logo),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: kMarginX),
      child: Column(
        children: [
          Container(
            child: Text(
              title,
              style: TextStyle(
                  color: ColorsApp.second,
                  fontWeight: FontWeight.w600,
                  fontSize: kTitle),
            ),
          ),
          if (date != null)
            Container(
              child: Text(
                FormatDateTime().convertirDateSecond(date),
                style: TextStyle(
                  color: ColorsApp.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          if (date != null)
            Container(
              child: Text(
                FormatDateTime().extractTimeToDate(date),
                style: TextStyle(
                  color: ColorsApp.primary,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
