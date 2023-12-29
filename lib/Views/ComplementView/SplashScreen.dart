import 'package:BananaExpress/controller/managerController.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:BananaExpress/utils/Services/core.dart';
import 'package:BananaExpress/utils/Services/dependancies.dart';
import 'package:BananaExpress/utils/Services/storageService.dart';
import 'package:BananaExpress/utils/constants/assets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';
import 'package:BananaExpress/utils/Services/routing.dart';
import 'package:BananaExpress/utils/Services/apiUrl.dart';
import 'package:BananaExpress/utils/provider/refresh_token.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:BananaExpress/views/User/LoginScreen.dart';
import 'dart:async';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart' show PlatformException;
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  GetStorage box = GetStorage();

  start() {
    // box.write('first', 0);
    Get.find<ManagerController>().startTimer();

    Future.delayed(Duration(seconds: 5), () async {
      print(box.read('first'));
      if (box.read('first') != 1) {
        box.write('first', 1);
        Get.offNamedUntil(AppLinks.ONBOARDING, (route) => false);
        await secondInit();
      } else {
        Get.offNamedUntil(AppLinks.FIRST, (route) => false);
        await secondInit();
      }
      Get.find<ManagerController>().chageN(false);
    });
  }

  @override
  void initState() {
    super.initState();

    // initUniLinks();
    start();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorsApp.white,
          body: Container(
              alignment: Alignment.center,
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.symmetric(vertical: kHeight / 3),
                        child: /*  Text(
                          'BananaExpress',
                          style: TextStyle(
                              fontSize: 34.0,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600),
                        ) */
                            SvgPicture.asset(
                          Assets.logoSvg,
                          width: kHeight / 10,
                          height: kHeight / 10,
                        )),
                    // SizedBox(
                    //   height: kHeight / 5,
                    // ),
                    Container(
                        // margin: EdgeInsets.only(top: 250),
                        child: Text(
                      'from',
                      style: TextStyle(
                        // fontSize: 34.0,
                        fontFamily: 'Lato', color: Colors.grey,
                      ),
                    )),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              child: SvgPicture.asset(
                            Assets.logo_esq,
                            width: kHeight / 20,
                            height: kHeight / 20,
                          )),
                          Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                'Edge Square',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w600),
                              )),
                        ],
                      ),
                    ),
                  ]))),
    );
  }
}
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: ColorsApp.white,
//         body: Container(
//             alignment: Alignment.center,
//             child: new Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   new Container(
//                       margin: EdgeInsets.symmetric(horizontal: kWidth / 7),
//                       child: new Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: <Widget>[
//                           Container(
//                               width: kWidth / 5.8,
//                               height: kHeight / 1.2,
//                               child: SvgPicture.asset(
//                                 Assets.logo_without,
//                                 width: kWidth / 2,
//                                 height: kHeight / 1.2,
//                               )),
//                           Container(
//                             // alignment: Alignment.centerLeft,
//                             margin: EdgeInsets.only(left: 10),
//                             width: kWidth / 2.5,
//                             child: AnimatedTextKit(
//                               animatedTexts: [
//                                 TypewriterAnimatedText(
//                                   'BananaExpress',
//                                   textStyle: TextStyle(
//                                       fontSize: 34.0,
//                                       fontFamily: 'Lato',
//                                       fontWeight: FontWeight.w600),
//                                   cursor: '_',
//                                   speed: const Duration(
//                                       milliseconds:
//                                           180), // Ajustez la vitesse d'animation
//                                 ),
//                               ],
//                               repeatForever:
//                                   true, // Répéter l'animation en boucle
//                             ),
//                           ),

//                           // Container(
//                           //   margin: EdgeInsets.only(top: kMdHeight / 15),
//                           //   child: SpinKitRing(
//                           //     lineWidth: 4,
//                           //     color: ColorsApp.tird,
//                           //     size: 25,
//                           //   ),
//                           // ),
//                         ],
//                       ))
//                 ])));
//   }
// }

// class AnimatedText extends StatefulWidget {
//   final String text;
//   final TextStyle style;
//   final Duration duration;

//   AnimatedText({required this.text, required this.style, required this.duration});

//   @override
//   _AnimatedTextState createState() => new _AnimatedTextState();
// }

// class _AnimatedTextState extends State<AnimatedText>
//     with TickerProviderStateMixin {
//  late AnimationController _controller;
//  late Animation<double> _opacity;

//   @override
//   void initState() {
//     super.initState();
//     _controller = new AnimationController(
//       vsync: this,
//       duration: widget.duration,
//     );
//     _opacity = new Tween(begin: 0.0, end: 1.0).animate(_controller);
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new AnimatedBuilder(
//       animation: _opacity,
//       builder: (context, child) {
//         return new Text(
//           widget.text,
//           style: widget.style.copyWith(opacity: _opacity.value),
//         );
//       },
//     );
//   }
// }
/**
 * 
class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  GetStorage box = GetStorage(); 
  AnimationController? _controller;
  Animation<Color>? _colorAnimation;

  start() {
    Get.find<ManagerController>().startTimer();

    Future.delayed(Duration(seconds: 10), () async {
      print(box.read('first'));
      if (box.read('first') != 1) {
        box.write('first', 1);
        Get.offNamedUntil(AppLinks.ONBOARDING, (route) => false);
      } else {
        Get.offNamedUntil(AppLinks.FIRST, (route) => false);
      }
      Get.find<ManagerController>().chageN(false);

      // MyBinding().onGetAll();
    });
  }

  Future<void> initUniLinks() async {
    try {
      StreamSubscription _sub;

      // Écoutez les liens entrants
      _sub = linkStream.listen((uri) {
        // Traitez les liens entrants ici
        handleDeepLink(uri);
      });
    } on PlatformException {
      // Gestion des erreurs
    }
  }

  void handleDeepLink(uri) {
    // Votre logique pour traiter les liens entrants
    // Extrait les informations nécessaires de l'URL
  }

  @override
  void initState() {
  _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _colorAnimation = ColorTween(
      begin: ColorsApp.tird,
      end: ColorsApp.orange,
    ).animate(_controller as Animation<double>) as Animation<Color>?;
    initUniLinks();
    start();
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: AnimatedBuilder(
                animation: _colorAnimation!,
                builder: (context, child) {
                  return ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          _colorAnimation!.value, BlendMode.modulate),
                      child: SvgPicture.asset(
                        Assets.logoSvg,
                        width: kHeight * 2.5,
                        height: kHeight * 2.5,
                      ));
                })));
  }
}

 */
