import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';

class ShimmerLivraison extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return /*  Shimmer.fromColors(
      baseColor: ColorsApp.greyNew,
      highlightColor: ColorsApp.primary.withOpacity(.1),
      child: */
        Skeletonizer(
      enabled: true,
      child: Container(
          height: getHeight(context) * .9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 236, 232, 232),
                blurRadius: 5,
                spreadRadius: 1,
                offset: Offset(-5, 5),
              )
            ],
          ),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (_ctx, index) => Container(
                height: getHeight(context) * .20,
                padding: EdgeInsets.symmetric(vertical: kMarginY),
                margin: EdgeInsets.symmetric(
                    horizontal: kMarginX / 3, vertical: kMarginY),
                decoration: BoxDecoration(
                    color: ColorsApp.white,
                    boxShadow: [
                      BoxShadow(
                        color: ColorsApp.primary.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, .5),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: kMarginX,
                      ).add(EdgeInsets.only(bottom: kMarginY / 2)),
                      margin: EdgeInsets.only(bottom: kMarginY * 1.3),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: ColorsApp.greyNew, width: .5))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Dim 07 juil 2024 08:38'),
                          Text(
                            'Douala-Douala',
                          ),
                        ],
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                  height: getHeight(context) * .09,
                                  width: getWidth(context) * .25,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        Assets.login,
                                      ),
                                    ),
                                  ))),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: kMarginX, vertical: kMarginY / 2),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: getWidth(context) * .34,
                                    child: Text('livraison data data',
                                        maxLines: 2,
                                        // overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: ColorsApp.primary,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                  Container(
                                    child: Text('livraison data '.tr(),
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: ColorsApp.greyNew,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  Container(
                                    child: Text('15000 XAF',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: ColorsApp.black,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                ],
                              )),
                        ]),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: kMarginX,
                      ).add(EdgeInsets.only(top: kMarginY / 2)),
                      margin: EdgeInsets.only(top: kMarginY * 1.3),
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: ColorsApp.greyNew, width: .5))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                  child: Icon(
                                Icons.account_circle_sharp,
                                color: ColorsApp.primary,
                              )),
                              Container(
                                margin: EdgeInsets.only(
                                  left: kMarginX / 2,
                                ),
                                child: Text('livraison data data'),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50)),
                            child: Text(
                              'Douala-Douala',
                              style: TextStyle(color: ColorsApp.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ) /* ) */),
          )),
    );
  }
}
