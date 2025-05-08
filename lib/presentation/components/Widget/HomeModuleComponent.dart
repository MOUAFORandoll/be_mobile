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
      margin: EdgeInsets.symmetric(vertical: kMarginY),
      decoration: BoxDecoration(
        color: ColorsApp.greyNew, // Color.fromARGB(255, 231, 229, 229),
        borderRadius: BorderRadius.circular(10),
      ),
      padding:
          EdgeInsets.symmetric(horizontal: kMarginX, vertical: kMarginY * 1.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: getWidth(context) * .55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: getWidth(context) * .55,
                  child: Text(
                    title,
                    maxLines: 4,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: kMarginY),
                  width: getWidth(context) * .5,
                  child: AppButton(
                    text: titleBtn,
                    onTap: onTap,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: getWidth(context) * .3,
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
