import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

class DelivryWidgetTitle extends StatelessWidget {
  DelivryWidgetTitle({
    required this.title,
    required this.icon,
  });
  final title, icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          /* mainAxisAlignment: MainAxisAlignment.spaceBetween, */ children: [
            Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ColorsApp.green.withOpacity(.2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(icon, size: 20, color: ColorsApp.primary)),
            Container(
                margin: EdgeInsets.only(left: kMarginX),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: kTitle * 1.1,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                  ),
                )),
          ]),
    );
  }
}
