import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void configLoadingLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    // ..indicatorType = EasyLoadingIndicatorType.ring
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..indicatorColor = ThemeApp.second
    ..indicatorWidget = Container(
        height: 70,
        width: 70,
        child: SpinKitRing(color: ThemeApp.second, size: 40.0, lineWidth: 4))
    ..radius = 10.0
    ..progressColor = Colors.red
    // ..backgroundColor = Colors.transparent

    ..backgroundColor = ColorsApp.white
    ..textColor = Colors.black
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
  ;
}
