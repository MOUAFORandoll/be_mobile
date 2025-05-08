import 'package:BabanaExpress/presentation/components/exportcomponent.dart'; 

class ShimmerMessage extends StatelessWidget {
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
            color: Colors.white,
          ),
          child: ListView.builder(
              // physics: NeverScrollableScrollPhysics(),
              itemCount: 20,
              itemBuilder: (_ctx, index) {
                return Container(
                    width: getWidth(context) * .4,
                    padding: EdgeInsets.symmetric(
                      horizontal: kMarginX,
                    ).add(EdgeInsets.only(bottom: kMarginY / 2)),
                    alignment: index % 2 == 0
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: kMarginY * 1.3),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: ColorsApp.greyNew, width: .5))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Dim 07 juil 2024 08:38'),
                        Text(
                          'Douala-Douala',
                        ),
                      ],
                    ));
              })),
    );
  }
}
