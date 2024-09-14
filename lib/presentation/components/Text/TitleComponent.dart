import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

// ignore: must_be_immutable
class TitleComponent extends StatelessWidget {
  String title;
  String? subTitle;
  TitleComponent({
    required this.title,
    required this.subTitle,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: kMarginX / 2,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: getWidth(context) * .9,
                    margin: EdgeInsets.only(top: kMarginY),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge,
                    )),
                if (subTitle != null)
                  Container(
                      width: getWidth(context) * .9,
                      child: Text(
                        subTitle!,
                      )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
