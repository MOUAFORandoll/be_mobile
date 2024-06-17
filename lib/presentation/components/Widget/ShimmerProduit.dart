import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

class ShimmerProduit extends StatelessWidget {
  const ShimmerProduit({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsApp.grey,
      highlightColor: Colors.blueGrey,
      child: Container(
          height: getHeight(context) / 1.8,
          margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
          child: SizedBox(
              height: getHeight(context) / 2,
              child: Stack(children: [
                GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20.0,
                            childAspectRatio: 15,
                            mainAxisExtent: 130,
                            mainAxisSpacing: 25.0),
                    itemCount: 4,
                    itemBuilder: (_ctx, index) => Column(children: [
                          Container(
                            height: getHeight(context) / 8,
                            width: getWith(context) * 1.1,
                            alignment: Alignment.center,
                            // padding: EdgeInsets.all(kMarginX),
                            decoration: BoxDecoration(
                                color: ColorsApp.grey,
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        ]))
              ]))),
    );
  }
}
