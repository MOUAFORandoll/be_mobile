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

          // margin: EdgeInsets.symmetric(horizontal: kMarginX),
          child: SizedBox(
              height: getHeight(context) / 2,
              child: Stack(children: [
                GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 0.0,
                            mainAxisSpacing: 10.0),
                    itemCount: 9,
                    itemBuilder: (_ctx, index) => Column(children: [
                          Container(
                            height: getHeight(context) / 12,
                            width: getWith(context) * 1.1,
                            alignment: Alignment.center,
                            // padding: EdgeInsets.all(kMarginX),
                            margin: EdgeInsets.only(right: kMarginX),
                            decoration: BoxDecoration(
                                color: ColorsApp.grey,
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          Container(child: Text('Colis'))
                        ]))
              ]))),
    );
  }
}
