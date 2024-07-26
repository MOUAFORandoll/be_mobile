import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  String text;
  // String content;
  bool bolder;
  BigText({this.text = '', this.bolder = false});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: getWidth(context),
        alignment: Alignment.center,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 20,
              color: ColorsApp.primary,
              fontWeight: bolder ? FontWeight.w600 : FontWeight.normal),
        ));
  }
}
