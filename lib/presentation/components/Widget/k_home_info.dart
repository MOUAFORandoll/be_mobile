import 'package:BananaExpress/presentation/components/exportcomponent.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class KHomeInfo extends StatelessWidget {
  KHomeInfo({required this.user});
  final user;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(children: [
            Container(
                child: Icon(
              Icons.location_on,
              color: ColorsApp.white,
              size: 30,
            )),
            Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Container(
                      child: Text('Pk13, sodikombo',
                          style: TextStyle(
                              color: ColorsApp.white,
                              fontSize: 8,
                              fontWeight: FontWeight.normal))),
                  Container(
                      child: Text('Douala',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: ColorsApp.white,
                            fontSize: 12,
                          ))),
                ])),
          ]),
        ),
        Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: ColorsApp.white, width: 2))),
            padding: EdgeInsets.symmetric(vertical: kMarginY / 4),
            child: Text('Hey, ' + user.nom,
                style: TextStyle(
                  color: ColorsApp.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                )))
      ],
    ));
  }
}
