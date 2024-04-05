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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: ColorsApp.primary.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Stack(children: [
              InkWell(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Container(
                            // margin: EdgeInsets.only(right: 5),
                            width: getWith(context) / 2.2,
                            height: getHeight(context) / 6.8,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(Assets.login),
                                      fit: BoxFit.contain),
                                ),
                              ),
                            ),
                          ),
                          Container(
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(10)),
                                border: Border(
                                    top: BorderSide(color: ColorsApp.grey)),
                                color: ColorsApp.primary,
                              ),
                              width: getWith(context),
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 20),
                              margin: EdgeInsets.only(top: kMarginY),
                              child: Text(
                                title,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: ColorsApp.white,
                                    fontWeight: FontWeight.w700),
                              )),
                        ],
                      )))
            ])));
  }
}
