import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:BananaExpress/utils/constants/assets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:BananaExpress/utils/Services/routing.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:BananaExpress/application/export_bloc.dart';
@RoutePage()
class SplashScreenPage extends StatefulWidget {
  static const routeName = '/';
  const SplashScreenPage({super.key});
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  GetStorage box = GetStorage();
  
  start() async {
    // await box.write('first', 0);
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    
    Future.delayed(Duration(seconds: 7), () async {
      print(box.read('first'));
      if (box.read('first') != 1) {
         AutoRouter.of(context).popUntilRouteWithName(AppLinks.ONBOARDING);
      } else {
        bool connect = await userBloc.connected();
        if (connect) {
          BlocProvider.of<HomeBloc>(context).add(UserDataEvent());
          BlocProvider.of<LivraisonBloc>(context).add(GetVilleEvent());
       AutoRouter.of(context)          .pushNamed(AppLinks.HOME);
        } else {
       AutoRouter.of(context).popUntilRouteWithName(AppLinks.LOGIN);
        }
        // await secondInit();
      }
      // Get.find<ManagerController>().chageN(false);
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
    return Scaffold(
        backgroundColor: ColorsApp.white,
        body: Container(
            alignment: Alignment.center,
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.symmetric(vertical: kHeight * .20)
                          .add(EdgeInsets.only(top: kHeight * .10)),
                      child: SvgPicture.asset(
                        Assets.babana,
                      )),
                  Container(
                      child: Container(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            color: ColorsApp.second,
                          )))
                ])));
  }
}
