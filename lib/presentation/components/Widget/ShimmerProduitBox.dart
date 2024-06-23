import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

// ignore: must_be_immutable
class ShimmerProduitBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: ColorsApp.greyNew,
        highlightColor: ColorsApp.primary.withOpacity(.1),
        child: Container(
          height: getHeight(context) / 8,
          width: getWidth(context) * 1.1,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: ColorsApp.greyNew, borderRadius: BorderRadius.circular(8)),
        ));
  }
}
