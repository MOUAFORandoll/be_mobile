import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

class UploadImage extends StatelessWidget {
  final title, onTap, color, icon;

  UploadImage({this.icon, this.title, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 0).add(EdgeInsets.only(
              right: kMarginX / 2,
            )),
            padding: EdgeInsets.symmetric(
              horizontal: kMarginY / 2,
            ),
            alignment: Alignment.center,
            height: getWidth(context) * .30,
            width: getWidth(context) * .30,
            decoration: BoxDecoration(
                color: ColorsApp.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(150),
                boxShadow: [
                  BoxShadow(
                    color: ColorsApp.primary.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 2),
                  ),
                  BoxShadow(
                    color: ColorsApp.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 2),
                  ),
                ],
                border: Border.all(color: ColorsApp.grey)
                // color: (color == null) ? ColorsApp.blue : color,
                ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Icon(icon, color: color),
                ),
                smallText(text: title, color: color),
              ],
            )));
  }
}
