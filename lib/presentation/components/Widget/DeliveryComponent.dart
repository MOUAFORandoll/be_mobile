// ignore: must_be_immutable

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class DeliveryComponent extends StatelessWidget {
  var icon, text;
  bool bold;
  DeliveryComponent(
      {required this.icon, required this.text, this.bold = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: kMarginY / 3),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: ColorsApp.white,
                  borderRadius: BorderRadius.circular(5)),
              child: SvgPicture.asset(
                icon,
                width: 18,
                height: 18,
                // ignore: deprecated_member_use
                color: ColorsApp.tird,
              )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: kMarginX),
              child: InkWell(
                child: Text(
                  text,
                  style: TextStyle(
                      fontFamily: 'Helvetica',
                      fontSize: 12,
                      color: ColorsApp.primary,
                      fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
                ),
                onTap: () {},
              )),
        ]));
  }
}
