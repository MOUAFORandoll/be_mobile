import 'package:BabanaExpress/application/database/database_cubit.dart';
import 'package:BabanaExpress/application/splash/splash_bloc.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/Services/NotificationService.dart';
import 'package:BabanaExpress/utils/Services/SocketService.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return BlocProvider<SplashBloc>(
      create: (_) => sl<SplashBloc>()
        ..add(SplashEvent.startLoading(context.locale.toString(), context)),
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
              backgroundColor: ColorsApp.primary,
              body: Container(
                alignment: Alignment.center,
                child: Container(
                    alignment: Alignment.center,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                            Assets.babana,
                            color: ColorsApp.white,
                            height: 60,
                            width: 60,
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
        },
      ),
    );
  }
}
