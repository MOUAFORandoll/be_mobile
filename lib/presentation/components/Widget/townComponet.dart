// ignore_for_file: must_be_immutable

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

class TownComponent extends StatefulWidget {
  TownComponent({this.ville = 'douala'});
  var ville;

  @override
  State<TownComponent> createState() => _TownComponentState();
}

class _TownComponentState extends State<TownComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // height: getHeight(context) * .06,
        margin: EdgeInsets.only(right: getWidth(context) * .012),
        padding: EdgeInsets.only(
            right: getWidth(context) * .012, left: getWidth(context) * .012),
        alignment: Alignment.center,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Text(widget.ville, style: TextStyle(color: ColorsApp.tird)));
  }
}
