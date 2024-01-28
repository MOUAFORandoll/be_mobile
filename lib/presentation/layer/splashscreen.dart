import 'package:BananaExpress/application/splash/splash_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:BananaExpress/styles/colorApp.dart';
import 'package:BananaExpress/styles/textStyle.dart';
import 'package:BananaExpress/utils/constants/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../application/export_bloc.dart';
import '../../core.dart';

@RoutePage()
class SplashScreenPage extends StatefulWidget {
  static const String routeName = '/';
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (_) => sl<SplashBloc>()
        ..add(SplashEvent.startLoading(
          context.locale.toString(),
        )),
      child: BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is Loaded) {
            if (state.isLogin == true) {
              initLoad(context);
            }
            // final HomeBloc h = BlocProvider.of<HomeBloc>(context);
            // h.add(UserDataEvent());
            print('**----');
            AutoRouter.of(context).replace(state.route);
          }
        },
        builder: (context, state) {
          return Scaffold(
              backgroundColor: ColorsApp.white,
              body: SingleChildScrollView(
                child: Container(
                    alignment: Alignment.center,
                    child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.symmetric(
                                      vertical: getHeight(context) * .20)
                                  .add(EdgeInsets.only(
                                      top: getHeight(context) * .10)),
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
                        ])),
              ));
        },
      ),
    );
  }
}
