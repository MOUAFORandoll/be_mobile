import 'package:BabanaExpress/presentation/components/Widget/home_option_widget.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';
import 'package:BabanaExpress/utils/constants/assets.dart';

class ShimmerHome extends StatelessWidget {
  const ShimmerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return /*  Shimmer.fromColors(
        baseColor: ColorsApp.grey,
        highlightColor: Colors.blueGrey,
        child: */
        Skeletonizer(
      enabled: true,
      child: Container(
        margin: EdgeInsets.only(
          top: kMarginY,
        ).add(EdgeInsets.symmetric(horizontal: kMarginY)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'Services',
                style: TextStyle(
                    color: ColorsApp.white,
                    fontFamily: 'Lato',
                    fontSize: kTitle * 1.5,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Container(
                height: getHeight(context) * .5,
                child: GridView.count(
                    crossAxisCount: 2, // Two items per row
                    mainAxisSpacing: 28.0, // Spacing between rows
                    crossAxisSpacing: 28.0, // Spacing between columns
                    childAspectRatio: 1,
                    children: [
                      HomeOptionWidget(
                        title: 'Livraison de colis'.tr(),
                        icon: Assets.colis,
                        onTap: () {},
                      ),
                      HomeOptionWidget(
                        title: 'Livraison de medicaments'.tr(),
                        onTap: () {},
                        icon: Assets.p3,
                      ),
                      HomeOptionWidget(
                        title: 'Finances'.tr(),
                        icon: Assets.wallet,
                        arg: '',
                        onTap: () {},
                      ),
                      HomeOptionWidget(
                        icon: Assets.market_place,
                        title: 'Market Place',
                        onTap: () {},
                      ),
                    ])),
          ],
        ),
      ),
    );
  }
}
