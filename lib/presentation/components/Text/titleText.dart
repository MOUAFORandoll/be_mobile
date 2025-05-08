import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

// ignore: must_be_immutable
class titleText extends StatelessWidget {
  String text;
  // String content;
  // bool marginBool;
  titleText({this.text = ''});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
       style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
