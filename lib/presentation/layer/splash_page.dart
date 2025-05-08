 
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:BabanaExpress/utils/assets.dart';

import 'package:flutter_svg/svg.dart';

import '../../application/export_bloc.dart';
import '../../core.dart';

@RoutePage()
class SplashScreenPage extends StatefulWidget {
  static const String routeName = '/';
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsApp.white,
        body: Container(
          alignment: Alignment.center,
          child: Container(
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: SvgPicture.asset(
                        Assets.logo_t1,
                        fit: BoxFit.contain,
                      ),
                      padding: EdgeInsets.all(30),
                      height: getHeight(context) * .25,
                      width: getHeight(context) * .25,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text('Babana Express',
                            style: TextStyle(
                                color: ColorsApp.white,
                                fontWeight: FontWeight.w600,
                                fontSize: kBasics * 2)))
                  ])),
        ));
  }
}
