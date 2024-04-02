 
import '../exportcomponent.dart';

// ignore: must_be_immutable
class OptionComponent extends StatelessWidget {
  OptionComponent({this.title, this.selected = false, this.onTap});
  final title, onTap;

  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(
              top: getHeight(context) * .04,
              bottom: getHeight(context) * .04,
              left: getWith(context) * .01,
              right: getWith(context) * .01),
          decoration: BoxDecoration(
            color: this.selected ? ColorsApp.grey : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(this.title), Icon(Icons.arrow_forward_ios_sharp)],
          ),
        ));
  }
}
