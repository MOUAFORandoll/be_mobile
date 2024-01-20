import 'package:BananaExpress/controller/managerController.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:BananaExpress/ui/user/bloc/user_event.dart';
import 'package:BananaExpress/utils/Services/core.dart';
import 'package:BananaExpress/utils/constants/assets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:BananaExpress/utils/Services/routing.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/datebase.dart';
import '../user/bloc/user_bloc.dart';
import '../user/bloc/user_state.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  GetStorage box = GetStorage();

  start() async {
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    userBloc.add(GetDataBateEvent());

    Future.delayed(Duration(seconds: 7), () async {
      print(box.read('first'));
      if (box.read('first') != 1) {
        Navigator.of(context).popAndPushNamed(AppLinks.ONBOARDING);
      } else {
        bool connect = await userBloc.connected();
        if (connect) {
          Navigator.of(context).pushNamed(AppLinks.FIRST);
        } else {
          Navigator.of(context).popAndPushNamed(AppLinks.LOGIN);
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
