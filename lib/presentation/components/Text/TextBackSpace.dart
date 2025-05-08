import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

// ignore: must_be_immutable
class TextBackSpace extends StatelessWidget {
  String text;
  // String content;
  bool bolder;
  Color color;
  TextBackSpace(
      {this.text = '', this.color = ColorsApp.primary, this.bolder = false});
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxWidth: getWidth(context) / 1.5),
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall,
        ));
  }
}
