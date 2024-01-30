// ignore_for_file: must_be_immutable

import 'package:BananaExpress/presentation/components/exportcomponent.dart';

class btnCatListPV extends StatelessWidget {
  var title, onTap, active, pVal;

  btnCatListPV({this.active = false, this.title, this.onTap, this.pVal});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          width: getWith(context) * 0.3,
          height: getHeight(context) * 0.3,
          alignment: Alignment.center,
          padding: EdgeInsets.all(this.pVal ?? 10),
          margin: EdgeInsets.all(this.pVal ?? 10),
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: /* (active) ?  */
                ColorsApp.tird /* : Color(0x71755050) */,
          ),
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ));
  }
}
