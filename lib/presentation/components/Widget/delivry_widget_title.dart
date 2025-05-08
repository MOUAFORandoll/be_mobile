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
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: ThemeApp.second,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(icon, size: 20, color: ColorsApp.white)),
        Container(
            alignment: Alignment.centerLeft,
            width: getWidth(context) * .8,
            margin: EdgeInsets.only(left: kMarginX),
            child: Text(
              title,
              textAlign: TextAlign.left,
              maxLines: 2,
              style: Theme.of(context).textTheme.bodySmall,
            )),
      ]),
    );
  }
}
