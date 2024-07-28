import 'package:BabanaExpress/core.dart';
import 'package:BabanaExpress/routes/app_router.gr.dart';

import 'package:BabanaExpress/utils/constants/assets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

import 'package:get_storage/get_storage.dart';
import 'package:BabanaExpress/application/export_bloc.dart';

@RoutePage()
class OnBoardingPage extends StatelessWidget {
  static const routeName = '/onboarding';
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CarouselController controller = CarouselController();

    return BlocBuilder<AppActionCubit, AppActionState>(
        builder: (context, state) {
      return Scaffold(
          backgroundColor: ColorsApp.second,
          body: SingleChildScrollView(
              child: Stack(
            children: [
              CarouselSlider(
                carouselController: controller,
                items: [
                  AppCarrousselItem(
                    title: 'Livraison de vos colis'.tr(),
                    description: 'cdescription1'.tr(),
                    image: Assets.onb1,
                  ),
                  AppCarrousselItem(
                      title: 'Livraison de vos medicaments'.tr(),
                      description: 'cdescription2'.tr(),
                      image: Assets.onb2,
                      index: state.index),
                  AppCarrousselItem(
                      title: 'Market Place'.tr(),
                      description:
                          'Commandez vos produits sur notre market place et faites vous livrer rapidement peux importe ou vous vous trouvez dans le cameroun'
                              .tr(),
                      image: Assets.onb3,
                      index: state.index)
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
                    height: getHeight(context),
                    // enlargeCenterPage: true,
                    // autoPlay: true,

                    // autoPlayCurve: Curves.fastOutSlowIn,
                    // enableInfiniteScroll: true,
                    viewportFraction: 1.0,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal),
              ),
              Positioned(
                  bottom: getHeight(context) / 10,
                  left: 0,
                  right: 0,
                  child: AppButton(
                    text: state.index == 2 ? 'Continuer' : 'Suivant',
                    textColor: ColorsApp.primary,
                    bgColor: Colors.white,
                    onTap: () {
                      if (state.index == 2) {
                        final AppActionCubit action =
                            BlocProvider.of<AppActionCubit>(context);
                        action.toLogin();

                        AutoRouter.of(context).replaceAll([AuthRoute()]);
                        GetStorage box = sl.get<GetStorage>();
                        box.write('first', 1);
                      } else {
                        print(state.index);

                        context
                            .read<AppActionCubit>()
                            .setIndex(state.index + 1);
                        print(state.index);

                        controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      }
                    },
                  )),
              Positioned(
                  bottom: getHeight(context) / 20,
                  left: 0,
                  right: 0,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: ['0', '1', '2'].asMap().entries.map((entry) {
                        return GestureDetector(
                            onTap: () {
                              controller.animateToPage(
                                entry.key,
                                duration: Duration(seconds: 10),
                                curve: Curves.bounceInOut,
                              );
                            },
                            child: Container(
                              width: state.index == entry.key
                                  ? getWidth(context) / 10
                                  : getHeight(context) / 80,
                              height: getHeight(context) / 80,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: state.index == entry.key
                                      ? Colors.white
                                      : ColorsApp.black.withOpacity(0.2)),
                            ));
                      }).toList(),
                    ),
                  )),
            ],
          )));
    });
  }
}

// 658392349
