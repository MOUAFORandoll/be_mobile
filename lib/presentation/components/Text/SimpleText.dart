import 'package:BananaExpress/presentation/components/exportcomponent.dart';

// ignore: must_be_immutable
class SimpleText extends StatelessWidget {
  String text;
  Color color;
  bool bolder;
  SimpleText(
      {this.text = '', this.color = ColorsApp.primary, this.bolder = false});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: getWith(context) * .51,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: kTitle,
              fontFamily: 'Lato',
              color: color,
              fontWeight: bolder ? FontWeight.w600 : FontWeight.normal),
        ));
  }
}
