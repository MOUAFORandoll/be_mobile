import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart'; 
import 'package:BabanaExpress/application/export_bloc.dart';

class OnBoardingComponent extends StatelessWidget {
  OnBoardingComponent({super.key});

  final CarouselController controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppActionCubit, AppActionState>(
        builder: (context, state) {
      return Container(
          child: Column(
        children: [
          CarouselSlider(
            carouselController: controller,
            items: [
              AppCarrousselItem(
                title: 'Livraison de vos colis'.tr(),
                description: 'cdescription1'.tr(),
                image: Assets.onb1,
              ),
              // AppCarrousselItem(
              //     title: 'Livraison de vos medicaments'.tr(),
              //     description: 'cdescription2'.tr(),
              //     image: Assets.onb2,
              //     index: state.index),
              // AppCarrousselItem(
              //     title: 'Market Place'.tr(),
              //     description:
              //         'Commandez vos produits sur notre market place et faites vous livrer rapidement peux importe ou vous vous trouvez dans le cameroun'
              //             .tr(),
              //     image: Assets.onb3,
              //     index: state.index)
            ],
            options: CarouselOptions(
                aspectRatio: 4 / 4,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                onPageChanged: (index, reason) {
                  print(state.index);
                  context.read<AppActionCubit>().setIndex(index);
                  print(state.index);
                },
                disableCenter: true,
                height: getHeight(context) * .70,
                // enlargeCenterPage: true,
                // autoPlay: true,

                // autoPlayCurve: Curves.fastOutSlowIn,
                // enableInfiniteScroll: true,
                viewportFraction: 1.0,
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal),
          ),
          // Container(
          //   height: getHeight(context) - getHeight(context) * .70,
          // )
          // Positioned(
          //     bottom: getHeight(context) / 20,
          //     left: 0,
          //     right: 0,
          //     child: Container(
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: ['0', '1', '2'].asMap().entries.map((entry) {
          //           return GestureDetector(
          //               onTap: () {
          //                 controller.animateToPage(
          //                   entry.key,
          //                   duration: Duration(seconds: 10),
          //                   curve: Curves.bounceInOut,
          //                 );
          //               },
          //               child: Container(
          //                 width: state.index == entry.key
          //                     ? getWidth(context) / 10
          //                     : getHeight(context) / 80,
          //                 height: getHeight(context) / 80,
          //                 margin: EdgeInsets.symmetric(
          //                     vertical: 10.0, horizontal: 4.0),
          //                 decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(30),
          //                     color: state.index == entry.key
          //                         ? Colors.white
          //                         : ColorsApp.black.withOpacity(0.2)),
          //               ));
          //         }).toList(),
          //       ),
          //     )),
        ],
      ));
    });
  }
}

// 658392349
