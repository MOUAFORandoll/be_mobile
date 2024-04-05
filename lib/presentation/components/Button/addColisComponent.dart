// ignore: must_be_immutable
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';

class AddColisComponent extends StatelessWidget {
  final title, onTap, color, icon;

  AddColisComponent({this.icon, this.title, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            width: getWith(context) / 2.35,
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: ColorsApp.grey)),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: kMarginY),
                  height: getHeight(context) * .10,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Assets.login), fit: BoxFit.contain),
                  ),
                ),
                /*      Center(
                  child: Icon(icon, color: color),
                ), */
                Container(
                    decoration: new BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(10)),
                      border: Border(top: BorderSide(color: ColorsApp.grey)),
                      color: ColorsApp.primary,
                    ),
                    width: getWith(context),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15,
                          color: ColorsApp.white,
                          fontWeight: FontWeight.w700),
                    )),
              ],
            )));
  }
}
