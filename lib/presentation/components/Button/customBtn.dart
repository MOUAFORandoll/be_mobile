import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

class CustomBtn extends StatelessWidget {
  final title, onTap, color, validator;

  CustomBtn({this.validator, this.title, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            width: getWidth(context) * .95,
            padding: EdgeInsets.all(13),
            // margin: EdgeInsets.all(10),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: (color == null) ? ColorsApp.tird : color,
            ),
            child: ((validator == null) ? false : validator)
                ? Center(
                    child: CircularProgressIndicator(
                      color: ColorsApp.second,
                    ),
                  )
                : smallText(text: title)));
  }
}
