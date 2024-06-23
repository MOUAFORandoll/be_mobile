import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

class ShimmerLivraison extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsApp.greyNew,
      highlightColor: ColorsApp.primary.withOpacity(.1),
      child: Container(
          height: getHeight(context) * .9,
          // margin: EdgeInsets.symmetric(horizontal: kMarginX),
          child: SizedBox(
              height: getHeight(context) * .9,
              child: Stack(children: [
                GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 0.0,
                        childAspectRatio: 10,
                        mainAxisExtent: 100,
                        mainAxisSpacing: 10.0),
                    itemCount: 6,
                    itemBuilder: (_ctx, index) => Container(
                          height: 4.2,
                          width: getWidth(context),
                          alignment: Alignment.center,
                          // padding: EdgeInsets.all(kMarginX),
                          // margin: EdgeInsets.symmetric(horizontal: kMarginX),
                          decoration: BoxDecoration(
                              color: ColorsApp.greyNew,
                              borderRadius: BorderRadius.circular(8)),
                        ))
              ]))),
    );
  }
}
