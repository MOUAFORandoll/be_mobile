import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';

class ShimmerProduit extends StatelessWidget {
  const ShimmerProduit({super.key});

  @override
  Widget build(BuildContext context) {
    return /* Shimmer.fromColors(
      baseColor: ColorsApp.grey,
      highlightColor: Colors.blueGrey,
      child: */

        Skeletonizer(
      enabled: true,
      child: Container(
          height: getHeight(context),
          margin: EdgeInsets.symmetric(vertical: kMarginY * 2),
          child: SizedBox(
              height: getHeight(context) / 2,
              child: Stack(children: [
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.0,
                      childAspectRatio: 15,
                      mainAxisExtent: 180,
                      mainAxisSpacing: 25.0),
                  itemCount: 4,
                  itemBuilder: (_ctx, index) => Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffDDDDDD),
                              blurRadius: 0,
                              spreadRadius: 0,
                              offset: Offset(-2.0, 3),
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: getHeight(context) / 7,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    topLeft: Radius.circular(8),
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(Assets.logo),
                                  ))),
                          Container(
                              width: getWidth(context) / 2,
                              margin: EdgeInsets.symmetric(
                                  horizontal: kMarginX / 2),
                              child: Text(
                                'produit.titre',
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                              )),
                          Container(
                              width: getWidth(context) / 2,
                              margin: EdgeInsets.symmetric(
                                  horizontal: kMarginX / 2),
                              child: Text(
                                'produit.titre',
                                overflow: TextOverflow.ellipsis,
                              )),
                        ],
                      )),
                )
              ]))),
    );
  }
}
