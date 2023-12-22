import 'package:BananaExpress/controller/DataBaseController.dart';
import 'package:BananaExpress/controller/LivraisonController.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:get/get.dart';

const flashOn = 'FLASH ON';
const flashOff = 'FLASH OFF';
const frontCamera = 'FRONT CAMERA';
const backCamera = 'BACK CAMERA';

class ScanReception extends StatelessWidget {
  int idLivraison;
  ScanReception({required this.idLivraison});
  var qrText = '';
  var flashState = flashOn;
  var cameraState = frontCamera;
  late QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                overlayColor: Color.fromRGBO(102, 200, 200, 80),
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () {
                            if (controller != null) {
                              controller.toggleFlash();
                              // if (_isFlashOn(flashState)) {
                              //   setState(() {
                              //     flashState = flashOff;
                              //   });
                              // } else {
                              //   setState(() {
                              //     flashState = flashOn;
                              //   });
                              // }
                            }
                          },
                          child:
                              Text(flashState, style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () {
                            if (controller != null) {
                              controller.flipCamera();
                              // if (_isBackCamera(cameraState)) {
                              //   setState(() {
                              //     cameraState = frontCamera;
                              //   });
                              // } else {
                              //   setState(() {
                              //     cameraState = backCamera;
                              //   });
                              // }
                            }
                          },
                          child:
                              Text(cameraState, style: TextStyle(fontSize: 20)),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () {
                            controller.pauseCamera();
                          },
                          child: Text('pause', style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () {
                            controller.resumeCamera();
                          },
                          child: Text('resume', style: TextStyle(fontSize: 20)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
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

      if (scanData!=null) {
        var data = {
          'livraison': idLivraison,
          'code_recuperation': "",
          'keySecretBabana': getU
        };
        print(data);

        await Get.find<LivraisonController>().receptionColis(data);
      }
    });
  }
}
