import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

// ignore: must_be_immutable
class ShimmerProduitBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return /* Shimmer.fromColors(
        baseColor: ColorsApp.greyNew,
        highlightColor: ColorsApp.primary.withOpacity(.1),
        child:  */
        Skeletonizer(
            enabled: true,
            child: Container(
              height: getHeight(context) / 7,
              width: getWidth(context) * 1.1,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ColorsApp.greyNew,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  topLeft: Radius.circular(8),
                ),
              ),
            ));
  }
}
