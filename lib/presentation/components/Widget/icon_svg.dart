import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class SvgIcon extends StatelessWidget {
  SvgIcon({this.width = 18, this.height = 18, this.color, required this.icon});
  final double height;
  final icon;
  final double width;
  var color;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: icon != null
            // ignore: deprecated_member_use
            ? SvgPicture.asset(icon, width: width, height: height, color: color)
            : null);
  }
}
