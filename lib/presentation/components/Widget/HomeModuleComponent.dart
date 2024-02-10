import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

// ignore: must_be_immutable
class HomeModuleComponent extends StatelessWidget {
  final String title;
  final String titleBtn;
  final onTap;
  final image;

  HomeModuleComponent({
    Key? key,
    required this.onTap,
    required this.titleBtn,
    required this.title,
    required this.image,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 231, 229, 229),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: kMarginX),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: getWith(context) * .55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: getWith(context) * .55,
                  child: Text(
                    title,
                    maxLines: 4,
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: kMarginY),
                  width: getWith(context) * .5,
                  child: AppButton(
                    size: MainAxisSize.max,
                    bgColor: ColorsApp.primary,
                    text: titleBtn,
                    onTap: onTap,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: getWith(context) * .3,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
