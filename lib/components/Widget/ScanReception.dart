import 'package:BananaExpress/controller/DataBaseController.dart';
import 'package:BananaExpress/controller/LivraisonController.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../exportcomponent.dart';

const flashOn = 'FLASH ON';
const flashOff = 'FLASH OFF';
const frontCamera = 'FRONT CAMERA';
const backCamera = 'BACK CAMERA';

class ScanReception extends StatefulWidget {
  int idLivraison;
  ScanReception({required this.idLivraison});

  @override
  State<ScanReception> createState() => _ScanReceptionState();
}

class _ScanReceptionState extends State<ScanReception> {
  var qrText = '';

  var flashState = flashOn;

  var cameraState = frontCamera;

  late QRViewController controller;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  final focusedBorderColor = const Color.fromARGB(255, 102, 192, 222);
  final fillColor = ColorsApp.primary;
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 22,
      color: ColorsApp.white,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Scan de Livraison'),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            Container(
              child: InkWell(
                  child: Icon(flashState == 'FLASH ON'
                      ? Icons.bolt_outlined
                      : Icons.close),
                  onTap: () {
                    if (controller != null) {
                      controller.toggleFlash();
                    }
                    print(controller.getFlashStatus());
                    if (_isFlashOn(flashState)) {
                      setState(() {
                        flashState = flashOff;
                      });
                    } else {
                      setState(() {
                        flashState = flashOn;
                      });
                    }
                  }),
            ),
          ]),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: kMarginY * 3),
            child: Text(
              'Scanner ou Saisir le code',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Container(
            height: kHeight / 2.5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Color.fromARGB(255, 43, 241, 238),
                borderRadius: 10,
                borderLength: 30,
                overlayColor: Colors.white,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: kMarginY * 8),
              child: Pinput(
                length: 5,
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                defaultPinTheme: defaultPinTheme.copyWith(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: ColorsApp.primary,
                    ),
                  ),
                ),
                submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: BoxDecoration(
                    color: fillColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyWith(
                  decoration: BoxDecoration(
                    color: fillColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.redAccent),
                  ),
                ),
                onCompleted: (pin) async {
                  var getU = await Get.find<DataBaseController>().getKey();
                  var data = {
                    'livraison': widget.idLivraison,
                    'code_livraison_colis': pin,
                    'keySecretBabana': getU
                  };
                  print(data);

                  await Get.find<LivraisonController>().receptionColis(data);
                },
              )),
        ],
      ),
    );
  }

  bool _isFlashOn(String current) {
    return flashOn == current;
  }

  bool _isBackCamera(String current) {
    return backCamera == current;
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen((scanData) async {
      print('***************************-----$scanData');
      var getU = await Get.find<DataBaseController>().getKey();

      if (scanData != null) {
        var data = {
          'livraison': widget.idLivraison,
          'code_livraison_colis': scanData.code,
          'keySecretBabana': getU
        };
        print(data);

        await Get.find<LivraisonController>().receptionColis(data);
      }
    });
  }
}
